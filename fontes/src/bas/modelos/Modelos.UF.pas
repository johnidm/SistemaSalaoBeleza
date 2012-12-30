unit Modelos.UF;

interface

uses
  Modelos.Modelo,
  CustomAtributes.MapaDB;

type
  TUF = class(TModelo)
  private
    FID: Integer;
    FUF: string;
    FDescricao: string;
    FDescricaoCompleta: string;
  published
    [TMapaDB('ufs', 'id_uf', [atrPesquisa] )]
    property ID: Integer read FID write FID;

    [TMapaDB('ufs', 'ds_uf', [] )]
    property Descricao: string read FDescricao write FDescricao;

    [TMapaDB('ufs', 'ds_completa_uf', [] )]
    property DescricaoCompleta: string read FDescricaoCompleta write FDescricaoCompleta;

  end;

implementation

end.
