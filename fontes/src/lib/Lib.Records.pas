(*
Descrição:
  Unidade utilizada para declarar tipo de dados RECORDS

Histórico de alterações:
  v1.00  - 03/06/2012
    - Incluído o recrod TDimencoesAberturaTela
*)

unit Lib.Records;

interface

type
  ///  <summary>
  ///    Armazena as informações de tamanhos da área de trabalho para abrir os
  //     formulários no sistema.
  ///  <summary>
  TDimencoesAberturaTela = record
    AlturaConteiner: Integer;
    DistanciaEsquerda: Integer;
    LarguraPadrao: Integer;
    AlturaPadrao: Integer;
  end;

  TRMapaCamposPropriedades = record
    Campo: string;
    Propriedade: string;

    constructor Add(const ACampo, APropriedade: string);
  end;
  TMapaCamposPropriedades = array of TRMapaCamposPropriedades;

implementation

{ TRMapaCamposPropriedades }

constructor TRMapaCamposPropriedades.Add(const ACampo, APropriedade: string);
begin
  Campo:= ACampo;
  Propriedade:= APropriedade;
end;

end.
