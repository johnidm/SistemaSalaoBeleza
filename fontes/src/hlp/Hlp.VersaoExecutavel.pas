(*
Descri��o:
  Fun��es que retornan informa��es da sobre o aplicativo

Hist�rico de altera��es:
  v1.00  - 03/06/2012
    - Unidade criada com a classe VersaoExecutavel e as fun��es InformacaoExecutavel e VersaoExecutavel.
    - A fun��o InformacaoExecutavel n�o esta sendo utilizada.
*)

unit Hlp.VersaoExecutavel;

interface

uses
  SysUtils, Forms, Windows;

type
  TVersaoExecutavel = class
  public
    type
      TInformacoesExecutavel = ( infexeCompanyName, infexeFileDescription,
        infexeFileVersion, infexeInternalName, infexeLegalCopyright,
        infexeLegalTradeMarks, infexeOriginalFilename, infexeProductName,
        infexeProductVersion, infexeComments, infexeAuthor );
  private
    const
      VERSAO_INFORMACAO: array[TInformacoesExecutavel] of string = ('CompanyName',
        'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright',
        'LegalTradeMarks', 'OriginalFilename', 'ProductName', 'ProductVersion',
        'Comments', 'Author');
  public
    class function InformacaoExecutavel(const ATipoDeInformacao: TInformacoesExecutavel): string;

    class function VersaoExecutavel(const AExecutavel: string): string;
  end;

implementation

{ TVersaoExecutavel }



class function TVersaoExecutavel.InformacaoExecutavel(
  const ATipoDeInformacao: TInformacoesExecutavel): string;

const
  ROOT: LPCTSTR = 'StringFileInfo\041604E4\%s';

var
  dwVersaoInfoTamanho, dwHandle: DWORD;

  lptstrNomeArquivo: LPTSTR;

  pBuffer: PChar;
  lplpValor: LPVOID;
  puTamanhoCaractereValor: UINT;

begin
  lptstrNomeArquivo:= PChar( Application.ExeName );

  dwVersaoInfoTamanho:= GetFileVersionInfoSize( PChar( lptstrNomeArquivo ),
    dwHandle );

  if (dwVersaoInfoTamanho > 0) then
  begin
    pBuffer:= AllocMem(dwVersaoInfoTamanho);
    try
      if (VerQueryValue( ( pBuffer ), PWideChar( Format(ROOT, [ VERSAO_INFORMACAO[ATipoDeInformacao] ] ) ),
         Pointer ( lplpValor ),  puTamanhoCaractereValor ) )  then
        Result:= Trim( String( lplpValor ) )
      else
        //Debug('Versao nao encontrada');
    finally
      FreeMem(pBuffer, dwVersaoInfoTamanho);
    end;
  end;
end;




class function TVersaoExecutavel.VersaoExecutavel(
  const AExecutavel: string): string;
var
  dwVersionInfoSize, dwDummy: DWORD;
  pBlock, lplpBuffer: Pointer;

begin
  dwVersionInfoSize:= GetFileVersionInfoSize(PChar ( AExecutavel ), dwDummy);
  if (dwVersionInfoSize > 0) then
  begin
    GetMem(pBlock, dwVersionInfoSize);
    try
      GetFileVersionInfo (PChar (AExecutavel), 0, dwVersionInfoSize, pBlock);
      if ( VerQueryValue( pBlock, '\', lplpBuffer, dwDummy ) ) then
      begin
        with TVSFixedFileInfo (lplpBuffer^) do
        begin
          Result:=
            IntToStr (HiWord (dwFileVersionMS)) + '.' +
            IntToStr (LoWord (dwFileVersionMS)) + '.' +
            IntToStr (HiWord (dwFileVersionLS)) + '.' +
            IntToStr (LoWord (dwFileVersionLS));
        end;
      end;
    finally
      FreeMem(pBlock)
    end;
  end;
end;

end.

