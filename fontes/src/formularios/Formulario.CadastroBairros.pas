unit Formulario.CadastroBairros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Formulario.Base01, Vcl.StdCtrls, AeroButtons,
  W7Classes, W7Panels, AdvEdit, AdvEdBtn, Modelos.Bairro,
  Modelos.Pesquisa.Bairros;

type
  TFrmCadastroBairros = class(TFrmTelaBase01)
    EdtDescricao: TAdvEdit;
    EdtCodigo: TAdvEditBtn;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodigoClickBtn(Sender: TObject);
  private
    { Private declarations }

    Bairro: TBairro;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmCadastroBairros.EdtCodigoClickBtn(Sender: TObject);
begin
  inherited;
  Bairro.BuscarCampo( TPesquisaBairro.Create( ), EdtCodigo )
end;

procedure TFrmCadastroBairros.FormCreate(Sender: TObject);
begin
  inherited;

  Bairro:= TBairro.Create();

  BtnExcluir.Enabled:= False;
end;



procedure TFrmCadastroBairros.FormDestroy(Sender: TObject);
begin
  inherited;

  if (Assigned ( Bairro ) ) then
    FreeAndNil( Bairro );
end;

end.
