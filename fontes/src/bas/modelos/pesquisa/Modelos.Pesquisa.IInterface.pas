unit Modelos.Pesquisa.IInterface;

interface

uses
  Vcl.Controls;

type
  // Utilizado na tela de pesquisa
  IBuscaCampo = interface
    function Buscar(AControle: TWinControl; out ARetorno: Integer): Boolean;
  end;



implementation

{ TModeloPesquisa }



end.
