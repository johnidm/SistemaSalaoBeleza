unit Formulario.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Buttons, AeroButtons, Vcl.ImgList,
  Formulario.Base00, Lib.Funcoes, Bas.SuperClasse;


type
  TFrmTelaLogin = class(TFrmTelaBase00)
    img1: TImage;
    LblVersaoExecutavel: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image2: TImage;
    Image3: TImage;
    EdtSenha: TEdit;
    EdtUsuario: TEdit;
    BtnLogin: TAeroBitBtn;
    BtnSair: TAeroBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnLoginClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


{ TFrmTelaLogin }



procedure TFrmTelaLogin.BtnLoginClick(Sender: TObject);
begin
  inherited;
           {
  if (not EfetuarLogin(  )) then
  begin

    Exit;
  end;
            }
  Sistema.Logado:= True;
  Close;
end;

procedure TFrmTelaLogin.BtnSairClick(Sender: TObject);
begin
  inherited;
  Close;
  Application.Terminate;
end;

procedure TFrmTelaLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (not(Sistema.Logado)) then
    Application.Terminate
end;



procedure TFrmTelaLogin.FormShow(Sender: TObject);
begin
  LblVersaoExecutavel.Caption:=
    TFuncoes.FormatarDescricaoVersaoExecutavel;
end;



end.
