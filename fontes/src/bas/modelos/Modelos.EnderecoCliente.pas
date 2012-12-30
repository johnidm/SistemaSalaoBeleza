unit Modelos.EnderecoCliente;

interface

uses
  Modelos.Modelo,
  CustomAtributes.MapaDB;

type
  TEnderecoCliente = class(TModelo)
  private
    FID: Integer;
    FLogradouro: Integer;
    FNumeroLogradouro: String;
    FBairro: Integer;
    FComplementoLogradouro: string;
    FCidade: Integer;
    FCEP: Integer;
    FUF: Integer;
    FUsuario: Integer;

  published
    [TMapaDB('enderecocliente', 'id_enderecocliente', [atrPesquisa] )]
    property ID: Integer read FID write FID;

    [TMapaDB('enderecocliente', 'cd_logradouro', [] )]
    property Logradouro: Integer read FLogradouro write FLogradouro;

    [TMapaDB('enderecocliente', 'tx_numero_logradouro', [] )]
    property NumeroLogradouro: String read FNumeroLogradouro write FNumeroLogradouro;

    [TMapaDB('enderecocliente', 'cd_bairro', [] )]
    property Bairro: Integer read FBairro write FBairro;

    [TMapaDB('enderecocliente', 'tx_complemento_logradouro', [] )]
    property ComplementoLogradouro: string read FComplementoLogradouro write FComplementoLogradouro;

    [TMapaDB('enderecocliente', 'cd_municipio', [] )]
    property Municipio: Integer read FCidade write FCidade;

    [TMapaDB('enderecocliente', 'nu_cep', [] )]
    property CEP: Integer read FCEP write FCEP;

    [TMapaDB('enderecocliente', 'cd_uf', [] )]
    property UF: Integer read FUF write FUF;

    [TMapaDB('enderecocliente', 'cd_usuario', [atrNenhum])]
    property Usuario: Integer read FUsuario write FUsuario;

  end;

implementation

end.
