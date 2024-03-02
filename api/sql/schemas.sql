/*============================================*/
/* Database name: reciclarja                  */
/* DBMS name:     MySQL 8.0                   */
/* Creted on:     01/03/2024 20:50            */
/*============================================*/


/*==============================================================*/
/* Table: usuarios                                              */
/*==============================================================*/
CREATE TABLE usuarios
(
	id INTEGER AUTO_INCREMENT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	login VARCHAR(100) NOT NULL,
	senha VARCHAR(100) NOT NULL,
	ativo BOOLEAN NOT NULL,
	PRIMARY KEY (id ASC)
);

/*==============================================================*/
/* Table: permissao                                             */
/*==============================================================*/
CREATE TABLE permissao
(
	id INTEGER AUTO_INCREMENT NOT NULL,
	denominacao VARCHAR(255) NOT NULL,
	usuario_id INTEGER NOT NULL,
	PRIMARY KEY (id ASC),
	CONSTRAINT fk_usuario FOREIGN KEY (usuario_id)
		REFERENCES usuarios (id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

/*==============================================================*/
/* Table: coleta                                                */
/*==============================================================*/
CREATE TABLE coleta
(
	id INTEGER AUTO_INCREMENT NOT NULL,
	latitude DECIMAL(10, 5) NOT NULL,
	longitude DECIMAL(10, 5) NOT NULL,
	plastico INTEGER,
	papel INTEGER,
	metal INTEGER,
	vidro INTEGER,
	borracha INTEGER,
	bateria INTEGER,
	oleo INTEGER,
	eletronico INTEGER,
	status VARCHAR(10),
	coletor_id INTEGER NOT NULL,
	dataCadastro DATETIME NOT NULL
	PRIMARY KEY (id ASC),
	CONSTRAINT fk_coletores FOREIGN KEY (coletor_id)
			REFERENCES coletores (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE
);

/*==============================================================*/
/* Table: coletores                                             */
/*==============================================================*/
CREATE TABLE coletores
(
	id INTEGER AUTO_INCREMENT NOT NULL,
	nome VARCHAR(255) NOT NULL,
	endereco VARCHAR(255) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	estado VARCHAR(5) NOT NULL,
	PRIMARY KEY (id ASC)
);

