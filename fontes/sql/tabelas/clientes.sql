/*
Descrição:
  Tabela utilizada para gravar os dados dos clientes cadastrados no sistema
  
Histórico de alterações:
  v1.00 - 24/05/2012 
    - Criação da tabela.
  V1.01 - 27/05/2012
    - Incluído a chave primária id_cliente_clientes_pk, os indices cd_cliente_clientes_uq, cd_usuario_clientes_uq e as chaves 
	estrangeiras cd_enderecocliente_clientes_fk, cd_profissao_clientes_fk e cd_usuario_clientes_fk
*/

CREATE TABLE "clientes" (
   "id_cliente"			INTEGER NOT NULL
   
  ,"nm_cliente"			VARCHAR (  60) NOT NULL
  ,"dt_nascimento"		DATE
  
  ,"cd_enderecocliente"	INTEGER 
  ,"cd_profissao"			INTEGER
  
  ,"nu_telefonecelular"   	NUMERIC (10, 0)
  ,"nu_telefoneresidencial" 	NUMERIC (10, 0)
  ,"nu_telefonecomercial"   	NUMERIC (10, 0)
  
  ,"tx_msn"        		VARCHAR( 80)
  ,"tx_observacao" 		VARCHAR(500)  
    
  ,"cd_agendamentoonline" INTEGER	
		
  ,"im_foto" 				BLOB SUB_TYPE 0 SEGMENT SIZE 80

  ,"dt_cadastro"   	TIMESTAMP NOT NULL
  ,"dt_manutencao" 	TIMESTAMP NOT NULL
  ,"dt_exclusao"   	TIMESTAMP DEFAULT NULL
  
  ,"cd_usuario"    	INTEGER NOT NULL
    
  ,CONSTRAINT "id_cliente_clientes_pk" PRIMARY KEY ("id_cliente")
     
  ,CONSTRAINT "cd_enderecocliente_clientes_fk" 	FOREIGN KEY ("cd_enderecocliente") REFERENCES "enderecocliente"("id_enderecocliente")
     ON DELETE NO ACTION ON UPDATE CASCADE	
  ,CONSTRAINT "cd_profissao_clientes_fk"       	FOREIGN KEY ("cd_profissao") REFERENCES "profissoes"("id_profissao")           
     ON DELETE NO ACTION ON UPDATE CASCADE	 	 
  ,CONSTRAINT "cd_usuario_clientes_fk"			FOREIGN KEY ("cd_usuario") REFERENCES "usuarios"("id_usuario")
     ON DELETE NO ACTION ON UPDATE CASCADE
  ,CONSTRAINT "cd_agentonline_clientes_fk"		FOREIGN KEY ("cd_agendamentoonline") REFERENCES "agendamentoonline"("id_agendamentoonline")
     ON DELETE NO ACTION ON UPDATE CASCADE	 
);



CREATE GENERATOR "id_cliente_clientes_gn";
SET GENERATOR "id_cliente_clientes_gn" TO 0;
