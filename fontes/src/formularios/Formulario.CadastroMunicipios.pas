unit Formulario.CadastroMunicipios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Formulario.Base01, Vcl.StdCtrls, AdvEdit,
  AdvEdBtn, AeroButtons, W7Classes, W7Panels, Modelos.Municipio,
  Modelos.Pesquisa.Municipio;

type
  TFrmCadastroMunicipios = class(TFrmTelaBase01)
    EdtCodigo: TAdvEditBtn;
    EdtDescricao: TAdvEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EdtCodigoClickBtn(Sender: TObject);
  private
    { Private declarations }

    Municipio: TMunicipio;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmCadastroMunicipios.EdtCodigoClickBtn(Sender: TObject);
begin
  inherited;

  Municipio.BuscarCampo( TPesquisaMunicipio.Create(), EdtCodigo )

end;

procedure TFrmCadastroMunicipios.FormCreate(Sender: TObject);
begin
  inherited;

  Municipio:= TMunicipio.Create();

  BtnExcluir.Enabled:= False;
end;

procedure TFrmCadastroMunicipios.FormDestroy(Sender: TObject);
begin
  inherited;

  if ( Assigned( Municipio ) ) then
    FreeAndNil( Municipio );
end;

end.
