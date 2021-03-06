unit Hlp.Exceptions;

interface

uses
  System.SysUtils, Bas.Mensagens, Vcl.Dialogs;

type
  TExceptions = class


  public
    class procedure SistemaOnException(Sender: TObject;
      E: Exception);
  end;




implementation

{ TExceptions }

class procedure TExceptions.SistemaOnException(Sender: TObject; E: Exception);
begin
  TFrmMensagem.Mensagem( nil, mtError,
    'Falha geral no sistema' + #13#10 + #13#10 +

    E.Message + #13#10 + #13#10 +

    'Entre em contato com o administrador do sistema'
  );
end;



end.
