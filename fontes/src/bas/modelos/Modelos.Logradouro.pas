unit Modelos.Logradouro;

interface

uses
  Modelos.Modelo,
  CustomAtributes.MapaDB;

type
  TLogradouro = class(TModelo)
  private
    FID: Integer;
    FDescricao: string;

  published
    [TMapaDB('logradouros', 'id_logradouro', [atrPesquisa] )]
    property ID: Integer read FID write FID;

    [TMapaDB('logradouros', 'ds_logradouro', [] )]
    property Descricao: string read FDescricao write FDescricao;


  end;

implementation

end.
