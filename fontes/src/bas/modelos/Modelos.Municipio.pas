unit Modelos.Municipio;

interface


uses
  Modelos.Modelo,
  CustomAtributes.MapaDB;


type
  TMunicipio = class(TModelo)
  private
    FDescricao: string;
    FDataExclusao: TDateTime;
    FID: Integer;
    FDataManutencao: TDateTime;
    FDataCadastro: TDateTime;
    FUsuario: Integer;
  published
    [TMapaDB('municipios', 'id_municipio', [atrPesquisa] )]
    property ID: Integer read FID write FID;

    [TMapaDB('municipios', 'ds_municipio', [] )]
    property Descricao: string read FDescricao write FDescricao;

    [TMapaDB('municipios', 'dt_cadastro', [] )]
    property DataCadastro: TDateTime read FDataCadastro write FDataCadastro;

    [TMapaDB('municipios', 'dt_manutencao', [] )]
    property DataManutencao: TDateTime read FDataManutencao write FDataManutencao;

    [TMapaDB('municipios', 'dt_exclusao', [] )]
    property DataExclusao: TDateTime read FDataExclusao write FDataExclusao;

    [TMapaDB('municipios', 'cd_usuario', [] )]
    property Usuario: Integer read FUsuario write FUsuario;
  end;



implementation

end.
