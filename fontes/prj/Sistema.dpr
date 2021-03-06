program Sistema;

uses
  Vcl.Forms,
  Principal in '..\src\Principal.pas' {FrmPrincipal},
  Formulario.Inicial in '..\src\formularios\Formulario.Inicial.pas' {FrmTelaInicial},
  Formulario.Base01 in '..\src\formularios\Formulario.Base01.pas' {FrmTelaBase01},
  Formulario.Login in '..\src\formularios\Formulario.Login.pas' {FrmTelaLogin},
  Formulario.Base00 in '..\src\formularios\Formulario.Base00.pas' {FrmTelaBase00},
  Lib.Records in '..\src\lib\Lib.Records.pas',
  Lib.Funcoes in '..\src\lib\Lib.Funcoes.pas',
  Formulario.Base02 in '..\src\formularios\Formulario.Base02.pas' {FrmTelaBase02},
  Formulario.CadastroClientes in '..\src\formularios\Formulario.CadastroClientes.pas' {FrmTelaCadastroClientes},
  Bas.SuperClasse in '..\src\bas\Bas.SuperClasse.pas',
  Hlp.VersaoExecutavel in '..\src\hlp\Hlp.VersaoExecutavel.pas',
  Formulario.AgendarHorarios in '..\src\formularios\Formulario.AgendarHorarios.pas' {FrmTelaAgendaHorario},
  Formulario.LancarAgendaHorario in '..\src\formularios\Formulario.LancarAgendaHorario.pas' {FrmTelaLancarAgendaHorario},
  Formulario.Sobre in '..\src\formularios\Formulario.Sobre.pas' {FrmTelaSobre},
  Modelos.Cliente in '..\src\bas\modelos\Modelos.Cliente.pas',
  Modelos.AgendamentoOnLine in '..\src\bas\modelos\Modelos.AgendamentoOnLine.pas',
  Modelos.Bairro in '..\src\bas\modelos\Modelos.Bairro.pas',
  Modelos.EnderecoCliente in '..\src\bas\modelos\Modelos.EnderecoCliente.pas',
  Modelos.Logradouro in '..\src\bas\modelos\Modelos.Logradouro.pas',
  Modelos.Profissao in '..\src\bas\modelos\Modelos.Profissao.pas',
  Modelos.UF in '..\src\bas\modelos\Modelos.UF.pas',
  Modelos.Usuario in '..\src\bas\modelos\Modelos.Usuario.pas',
  CustomAtributes.MapaDB in '..\src\bas\customatributes\CustomAtributes.MapaDB.pas',
  Generics.SQL in '..\src\bas\generics\Generics.SQL.pas',
  Modelos.Modelo in '..\src\bas\modelos\Modelos.Modelo.pas',
  Hlp.ConexaoDB in '..\src\hlp\Hlp.ConexaoDB.pas',
  Bas.AutoIncremento in '..\src\bas\Bas.AutoIncremento.pas',
  Formulario.Teste in '..\src\formularios\Formulario.Teste.pas' {FrmTeste},
  CadastroClientes in '..\src\bas\controlador\CadastroClientes.pas',
  Bas.Mensagens in '..\src\bas\Bas.Mensagens.pas' {FrmMensagem},
  Lib.Recursos in '..\src\lib\Lib.Recursos.pas',
  Modelos.Municipio in '..\src\bas\modelos\Modelos.Municipio.pas',
  Lib.Out.Wcrypt2 in '..\src\lib\out\Lib.Out.Wcrypt2.pas',
  Modelos.Profissional in '..\src\bas\modelos\Modelos.Profissional.pas',
  Formulario.CadastroProfissionais in '..\src\formularios\Formulario.CadastroProfissionais.pas' {FrmCadastroProfissionais},
  Hlp.Exceptions in '..\src\hlp\Hlp.Exceptions.pas',
  Formulario.CadastroProfissoes in '..\src\formularios\Formulario.CadastroProfissoes.pas' {FrmCadastroProfissoes},
  Formulario.CadastroBairros in '..\src\formularios\Formulario.CadastroBairros.pas' {FrmCadastroBairros},
  Formulario.CadastroLogradouro in '..\src\formularios\Formulario.CadastroLogradouro.pas' {FrmCadastroLogradouros},
  Formulario.CadastroMunicipios in '..\src\formularios\Formulario.CadastroMunicipios.pas' {FrmCadastroMunicipios},
  Formulario.CadastroUF in '..\src\formularios\Formulario.CadastroUF.pas' {FrmCadastroUF},
  Modelos.Pesquisa.Bairros in '..\src\bas\modelos\pesquisa\Modelos.Pesquisa.Bairros.pas',
  Modelos.Pesquisa.Cliente in '..\src\bas\modelos\pesquisa\Modelos.Pesquisa.Cliente.pas',
  Modelos.Pesquisa.IInterface in '..\src\bas\modelos\pesquisa\Modelos.Pesquisa.IInterface.pas',
  Modelos.Pesquisa.Logradouro in '..\src\bas\modelos\pesquisa\Modelos.Pesquisa.Logradouro.pas',
  Modelos.Pesquisa.Municipio in '..\src\bas\modelos\pesquisa\Modelos.Pesquisa.Municipio.pas',
  Modelos.Pesquisa.Profissao in '..\src\bas\modelos\pesquisa\Modelos.Pesquisa.Profissao.pas',
  Modelos.Pesquisa.Tela in '..\src\bas\modelos\pesquisa\Modelos.Pesquisa.Tela.pas' {FrmTelaPesquisa},
  Modelos.Pesquisa.UF in '..\src\bas\modelos\pesquisa\Modelos.Pesquisa.UF.pas',
  Hlp.CapturaWebCam in '..\src\hlp\Hlp.CapturaWebCam.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.MainFormOnTaskbar := True;

  Application.OnException:= TExceptions.SistemaOnException;

  ReportMemoryLeaksOnShutdown:= True;

  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;

end.
