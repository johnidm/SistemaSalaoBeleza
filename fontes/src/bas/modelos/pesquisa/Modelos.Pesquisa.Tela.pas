unit Modelos.Pesquisa.Tela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.ExtCtrls, AeroButtons, W7Classes,
  W7Panels, Formulario.Base00, Data.DB, Datasnap.DBClient, Data.FMTBcd,
  Datasnap.Provider, Data.SqlExpr, Bas.SuperClasse;

type
  TFrmTelaPesquisa = class(TFrmTelaBase00)
    W7Panel2: TW7Panel;
    BtnCancelar: TAeroBitBtn;
    BtnOK: TAeroBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    DBAdvGrid1: TDBAdvGrid;
    AdvEdit1: TAdvEdit;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvEdit1Change(Sender: TObject);
    procedure AdvEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBAdvGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    type
      TRMapaCampos = record
        CampoTabela: string;
        DescricaoCampo: string;
        TamanhoColuna: Integer;
      end;
      TMapaCampos= array of TRMapaCampos;

  private
    FComandoSQL: string;
    { Private declarations }

    MapaCampos: TMapaCampos;
    FCampoLocate: string;
    procedure DefinirPosicao( );
  public
    { Public declarations }
    property CampoLocate: string read FCampoLocate write FCampoLocate;
    property ComandoSQL: string read FComandoSQL write FComandoSQL;
    procedure AdicionaMapaCampos(const ANomeCampo: string; const ADescricaoCampo: string; const ATamanhoColuna: Integer);

    procedure DefinirTamanho( const AHeigth, AWidth: Integer);
    procedure Preparar( );
  end;


implementation

{$R *.dfm}

procedure TFrmTelaPesquisa.AdicionaMapaCampos(const ANomeCampo: string; const ADescricaoCampo: string; const ATamanhoColuna: Integer);
var
  iTamanho: Integer;
begin
  iTamanho:= Length(MapaCampos);
  SetLength( MapaCampos, iTamanho + 1 );

  MapaCampos[ iTamanho ].CampoTabela:= ANomeCampo;
  MapaCampos[ iTamanho ].DescricaoCampo:= ADescricaoCampo;
  MapaCampos[ iTamanho ].TamanhoColuna:= ATamanhoColuna;

end;



procedure TFrmTelaPesquisa.AdvEdit1Change(Sender: TObject);
begin
  inherited;
  ClientDataSet1.Locate( CampoLocate, AdvEdit1.Text, [ loPartialKey ] )
end;



procedure TFrmTelaPesquisa.AdvEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ( Key = 38 ) then
    ClientDataSet1.Prior
  else if ( Key = 40 ) then
    ClientDataSet1.Next
  else if ( Key = VK_RETURN ) then
    BtnOK.Click;
end;



procedure TFrmTelaPesquisa.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;



procedure TFrmTelaPesquisa.BtnOKClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;



procedure TFrmTelaPesquisa.DBAdvGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_RETURN ) then
    BtnOK.Click;

end;



procedure TFrmTelaPesquisa.DefinirPosicao;
begin
  Position:= poDesigned;
  Top:= Sistema.DimencoesAberturaTela.AlturaConteiner + 20;
  Left:= Sistema.DimencoesAberturaTela.LarguraPadrao + Sistema.DimencoesAberturaTela.DistanciaEsquerda
  - Width - 20;
end;



procedure TFrmTelaPesquisa.DefinirTamanho(const AHeigth, AWidth: Integer);
begin
  Height:= AHeigth;
  Width:= AWidth;


  DefinirPosicao;
end;



procedure TFrmTelaPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  SQLDataSet1.SQLConnection:= Sistema.ConexaoDB;

end;



procedure TFrmTelaPesquisa.Preparar;
var
  Columns: TCollectionItem;
  iIndice: Integer;

  {
  InfoCampo: TRMapaCampos;

  function RetornarInfoCampo(const ACampoDB: string): TRMapaCampos;
  var
    iIndice: Integer;
  begin
    for iIndice:= Low( MapaCampos ) to High( MapaCampos ) do
    begin
      if ( ACampoDB = MapaCampos[ iIndice ].CampoTabela ) then
      begin
        Result:= MapaCampos[ iIndice ];
        Break;
      end;
    end;
  end;
  }
begin
  ClientDataSet1.Close;
  SQLDataSet1.CommandText:= ComandoSQL;
  ClientDataSet1.Open;

  for iIndice:= 1 to Pred(DBAdvGrid1.Columns.Count) do
  begin
    DBAdvGrid1.Columns.Items[ iIndice ].Header:= MapaCampos[ iIndice -1 ].DescricaoCampo;
    DBAdvGrid1.Columns.Items[ iIndice ].Width:= MapaCampos[ iIndice -1 ].TamanhoColuna;
  end;
end;

end.
