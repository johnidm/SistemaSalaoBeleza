unit Bas.Mensagens;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ImgList,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TFrmMensagem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtnNao: TBitBtn;
    Label1: TLabel;
    ImgAtencao: TImage;
    ImgErro: TImage;
    ImgInformacao: TImage;
    ImgPergunta: TImage;
    BtnOk: TBitBtn;
    BtnSim: TBitBtn;
  private
    { Private declarations }

    procedure AtivarImagem(const ATipo: TMsgDlgType);

  public
    { Public declarations }
    class function Mensagem(const AOwner: TComponent; const ATipo: TMsgDlgType; const AMensagem: string): Integer;

  end;

implementation

{$R *.dfm}

{ TForm1 }



procedure TFrmMensagem.AtivarImagem(const ATipo: TMsgDlgType);



  procedure DefinirPosicao(const AImage: TImage);
  begin
    AImage.Top:= 20;
    AImage.Left:= 20;
  end;



begin
  case ATipo of
    TMsgDlgType.mtWarning:
      begin
        ImgAtencao.Visible:= True;
        DefinirPosicao(ImgAtencao);

        ImgErro.Visible:= False;
        ImgInformacao.Visible:= False;
        ImgPergunta.Visible:= False;

        BtnNao.Visible:= False;
        BtnSim.Visible:= False;
      end;

    TMsgDlgType.mtError:
      begin
        ImgErro.Visible:= True;
        DefinirPosicao(ImgErro);

        ImgAtencao.Visible:= False;
        ImgInformacao.Visible:= False;
        ImgPergunta.Visible:= False;

        BtnNao.Visible:= False;
        BtnOk.Visible:= True;
        BtnSim.Visible:= False;
      end;

    TMsgDlgType.mtInformation:
      begin
        ImgInformacao.Visible:= True;
        DefinirPosicao(ImgInformacao);

        ImgAtencao.Visible:= False;
        ImgErro.Visible:= False;
        ImgPergunta.Visible:= False;

        BtnNao.Visible:= False;
        BtnOk.Visible:= True;
        BtnSim.Visible:= False;

      end;
    TMsgDlgType.mtConfirmation:
      begin
        ImgPergunta.Visible:= True;
        DefinirPosicao(ImgPergunta);

        ImgAtencao.Visible:= False;
        ImgErro.Visible:= False;
        ImgInformacao.Visible:= False;

        BtnOk.Visible:= False;
        BtnNao.Visible:= True;
        BtnSim.Visible:= True;
      end;

    TMsgDlgType.mtCustom:
      begin
        ImgAtencao.Visible:= False;
        ImgErro.Visible:= False;
        ImgInformacao.Visible:= False;
        ImgPergunta.Visible:= False;

        BtnNao.Visible:= False;
        BtnOk.Visible:= True;
        BtnSim.Visible:= False;
      end;
  end;

end;



class function TFrmMensagem.Mensagem(const AOwner: TComponent; const ATipo: TMsgDlgType;
  const AMensagem: string): Integer;
var
  FrmMensagem: TFrmMensagem;

begin

  FrmMensagem:= TFrmMensagem.Create(AOwner);
  try
    case ATipo of
      TMsgDlgType.mtWarning:
        begin
          FrmMensagem.Caption:= 'Aten��o';

        end ;
      TMsgDlgType.mtError:
        begin
          FrmMensagem.Caption:= 'Erro';

        end;
      TMsgDlgType.mtInformation:
        begin
          FrmMensagem.Caption:= 'Informa��o';

        end;
      TMsgDlgType.mtConfirmation:
        begin
          FrmMensagem.Caption:= 'Confirma��o';

        end;
      TMsgDlgType.mtCustom:
        begin
          FrmMensagem.Caption:= EmptyStr;

        end;
    end;

    FrmMensagem.AtivarImagem(ATipo);
    FrmMensagem.Label1.Caption:= AMensagem;
    FrmMensagem.ShowModal;
    Result:= FrmMensagem.ModalResult;

  finally
    FreeAndnil(FrmMensagem);

  end;

end;



end.
