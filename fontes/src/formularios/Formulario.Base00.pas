unit Formulario.Base00;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFrmTelaBase00 = class(TForm)
  private
    { Private declarations }
  protected
    procedure KeyDown( var Key: Word; Shift: TShiftState); override;

  public
    { Public declarations }
  end;

var
  FrmTelaBase00: TFrmTelaBase00;

implementation

{$R *.dfm}

{ TFrmTelaBase00 }



procedure TFrmTelaBase00.KeyDown(var Key: Word; Shift: TShiftState);
begin
  case Ord(Key) of
    VK_RETURN:
      SelectNext( ActiveControl, True, True );

    VK_ESCAPE:
      Close;

  end;
  inherited;

end;



end.
