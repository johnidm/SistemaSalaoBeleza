/*
Descrição:
  Tabela utilizada para gravar os dados das cidades

Histórico de alterações:
  v1.00  - 24/05/2012 
    - Criação da tabela
  v1.00a - 27/05/2012
    - Incluído a chave primaria id_cidade_cidades_pk, o indice ds_cidade_cidades_uq e a chave
	estrangeira cd_usuario_cidades_fk

  v1.00b - 03/07/2012
    - Renomeado a tabela para MUNICIPIOS


*/  
    
  
 CREATE TABLE "municipios" (
   "id_municipio"		INTEGER NOT NULL
  
  ,"ds_municipio" 		VARCHAR (  40) NOT NULL
  
  ,"dt_cadastro"   	TIMESTAMP NOT NULL
  ,"dt_manutencao" 	TIMESTAMP NOT NULL
  ,"dt_exclusao"   	TIMESTAMP DEFAULT NULL
  
  ,"cd_usuario"    	INTEGER NOT NULL  
  
  ,CONSTRAINT "id_municipios_cidades_pk" PRIMARY KEY ("id_municipio")
  ,CONSTRAINT "ds_municipios_cidades_uq" UNIQUE ("ds_municipio")
  
  ,CONSTRAINT "cd_municipios_cidades_fk" FOREIGN KEY ("cd_usuario") REFERENCES "usuarios"("id_usuario")
    ON DELETE NO ACTION ON UPDATE CASCADE    
  
);  



CREATE GENERATOR "id_municipio_municipios_gn" ;
SET GENERATOR "id_municipio_municipios_gn" TO 0;

