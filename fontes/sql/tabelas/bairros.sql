/*
Descrição:
  Tabela utilizada para gravar os dados dos bairros

Histórico de alterações:
  v1.00  - 24/05/2012 
    - Criação da tabela.k
  v1.00a - 27/05/2012
    - Incluído a chave primária id_bairro_bairros_pk, o índice ds_bairro_bairros_uq e a chave 
    estrangeira cd_usuario_bairros_fkk.k 	
*/  	
	
CREATE TABLE "bairros"  (
   "id_bairro"		INTEGER NOT NULL 
  
  ,"ds_bairro"		VARCHAR(  40) NOT NULL
  
  ,"dt_cadastro"	 TIMESTAMP NOT NULL
  ,"dt_manutencao" TIMESTAMP NOT NULL
  ,"dt_exclusao"	 TIMESTAMP DEFAULT NULL
  
  ,"cd_usuario"		INTEGER NOT NULL  
  
  ,CONSTRAINT "id_bairro_bairros_pk" PRIMARY KEY ("id_bairro")
  ,CONSTRAINT "ds_bairro_bairros_uq" UNIQUE      ("ds_bairro")
  
  ,CONSTRAINT "cd_usuario_bairros_fk" FOREIGN KEY ("cd_usuario") REFERENCES "usuarios"("id_usuario")
    ON DELETE NO ACTION ON UPDATE CASCADE  
);



CREATE GENERATOR "id_bairro_bairros_gn" ;
SET GENERATOR "id_bairro_bairros_gn" TO 0;    

