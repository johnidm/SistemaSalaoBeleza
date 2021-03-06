unit Modelos.AgendamentoOnLine;

interface

uses
  Modelos.Modelo,
  CustomAtributes.MapaDB;

type
  TAgendamentoOnLine = class(TModelo)
  private
    type
      TEstado = (estAtivo = Ord('A'), estInativo = Ord('I'));

  private
    FID: Integer;
    FCodigo: Integer;
    FEstado: TEstado;
    FEMail: string;
    FSenha: string;
    FUsuario: Integer;

  published
    [TMapaDB('agendamentoonline', 'id_agendamentoonline', [atrPesquisa]) ]
    property ID: Integer read FID write FID;

    [TMapaDB('agendamentoonline', 'fl_agendamentoonline', [atrNenhum]) ]
    property Estado: TEstado read FEstado write FEstado;

    [TMapaDB('agendamentoonline', 'tx_agendamentoonlineemail', [atrNenhum]) ]
    property EMail: string read FEMail write FEMail;

    [TMapaDB('agendamentoonline', 'sn_agendamentoonlinesenha', [atrNenhum]) ]
    property Senha: string read FSenha write FSenha;

    [TMapaDB('agendamentoonline', 'cd_usuario', [atrNenhum])]
    property Usuario: Integer read FUsuario write FUsuario;
  end;

implementation

end.
