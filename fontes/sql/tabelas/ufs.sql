/*
Descrição:
  Tabela utilizada para gravar os dados dos estados - unidades federativas

Histórico de alterações:
  v1.00  - 24/05/2012 
    - Criação da tabela
  v1.00a - 27/05/2012
    - Incluído a chave primária id_uf_pk, os indices cd_uf_uq e ds_uf_uq e a chave estrangeira
    cd_usuario_fk.    
*/       
    	
CREATE TABLE "ufs" (
   "id_uf" 			INTEGER NOT NULL

  ,"ds_uf" 			CHAR    (  2) NOT NULL
 		 
  ,"ds_completa_uf"	VARCHAR ( 30) NOT NULL
  
  ,"dt_cadastro"   	TIMESTAMP NOT NULL
  ,"dt_manutencao" 	TIMESTAMP NOT NULL
  ,"dt_exclusao"   	TIMESTAMP DEFAULT NULL
  
  ,"cd_usuario"    	INTEGER NOT NULL  
  
  ,CONSTRAINT "id_uf_pk" PRIMARY KEY ("id_uf")  
  
  ,CONSTRAINT "ds_uf_uq" UNIQUE 	 ("ds_uf")
  
  ,CONSTRAINT "cd_usuario_ufs_fk" FOREIGN KEY ("cd_usuario") REFERENCES "usuarios"("id_usuario")
    ON DELETE NO ACTION ON UPDATE CASCADE  
);



CREATE GENERATOR "id_uf_ufs_gn" ;
SET GENERATOR "id_uf_ufs_gn" TO 0;



