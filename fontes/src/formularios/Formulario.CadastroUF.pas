unit Formulario.CadastroUF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvEdit,
  AdvEdBtn, AeroButtons, W7Classes, W7Panels, Modelos.UF, Formulario.Base01,
  Modelos.Pesquisa.UF;

type
  TFrmCadastroUF = class(TFrmTelaBase01)
    EdtCodigo: TAdvEditBtn;
    EdtDescricaoCompleta: TAdvEdit;
    EdtDescricao: TAdvEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodigoClickBtn(Sender: TObject);
  private
    { Private declarations }
    UF: TUF;
  public
    { Public declarations }
  end;



implementation

{$R *.dfm}

procedure TFrmCadastroUF.EdtCodigoClickBtn(Sender: TObject);
begin
  inherited;

  UF.BuscarCampo( TPesquisaUF.Create(), EdtCodigo );
end;

procedure TFrmCadastroUF.FormCreate(Sender: TObject);
begin
  inherited;

  UF:= TUF.Create();

  BtnExcluir.Enabled:= False;

end;



procedure TFrmCadastroUF.FormDestroy(Sender: TObject);
begin
  inherited;

  if ( Assigned( UF ) ) then
    FreeAndNil( UF )

end;

end.
