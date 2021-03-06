unit Modelos.Pesquisa.UF;

interface

uses
  Modelos.Pesquisa.IInterface,
  Modelos.Pesquisa.Tela,
  Vcl.Controls,
  System.SysUtils,
  Vcl.StdCtrls,
  Lib.Funcoes;

type
  TPesquisaUF = class( TInterfacedObject, IBuscaCampo )
  public
    function Buscar(AControle: TWinControl; out ARetorno: Integer): Boolean;

  end;

implementation

{ TPesquisaCliente }

function TPesquisaUF.Buscar(AControle: TWinControl; out ARetorno: Integer): Boolean;
var
  FrmTelaPesquisa: TFrmTelaPesquisa;
begin
  Result:= False;
  FrmTelaPesquisa:= TFrmTelaPesquisa.Create( AControle.Owner );
  try
    FrmTelaPesquisa.Caption:= 'Pesquisa UF';
    FrmTelaPesquisa.AdvEdit1.LabelCaption:= 'UF';

    FrmTelaPesquisa.ComandoSQL:=
      ' select ' + TFuncoes.InserirAspasDuplas('id_uf') + ', ' +
                   TFuncoes.InserirAspasDuplas('ds_uf') +
      '   from ' + TFuncoes.InserirAspasDuplas('ufs') +
      '  where ' + TFuncoes.InserirAspasDuplas('dt_exclusao') + ' is null ';

    with FrmTelaPesquisa do
    begin
      AdicionaMapaCampos( 'id_uf', 'C�digo', 70 );
      AdicionaMapaCampos( 'ds_uf', 'UF', 350  );
    end;
    FrmTelaPesquisa.Preparar;

    FrmTelaPesquisa.DefinirTamanho( 375, 500  );

    FrmTelaPesquisa.CampoLocate:= 'ds_uf';

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
