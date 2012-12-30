/*
Descrição:
  Tabela utilizada para gravar os dados dos profissionais

Histórico de alterações:
  v1.00  - 14/07/2012
    - Criação da tabela  
*/  


CREATE TABLE "profissionais" (

	 "id_profissional"	INTEGER NOT NULL
	,"nm_profissional"	VARCHAR(60)
	
	,"dt_cadastro"   	TIMESTAMP NOT NULL
    ,"dt_manutencao" 	TIMESTAMP NOT NULL
    ,"dt_exclusao"   	TIMESTAMP DEFAULT NULL
  
    ,"cd_usuario"    	INTEGER NOT NULL  
	
	,CONSTRAINT "id_profissional_pk" PRIMARY KEY ("id_profissional")  
  
	,CONSTRAINT "nm_profissional_uq" UNIQUE 	 ("nm_profissional")
  
	,CONSTRAINT "cd_usuario_profissionais_fk" FOREIGN KEY ("cd_usuario") REFERENCES "usuarios"("id_usuario")
    ON DELETE NO ACTION ON UPDATE CASCADE  	

);

CREATE GENERATOR "id_profissional_prof_gn";
SET GENERATOR "id_profissional_prof_gn" TO 0;