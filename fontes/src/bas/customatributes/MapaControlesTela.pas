unit MapaControlesTela;

interface

uses
  Vcl.Controls;

type
  TMapaControlesTela= class(TCustomAttribute)
  private
    FControleTela: TWinControl;

  published
    property ControleTela: TWinControl read FControleTela write FControleTela;
    constructor Create(const AControleTela: TWinControl);

  end;

implementation

{ TMapaControlesTela }

constructor TMapaControlesTela.Create(const AControleTela: TWinControl);
begin
  FControleTela:= AControleTela;
end;

end.
