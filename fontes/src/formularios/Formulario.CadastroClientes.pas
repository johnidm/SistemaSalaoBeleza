unit Formulario.CadastroClientes;

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
  Vcl.StdCtrls,
  W7Classes, W7Panels,
  AdvEdit, AdvEdBtn, AdvDateTimePicker, AeroButtons,
  Vcl.Mask,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Data.DB,
  Formulario.Base01, Vcl.ImgList,
  Modelos.Cliente,
  Modelos.Bairro,
  Modelos.Profissao,
  Modelos.UF,
  Modelos.AgendamentoOnLine,
  Modelos.EnderecoCliente,
  Modelos.Pesquisa.Profissao,
  Modelos.Pesquisa.UF,
  Modelos.Pesquisa.Municipio,
  Lib.Funcoes,
  Vcl.Imaging.jpeg,
  Modelos.Logradouro,
  Modelos.Municipio,
  Modelos.Modelo,
  Modelos.Pesquisa.Cliente,
  Modelos.Pesquisa.Bairros, Modelos.Pesquisa.Logradouro;

type
  TFrmTelaCadastroClientes = class(TFrmTelaBase01)
    Panel2: TPanel;
    GrpFoto: TGroupBox;
    ImgFoto: TImage;
    EdtLogradouroBairro: TAdvEditBtn;
    EdtMunicipio: TAdvEditBtn;
    EdtProfissao: TAdvEditBtn;
    EdtUF: TAdvEditBtn;
    EdtLogradouroComplemento: TAdvEdit;
    EdtMSN: TAdvEdit;
    EdtLogradouroNumero: TAdvEdit;
    EdtCEP: TAdvMaskEdit;
    EdtTelefoneCelular: TAdvMaskEdit;
    EdtTelefoneResidencial: TAdvMaskEdit;
    EdtTelefoneComercial: TAdvMaskEdit;
    GrpObservacao: TGroupBox;
    MnmObservacao: TMemo;
    GrpAgendamentoOnLine: TGroupBox;
    EdtEMail: TAdvEdit;
    EdtSenha: TAdvEdit;
    EdtCodigo: TAdvEditBtn;
    EdtNome: TAdvEdit;
    EdtDataNascimento: TAdvDateTimePicker;
    ImageList2: TImageList;
    BtnWebCamCapturar: TAeroBitBtn;
    BtnWebCamExcluir: TAeroBitBtn;
    BtnAtivarDesativarCadOnLine: TAeroButton;
    EdtLogradouro: TAdvEditBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AeroBitBtn3Click(Sender: TObject);
    procedure AeroBitBtn2Click(Sender: TObject);
    procedure EdtCodigoClickBtn(Sender: TObject);
    procedure EdtProfissaoClickBtn(Sender: TObject);
    procedure EdtCodigoChange(Sender: TObject);
    procedure EdtLogradouroBairroClickBtn(Sender: TObject);
    procedure EdtUFClickBtn(Sender: TObject);
    procedure EdtMunicipioClickBtn(Sender: TObject);
    procedure EdtLogradouroClickBtn(Sender: TObject);

  protected

     function ValidarCampos: Boolean; override;

  private
    { Private declarations }
     Cliente: TCliente;
     Bairro: TBairro;
     Profissao: TProfissao;
     Logradouro: TLogradouro;
     Municipio: TMunicipio;
     UF: TUF;
     AgendamentoOnLine: TAgendamentoOnLine;
     EnderecoCliente: TEnderecoCliente;


  public
    { Public declarations }

  end;



implementation

uses
  Generics.SQL, Bas.AutoIncremento, Bas.SuperClasse, Lib.Recursos, Bas.Mensagens,
  CadastroClientes, Data.SqlExpr;

{$R *.dfm}

{ TFrmTelaCadastroClientes }



procedure TFrmTelaCadastroClientes.AeroBitBtn2Click(Sender: TObject);
var
  TD: TTransactionDesc;
begin
  try
    inherited;
    TD.IsolationLevel:= xilREADCOMMITTED;
    Sistema.ConexaoDB.StartTransaction( TD );

    Cliente.ID:= ( StrToInt( Trim( EdtCodigo.Text ) ) );
    Cliente.Nome:= EdtNome.Text;
    Cliente.DataNascimento:= EdtDataNascimento.Date;

    if ( Cliente.Estado = dsInsert ) then
      EnderecoCliente.ID:= TAutoIncremento.NovoCodigo( tblENDERECOCLIENTE, Sistema.ConexaoDB );

    EnderecoCliente.Pesquisar( EnderecoCliente.ID );

    EnderecoCliente.Logradouro:= Logradouro.ID;
    EnderecoCliente.NumeroLogradouro:= EdtLogradouroNumero.Text;

    EnderecoCliente.Bairro:= Bairro.ID;
    EnderecoCliente.ComplementoLogradouro:= EdtLogradouroComplemento.Text;

    EnderecoCliente.Municipio:= Municipio.ID;
    EnderecoCliente.CEP:= TFuncoes.RemoverMascaras( EdtCEP.Text );

    EnderecoCliente.UF:= UF.ID;
    EnderecoCliente.Usuario:= 1;
    EnderecoCliente.Salvar;

    Cliente.EnderecoCliente:= EnderecoCliente.ID;

    Cliente.Profissao:= Profissao.ID;
    Cliente.TelefoneCelular:= TFuncoes.RemoverMascaras( EdtTelefoneCelular.Text );
    Cliente.TelefoneResidencial:= TFuncoes.RemoverMascaras( EdtTelefoneResidencial.Text );
    Cliente.TelefoneComercial:= TFuncoes.RemoverMascaras( EdtTelefoneComercial.Text );
    Cliente.MSN:= EdtMSN.Text;
    Cliente.Observacao:= MnmObservacao.Text;

    {
    if ( Cliente.estado - dsInsert ) then
      AgendamentoOnLine.ID:= TAutoIncremento.NovoCodigo( tblAGENDAMENTOONLINE, Sistema.ConexaoDB );

    AgendamentoOnLine.Pesquisar( AgendamentoOnLine.ID );
    AgendamentoOnLine.EMail:= EdtEMail.Text;
    AgendamentoOnLine.Senha:= TFuncoes.MD5( EdtSenha.Text );
    AgendamentoOnLine.Estado:= estInativo;
    AgendamentoOnLine.Usuario:= 1;
    AgendamentoOnLine.Salvar;
    Cliente.AgendamentoOnLine:= AgendamentoOnLine.ID;
    }

    //Cliente.Foto:= ImgFoto.Picture.
    Cliente.Usuario:= 1;

    Cliente.DataManutencao:= Now;
    if (Cliente.Estado = dsInsert) then
      Cliente.DataCadastro:= Now;

    Cliente.Salvar;

    Sistema.ConexaoDB.Commit( TD );
  except
    on E:Exception do
    begin
      if (Sistema.ConexaoDB.InTransaction) then
        Sistema.ConexaoDB.Rollback( TD );

      TFrmMensagem.Mensagem( Self, mtError, Format(RSFalhaSalvarCadastro,
        [E.Message] ));
    end;
  end;
end;



procedure TFrmTelaCadastroClientes.AeroBitBtn3Click(Sender: TObject);
begin
  inherited;
  if ( TFrmMensagem.Mensagem(Self, mtConfirmation, 'Conformar exclus�o do registro') = mrOk  ) then
    Cliente.Exluir( StrToInt( Trim( EdtCodigo.Text ) ) );
end;



procedure TFrmTelaCadastroClientes.EdtCodigoChange(Sender: TObject);
begin
  inherited;
  InvalidarCampo( Sender );
end;



procedure TFrmTelaCadastroClientes.EdtCodigoClickBtn(Sender: TObject);
begin

  inherited;

  if ( Cliente.BuscarCampo( TPesquisaCliente.Create, EdtCodigo ) ) then
  begin
    if ( ValidarCampos ) then
      EdtNome.SetFocus;
  end;

end;



procedure TFrmTelaCadastroClientes.EdtLogradouroBairroClickBtn(Sender: TObject);
begin

  inherited;

  EdtLogradouroBairro.SetFocus;
  if (Bairro.BuscarCampo( TPesquisaBairro.Create, EdtLogradouroBairro )) then
  begin
    EdtLogradouroBairro.Text:= Bairro.Descricao;

    if ( ValidarCampos ) then
      EdtLogradouroComplemento.SetFocus;
  end;

end;



procedure TFrmTelaCadastroClientes.EdtLogradouroClickBtn(Sender: TObject);
begin

  inherited;

  EdtLogradouro.SetFocus;
  if ( Logradouro.BuscarCampo( TPesquisaLogradouro.Create, EdtLogradouro ) ) then
  begin
    EdtLogradouro.Text:= Logradouro.Descricao;

    if ( ValidarCampos ) then
      EdtLogradouroNumero.SetFocus;
  end;

end;

procedure TFrmTelaCadastroClientes.EdtMunicipioClickBtn(Sender: TObject);
begin

  inherited;

  EdtMunicipio.SetFocus;
  if ( Municipio.BuscarCampo( TPesquisaMunicipio.Create, EdtMunicipio ) ) then
  begin
    EdtMunicipio.Text:= Municipio.Descricao;

    if ( ValidarCampos ) then
      EdtCEP.SetFocus;
  end;

end;



procedure TFrmTelaCadastroClientes.EdtProfissaoClickBtn(Sender: TObject);
begin
  inherited;
  EdtProfissao.SetFocus;
  if ( Profissao.BuscarCampo( TPesquisaProfissao.Create, EdtProfissao ) ) then
  begin
    EdtProfissao.Text:= Profissao.Descricao;

    if ( ValidarCampos ) then
      EdtTelefoneCelular.SetFocus;
  end;
end;



procedure TFrmTelaCadastroClientes.EdtUFClickBtn(Sender: TObject);
begin
  inherited;

  EdtUF.SetFocus;
  if ( UF.BuscarCampo( TPesquisaUF.Create, EdtUF ) ) then
  begin
    EdtUF.Text:= UF.Descricao;

    if ( ValidarCampos ) then
      EdtProfissao.SetFocus;
  end;

end;

procedure TFrmTelaCadastroClientes.FormCreate(Sender: TObject);
begin

  inherited;

  Cliente:= TCliente.Create;
  Bairro:= TBairro.Create;
  Profissao:= TProfissao.Create;

  Logradouro:= TLogradouro.Create;
  Municipio:= TMunicipio.Create;
  UF:= TUF.Create;
  AgendamentoOnLine:= TAgendamentoOnLine.Create;
  EnderecoCliente:= TEnderecoCliente.Create;

  BtnExcluir.Enabled:= False;

  EdtCodigo.Clear;
end;



procedure TFrmTelaCadastroClientes.FormDestroy(Sender: TObject);
begin

  if (Assigned(EnderecoCliente)) then
    FreeAndNil(EnderecoCliente);

  if (Assigned(AgendamentoOnLine)) then
    FreeAndNil(AgendamentoOnLine);

  if (Assigned(UF)) then
    FreeAndNil(UF);

  if (Assigned(Municipio)) then
    FreeAndNil(Municipio);

  if (Assigned(Logradouro)) then
    FreeAndNil(Logradouro);

  if (Assigned( Profissao)) then
    FreeAndNil(Profissao);

  if (Assigned(Bairro)) then
    FreeAndNil(Bairro);

  if Assigned(Cliente) then
    FreeAndNil(Cliente);

  inherited;

end;



function TFrmTelaCadastroClientes.ValidarCampos: Boolean;
begin

  Result:= True;
  if ( ActiveControl = EdtCodigo ) then
  begin
    if ( TFuncoes.VerificarEstadoCampo(EdtCodigo) = evldInValido ) then
    begin
      if ( StrToIntDef( EdtCodigo.Text , 0 ) = 0) then
      begin
        EdtCodigo.Text:= IntToStr( TAutoIncremento.NovoCodigo( tblCLIENTES, Sistema.ConexaoDB ) );

        Cliente.NovoRegistro;

        BtnExcluir.Enabled:= False;
      end else
      if (not(Cliente.Pesquisar( StrToIntDef( EdtCodigo.Text, 0 )))) then
      begin
        TFrmMensagem.Mensagem( Self, mtWarning, RSClienteNaoEncontrado );
        Result:= False;
        Exit;
      end else
      begin

        BtnExcluir.Enabled:= True;
        EdtNome.Text:= Cliente.Nome;
        EdtDataNascimento.Date:= Cliente.DataNascimento;

        if ( EnderecoCliente.Pesquisar( Cliente.EnderecoCliente ) ) then
        begin
          EdtLogradouroNumero.Text:= EnderecoCliente.NumeroLogradouro;
          EdtLogradouroComplemento.Text:= EnderecoCliente.ComplementoLogradouro;
          if TFuncoes.VariavelVazia ( EnderecoCliente.CEP ) then
            EdtCEP.Text:= EmptyStr
          else
            EdtCEP.Text:= IntToStr( EnderecoCliente.CEP );

          if ( Logradouro.Pesquisar ( EnderecoCliente.Logradouro ) ) then
            EdtLogradouro.Text:= Logradouro.Descricao
          else
            EdtLogradouro.Text:= EmptyStr;

          if ( Bairro.Pesquisar( EnderecoCliente.Bairro ) ) then
            EdtLogradouroBairro.Text:= Bairro.Descricao
          else
            EdtLogradouroBairro.Text:= EmptyStr;

          if ( Municipio.Pesquisar( EnderecoCliente.Municipio ) ) then
            EdtMunicipio.Text:= Municipio.Descricao
          else
            EdtMunicipio.Text:= EmptyStr;

          if ( UF.Pesquisar( EnderecoCliente.UF ) ) then
            EdtUF.Text:= UF.Descricao
          else
            EdtUF.Text:= EmptyStr;

          {
          if ( AgendamentoOnLine.Pesquisar( Cliente.AgendamentoOnLine ) ) then
          begin
            EdtEMail.Text:= AgendamentoOnLine.EMail;
            EdtSenha.Text:= AgendamentoOnLine.Senha;
          end else
          begin
            EdtEMail.Text:= EmptyStr;
            EdtSenha.Text:= EmptyStr;
          end;
          }

        end else
        begin
          EdtLogradouro.Text:= EmptyStr;
          EdtLogradouroNumero.Text:= EmptyStr;
          EdtLogradouroBairro.Text:= EmptyStr;
          EdtLogradouroComplemento.Text:= EmptyStr;
          EdtMunicipio.Text:= EmptyStr;
          EdtCEP.Text:= EmptyStr;
          EdtUF.Text:= EmptyStr;
        end;

        if (Profissao.Pesquisar( Cliente.Profissao )) then
          EdtProfissao.Text:= Profissao.Descricao
        else
          EdtProfissao.Text:= EmptyStr;

        if ( TFuncoes.VariavelVazia( Cliente.TelefoneCelular ) ) then
          EdtTelefoneCelular.Text:= EmptyStr
        else
          EdtTelefoneCelular.Text:= IntToStr( Cliente.TelefoneCelular );

        if ( TFuncoes.VariavelVazia( Cliente.TelefoneResidencial ) ) then
          EdtTelefoneResidencial.Text:= EmptyStr
        else
          EdtTelefoneResidencial.Text:= IntToStr( Cliente.TelefoneResidencial );

        if ( TFuncoes.VariavelVazia( Cliente.TelefoneComercial ) ) then
          EdtTelefoneComercial.Text:= EmptyStr
        else
          EdtTelefoneComercial.Text:= IntToStr( Cliente.TelefoneComercial );

        EdtMSN.Text:= Cliente.MSN;
        MnmObservacao.Text:= Cliente.Observacao;

      end;

      TFuncoes.DefinirEstadoCampo( EdtCodigo, evldValido );
    end;
  end;

  if ( ActiveControl = EdtNome ) then
  begin
    if ( TFuncoes.VerificarEstadoCampo( EdtNome ) = evldInValido) then
    begin
      if ( Trim(EdtNome.Text) = EmptyStr ) then
      begin
        TFrmMensagem.Mensagem(Self, mtWarning, RSInformeNomeCliente );

        Result:= False;
        Exit;
      end else
      begin
        TFuncoes.DefinirEstadoCampo( EdtCodigo, evldValido );
      end;
    end;
  end;


end;

end.

