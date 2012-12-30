unit Formulario.CadastroProfissoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Formulario.Base01, Vcl.StdCtrls, AeroButtons,
  W7Classes, W7Panels, AdvEdit, AdvEdBtn, Modelos.Profissao,
  Modelos.Pesquisa.Profissao;

type
  TFrmCadastroProfissoes = class(TFrmTelaBase01)
    EdtCodigo: TAdvEditBtn;
    EdtDescricao: TAdvEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EdtCodigoClickBtn(Sender: TObject);
  private
    { Private declarations }


    Profissao: TProfissao;
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TFrmCadastroProfissoes.EdtCodigoClickBtn(Sender: TObject);
begin
  inherited;

  Profissao.BuscarCampo( TPesquisaProfissao.Create(), EdtCodigo );
end;

procedure TFrmCadastroProfissoes.FormCreate(Sender: TObject);
begin
  inherited;

  Profissao:= TProfissao.Create();

  BtnExcluir.Enabled:= False;
end;

procedure TFrmCadastroProfissoes.FormDestroy(Sender: TObject);
begin
  inherited;

  if ( Assigned( Profissao ) ) then
    FreeAndNil( Profissao );

end;

end.
