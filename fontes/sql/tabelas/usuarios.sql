/*
Descrição:
  Tabela utilizada para gravar os dados do usuário do sistema.
  A senha do usuário sera gravada aplicando o algoritmo de criptografia md-5.

Histórico de alterações:
  v1.00  - 24/05/2012 
    - Criação da tabela
  v1.00a - 27/05/2012
    - Inluído a chave primaria id_usuario_pk e os unique tx_login_uq e sn_senha_uq
  v1.00b - 17/06/2012
    - Removido as aspas duplas dos nomes dos objetos do DB  
*/

CREATE TABLE "usuarios" (
   "id_usuario"		INTEGER NOT NULL
   
  ,"nm_usuario"		VARCHAR(  60) NOT NULL 
  ,"tx_login"			VARCHAR(  20) NOT NULL 
  ,"sn_senha"			VARCHAR(  32) NOT NULL     
  
  ,"dt_cadastro"		TIMESTAMP NOT NULL
  ,"dt_manutencao"	TIMESTAMP NOT NULL
  ,"dt_exclusao"		TIMESTAMP DEFAULT NULL
  
  ,"cd_usuario"    	INTEGER NOT NULL  
  
  ,CONSTRAINT "id_usuario_pk" PRIMARY KEY ("id_usuario")
  ,CONSTRAINT "tx_login_uq"   UNIQUE      ("tx_login")
  ,CONSTRAINT "sn_senha_uq"   UNIQUE      ("sn_senha")   
);



CREATE GENERATOR "id_usuario_usuarios_gn";
SET GENERATOR "id_usuario_usuarios_gn" TO 0;



  
