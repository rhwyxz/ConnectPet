CREATE DATABASE adocaoanimais;

USE adocaoanimais;

CREATE TABLE Usuarioanunciante
    nome VARCHAR(70) NOT NULL,
    cpf CHAR(11) UNIQUE,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    cep CHAR(8),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (codigo_ua)
);

CREATE TABLE gerente (
    codigo_geren INT NOT NULL auto_increment, 
    nome VARCHAR(70) NOT NULL,
    cpf CHAR(11) UNIQUE,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    cep CHAR(8),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
	setor VARCHAR(70) NOT NULL,
    PRIMARY KEY (codigo_geren)
);

CREATE TABLE abrigo (
    id_abrigo INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj CHAR(14) UNIQUE,
    responsavel VARCHAR(100),
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(150),
    cidade VARCHAR(100),
    estado CHAR(2),
    cep CHAR(8),
    capacidade INT,
    PRIMARY KEY (id_abrigo)
    );
    
    CREATE TABLE animal (
    codigo_animal INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    especie VARCHAR(50),
    raca VARCHAR(50),
    idade INT,
    sexo ENUM('M','F'),
    id_abrigo INT,
    FOREIGN KEY (id_abrigo) REFERENCES abrigo(id_abrigo),
    PRIMARY KEY (codigo_animal)
    );
    
    
    CREATE TABLE anuncio (
    id_anuncio INT AUTO_INCREMENT PRIMARY KEY,
    codigo_ua INT NOT NULL,
    codigo_animal INT,
    id_abrigo INT,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_publicacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('ativo', 'inativo', 'adotado') DEFAULT 'ativo',
    FOREIGN KEY (codigo_ua) REFERENCES Usuarioanunciante(codigo_ua),
    FOREIGN KEY (codigo_animal) REFERENCES animal(codigo_animal),
    FOREIGN KEY (id_abrigo) REFERENCES abrigo(id_abrigo)
    );
anuncio    
    CREATE TABLE usuario_cliente (
    codigo_uc INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    cep CHAR(8),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE adocao (
    id_adocao INT AUTO_INCREMENT PRIMARY KEY,
    id_anuncio INT NOT NULL,
    id_uc INT NOT NULL,
    data_solicitacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_aprovacao DATETIME,
    data_conclusao DATETIME,
    status ENUM('pendente', 'aprovada', 'recusada', 'concluida') DEFAULT 'pendente',
    observacoes TEXT,
    FOREIGN KEY (id_anuncio) REFERENCES anuncio(id_anuncio),
    FOREIGN KEY (id_uc) REFERENCES usuario_cliente(id_uc)
);