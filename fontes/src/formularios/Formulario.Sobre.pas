unit Formulario.Sobre;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Formulario.Base01,
  Vcl.StdCtrls,
  AeroButtons,
  W7Classes,
  W7Panels,
  Vcl.ExtCtrls, Hlp.VersaoExecutavel;

type
  TFrmTelaSobre = class(TFrmTelaBase01)
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    LblVersao: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    LinkLabel1: TLinkLabel;
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmTelaSobre.FormShow(Sender: TObject);
begin

  inherited;

  LblVersao.Caption:= 'Vers�o ' + TVersaoExecutavel.VersaoExecutavel( Application.ExeName )

end;

end.
