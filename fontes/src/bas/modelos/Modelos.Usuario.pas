unit Modelos.Usuario;

interface

uses
  Modelos.Modelo,
  CustomAtributes.MapaDB;

type
  TUsuarios = class(TModelo)
  private
    FID: Integer;
    FNome: string;
    FLogin: string;
    FSenha: string;

  published
    [TMapaDB('usuarios', 'id_usuario', [atrPesquisa] )]
    property ID: Integer read FID write FID;

    [TMapaDB('usuarios', 'nm_usuario', [] )]
    property Nome: string read FNome write FNome;

    [TMapaDB('usuarios', 'tx_login', [] )]
    property Login: string read FLogin write FLogin;

    [TMapaDB('usuarios', 'sn_senha', [] )]
    property Senha: string read FSenha write FSenha;
  end;


implementation

end.
