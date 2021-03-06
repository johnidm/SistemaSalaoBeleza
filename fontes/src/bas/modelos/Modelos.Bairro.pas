unit Modelos.Bairro;

interface

uses
  Modelos.Modelo,
  CustomAtributes.MapaDB;

type
  TBairro = class(TModelo)
  private
    FID: Integer;
    FDescricao: string;

  published
    [TMapaDB('bairros', 'id_bairro', [atrPesquisa] )]
    property ID: Integer read FID write FID;

    [TMapaDB('bairros', 'ds_bairro', [] )]
    property Descricao: string read FDescricao write FDescricao;
  end;

implementation

end.
