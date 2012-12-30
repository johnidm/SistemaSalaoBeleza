unit Formulario.CadastroLogradouro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Formulario.Base01, Vcl.StdCtrls, AeroButtons,
  W7Classes, W7Panels, AdvEdit, AdvEdBtn, Modelos.Logradouro;

type
  TFrmCadastroLogradouros = class(TFrmTelaBase01)
    EdtCodigo: TAdvEditBtn;
    EdtDescricao: TAdvEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

    Logradouro: TLogradouro;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmCadastroLogradouros.FormCreate(Sender: TObject);
begin
  inherited;

  Logradouro:= TLogradouro.Create;

  BtnExcluir.Enabled:= False;

end;

procedure TFrmCadastroLogradouros.FormDestroy(Sender: TObject);
begin
  inherited;

  if ( Assigned( Logradouro ) ) then
    FreeAndNil( Logradouro );

end;

end.
