unit Hlp.CapturaWebCam;

interface

uses
  Winapi.Windows;


  function capCreateCaptureWindowA(lpszWindowName: pchar; dwStyle: dword; x, y,
    nWidth, nHeight: word; ParentWin: dword; nId: word): dword; stdcall external 'avicap32.dll';

type
  TCapturaImagemWebCam = class
  public
    class function CapturaImagem(const ADiretorio: string): Boolean;

  end;

var
  HwebCam: HWND;

implementation

class function TCapturaImagemWebCam.CapturaImagem(const ADiretorio: string) : Boolean;
const
  WM_WEBCAM = $400;
  WM_CONECTAR_DRIVER_WEBCAM = WM_WEBCAM + $a;
  WM_DESCONECTAR_DRIVER_WEBCAM = WM_WEBCAM + $b;
  WM_GUARDAR_CAPTURA = WM_WEBCAM + 25;
  WM_FECHAR_WEBCAM = $0010;
begin

  if HwebCam = 0 then
  begin //WS_CHILD //WS_VISIBLE
    HwebCam := capCreateCaptureWindowA('CaptureWindow', $40000000 and $10000000, 0, 0, 0, 0, GetDesktopWindow, 0);
    if SendMessage(HwebCam, WM_CONECTAR_DRIVER_WEBCAM, 0, 0) <> 1 then
    begin
      HwebCam := 0;
      Result := False;
    end else
    begin
      SendMessage(HwebCam, WM_GUARDAR_CAPTURA, wparam(0), lparam(PChar( ADiretorio )));
      SendMessage(HwebCam, WM_FECHAR_WEBCAM, 0, 0);
      SendMessage(HwebCam, WM_FECHAR_WEBCAM, 0, 0);
      HwebCam := 0;
      Result := True;
    end;
  end else
    Result := False;
end;


end.

{



Procedure Capturar;
Const
Captura = 'C:\Users\Joel\Desktop\WebCam Captura.bmp';
begin
if not CapturarWebCam(Captura) then
MessageBox(0,Pchar('Não foi possivél capturar a webcam'#10''),'Erro',16);
end;

}