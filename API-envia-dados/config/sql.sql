-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para sql server(Azure) - remoto - produção */
/*Pegarei as tabelas aqui e enviarei para o Azure em database após fazer o login*/

/*A tabela LEADS sera responsável por armazenar as informações referentes as pessoas que acessaram o site e se cadastraram nesse campo, são os interessados.*/

CREATE TABLE  LEADS (
	ID_LEAD INT PRIMARY KEY IDENTITY (100, 1),
	NOME_FANTASIA VARCHAR(60),
	EMAIL VARCHAR(60),
	TELEFONE VARCHAR(11),
	CNPJ VARCHAR(23),
) ;

/*A tabela FUNCIONARIOS contera dados de todo quadro de funcionários WiSoy.*/

CREATE TABLE COLABORADORES (
  ID_COLABORADORES INT PRIMARY KEY IDENTITY (5000, 1),
  NOME VARCHAR(60),
  SEXO CHAR(1),
  DATA_NASCIMENTO DATE,
  EMAIL VARCHAR(60),
  LOGIN_COLABORADORES VARCHAR(20),
  SENHA VARCHAR(20),
  TELEFONE VARCHAR(11),
  RG CHAR(9),
  CPF CHAR(11),
  ENDERECO VARCHAR(100),
  CARTEIRA_TRABALHO CHAR(8),
  DATA_ADMISSAO DATE,
  FK_CHEFE INT,
  FOREIGN KEY (FK_CHEFE) REFERENCES COLABORADORES(ID_COLABORADORES)
  );

/*A tabela CLIENTES será responsável por armazenar todos os dados referentes ao cadastro de cada cliente.*/

CREATE TABLE CLIENTES (
	ID_CLIENTE INT PRIMARY KEY IDENTITY (15000, 1), /*IDENTITY é o auto_increment do MYSQL SERVER*/
	NOME_FANTASIA VARCHAR(60),
	TELEFONE VARCHAR(11),
	EMAIL VARCHAR (50),
	CPNJ VARCHAR(23),
	RAZAO_SOCIAL VARCHAR(50),
	DATA_CONTRATO DATE,
  CHECK_TERMOS BIT NOT NULL,
	FK_LEAD INT,
	FOREIGN KEY (FK_LEAD) REFERENCES LEADS (ID_LEAD),
  FK_COLABORADORES INT, 
  FOREIGN KEY (FK_COLABORADORES) REFERENCES COLABORADORES(ID_COLABORADORES)	
);

/*A tabela USUARIOS_CLIENTES é responsável pelos login no sistema para demais verificações*/

CREATE TABLE USUARIOS_CLIENTES (
	ID_USUARIOS_CLIENTES INT PRIMARY KEY IDENTITY (500, 1),
	LOGIN_USUARIO VARCHAR (35),
	SENHA VARCHAR (20),
	FK_CLIENTES INT,
	FOREIGN KEY (FK_CLIENTES) REFERENCES CLIENTES (ID_CLIENTE)
	);

/*A tabela FAZENDAS será responsável por armazenar os dados referentes às fazendas dos clientes.*/

CREATE TABLE FAZENDAS (
	ID_FAZENDA INT PRIMARY KEY IDENTITY (1, 1),
	FK_CLIENTE INT NOT NULL,
	HECTARES INT,
	NUMERO_SENSORES INT,
  ENDERECO_FAZENDA VARCHAR(100),
	FOREIGN KEY (FK_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE)
	) ;

/*A tabela SENSORES irá conter todos os sensores que a wisoy já implantou, data de instalação e em qual fazenda se encontram.*/

CREATE TABLE SENSORES (
  ID_SENSOR INT PRIMARY KEY IDENTITY (1000, 1),
  FK_FAZENDA INT NOT NULL,
  DATA_INSTALACAO DATE,
  SENSOR_XY VARCHAR (45),
  FOREIGN KEY (FK_FAZENDA)
  REFERENCES FAZENDAS (ID_FAZENDA)
  );

/*A tabela OCORRENCIAS tem o propósito de armazenar todas as ocorrências relacionadas ao serviços WiSoy relatadas por clientes.*/

/*CREATE TABLE OCORRENCIAS (
  ID_OCORRENCIA INT PRIMARY KEY IDENTITY (7000, 1),
  FK_CLIENTE INT NOT NULL,
  FK_COLABORADORES INT NOT NULL,
  RELATO VARCHAR(280),
  DATA_OCORRENCIA DATE,
  FOREIGN KEY (FK_CLIENTE)
  REFERENCES CLIENTES (ID_CLIENTE),
  FOREIGN KEY (FK_COLABORADORES)
  REFERENCES COLABORADORES (ID_COLABORADORES)
  );*/

  /*A tabela HISTÓRICO tem a função de armazenar todos os dados coletados pelos sensores com a finalidade de utiliza-los na construção de gráficos, históricos, e outros serviços que serão oferecidos aos clientes.*/

  CREATE TABLE HISTORICO_SENSOR (
  ID_HISTORICO INT PRIMARY KEY IDENTITY (1,1),
  FK_SENSOR INT NOT NULL,
  LEITURA_UMIDADE CHAR(6),
  LEITURA_DATA_HORA DATETIME,
  FOREIGN KEY (FK_SENSOR) REFERENCES SENSORES (ID_SENSOR)
  );


/*=====================================================================================================================*/


/* Para workbench - local - desenvolvimento */

CREATE DATABASE wisoy;

USE wisoy;


CREATE TABLE  LEADS (
	ID_LEAD INT PRIMARY KEY AUTO_INCREMENT,
	NOME_FANTASIA VARCHAR(60),
	EMAIL VARCHAR(60),
	TELEFONE VARCHAR(11),
	CNPJ VARCHAR(23),	
  CHECK_LEAD TINYINT /*Só funciona no MySQL*/
) AUTO_INCREMENT = 100;

/*A tabela FUNCIONARIOS contera dados de todo quadro de funcionários WiSoy.*/

CREATE TABLE COLABORADORES (
  ID_COLABORADORES INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR(60),
  SEXO CHAR(1),
  DATA_NASCIMENTO DATE,
  EMAIL VARCHAR(60),
  LOGIN_COLABORADORES VARCHAR(20),
  SENHA VARCHAR(20),
  TELEFONE VARCHAR(11),
  RG CHAR(9),
  CPF CHAR(11),
  ENDERECO VARCHAR(100),
  CARTEIRA_TRABALHO CHAR(8),
  DATA_ADMISSAO DATE,
  FK_CHEFE INT,
  FOREIGN KEY (FK_CHEFE) REFERENCES COLABORADORES(ID_COLABORADORES)
  ) AUTO_INCREMENT = 5000;


/*A tabela CLIENTES será responsável por armazenar todos os dados referentes ao cadastro de cada cliente.*/

CREATE TABLE CLIENTES (
	ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME_FANTASIA VARCHAR(60),
	TELEFONE VARCHAR(11),
	EMAIL VARCHAR (50),
	CPNJ VARCHAR(23),
	RAZAO_SOCIAL VARCHAR(50),
	DATA_CONTRATO DATE,
  CHECK_TERMOS TINYINT,
	FK_LEAD INT,
	FOREIGN KEY (FK_LEAD) REFERENCES LEADS (ID_LEAD),
  FK_COLABORADORES INT, 
  FOREIGN KEY (FK_COLABORADORES) REFERENCES COLABORADORES(ID_COLABORADORES)		

) AUTO_INCREMENT = 15000;


/*A tabela USUARIOS_CLIENTES é responsável pelos login no sistema para demais verificações*/

CREATE TABLE USUARIOS_CLIENTES (
	ID_USUARIOS_CLIENTES INT PRIMARY KEY AUTO_INCREMENT,
	LOGIN_USUARIO VARCHAR (35),
	SENHA VARCHAR (20),
	FK_CLIENTES INT,
	FOREIGN KEY (FK_CLIENTES) REFERENCES CLIENTES (ID_CLIENTE)
	) AUTO_INCREMENT = 500;



/*A tabela FAZENDAS será responsável por armazenar os dados referentes às fazendas dos clientes.*/


CREATE TABLE FAZENDAS (
	ID_FAZENDA INT PRIMARY AUTO_INCREMENT,
	FK_CLIENTE INT NOT NULL,
	HECTARES INT,
	NUMERO_SENSORES INT,
  ENDERECO_FAZENDA VARCHAR(100),
	FOREIGN KEY (FK_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE)
	) AUTO_INCREMENT = 1;

/*A tabela SENSORES irá conter todos os sensores que a wisoy já implantou, data de instalação e em qual fazenda se encontram.*/

CREATE TABLE SENSORES (
  ID_SENSOR INT PRIMARY KEY AUTO_INCREMENT,
  FK_FAZENDA INT NOT NULL,
  DATA_INSTALACAO DATE,
  SENSOR_XY VARCHAR (45),
  FOREIGN KEY (FK_FAZENDA)
  REFERENCES FAZENDAS (ID_FAZENDA)
  ) AUTO_INCREMENT = 1000;


/*A tabela OCORRENCIAS tem o propósito de armazenar todas as ocorrências relacionadas ao serviços WiSoy relatadas por clientes.*/

CREATE TABLE OCORRENCIAS (
  ID_OCORRENCIA INT PRIMARY KEY AUTO_INCREMENT,
  FK_CLIENTE INT NOT NULL,
  FK_COLABORADORES INT NOT NULL,
  RELATO VARCHAR(280),
  DATA_OCORRENCIA DATE,
  FOREIGN KEY (FK_CLIENTE)
  REFERENCES CLIENTES (ID_CLIENTE),
  FOREIGN KEY (FK_COLABORADORES)
  REFERENCES COLABORADORES (ID_COLABORADORES)
  ) AUTO_INCREMENT = 7000;

  /*A tabela HISTÓRICO tem a função de armazenar todos os dados coletados pelos sensores com a finalidade de utiliza-los na construção de gráficos, históricos, e outros serviços que serão oferecidos aos clientes.*/

  CREATE TABLE HIST_SENSOR (
  ID_HISTORICO INT PRIMARY KEY AUTO_INCREMENT,
  FK_SENSOR INT NOT NULL,
  LEITURA_UMIDADE CHAR(6),
  LEITURA_DATA_HORA CHAR(16),
  FOREIGN KEY (FK_SENSOR)
  REFERENCES SENSORES (ID_SENSOR)
  ) AUTO_INCREMENT = 1;