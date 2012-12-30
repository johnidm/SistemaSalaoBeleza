unit Modelos.Pesquisa.Logradouro;

interface

uses
  Modelos.Pesquisa.IInterface,
  Modelos.Pesquisa.Tela,
  Vcl.Controls,
  System.SysUtils,
  Vcl.StdCtrls,
  Lib.Funcoes;

type
  TPesquisaLogradouro = class( TInterfacedObject, IBuscaCampo )
  public
    function Buscar(AControle: TWinControl; out ARetorno: Integer): Boolean;

  end;

implementation

{ TPesquisaCliente }

function TPesquisaLogradouro.Buscar(AControle: TWinControl; out ARetorno: Integer): Boolean;
var
  FrmTelaPesquisa: TFrmTelaPesquisa;
begin
  Result:= False;
  FrmTelaPesquisa:= TFrmTelaPesquisa.Create( AControle.Owner );
  try
    FrmTelaPesquisa.Caption:= 'Pesquisa Logradouros';
    FrmTelaPesquisa.AdvEdit1.LabelCaption:= 'Logradouro';

    FrmTelaPesquisa.ComandoSQL:=
      ' select ' + TFuncoes.InserirAspasDuplas('id_logradouro') + ', ' +
                   TFuncoes.InserirAspasDuplas('ds_logradouro') +
      '   from ' + TFuncoes.InserirAspasDuplas('logradouros') +
      '  where ' + TFuncoes.InserirAspasDuplas('dt_exclusao') + ' is null ';

    with FrmTelaPesquisa do
    begin
      AdicionaMapaCampos( 'id_logradouro', 'Código', 70 );
      AdicionaMapaCampos( 'ds_logradouro', 'Logradouro', 350  );
    end;
    FrmTelaPesquisa.Preparar;

    FrmTelaPesquisa.DefinirTamanho( 375, 500  );

    FrmTelaPesquisa.CampoLocate:= 'ds_logradouro';

    FrmTelaPesquisa.ShowModal;
    if (FrmTelaPesquisa.ModalResult = mrOk) then
    begin
      ARetorno:= FrmTelaPesquisa.ClientDataSet1.Fields[0].Value;

      Result:= True;
    end;
  finally
    FreeAndNil(FrmTelaPesquisa);
  end;
end;

end.
