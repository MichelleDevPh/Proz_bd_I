CREATE DATABASE ESCOLA;

USE ESCOLA;

CREATE TABLE ALUNO (
    ID INT PRIMARY KEY,
    nome VARCHAR(100),
    matricula INT,
    email VARCHAR(100),
    endereco VARCHAR(150),
    telefone VARCHAR(20)
);

CREATE TABLE EMPRESTIMO (
    codigo INT PRIMARY KEY,
    data_hora DATETIME,
    matric_aluno INT,
    data_devolucao DATE,
    FOREIGN KEY (matric_aluno) REFERENCES ALUNO(matricula)
);

CREATE TABLE SESSAO (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(100),
    localizacao VARCHAR(100)
);

CREATE TABLE LIVRO (
    cod_livro INT PRIMARY KEY,
    titulo VARCHAR(200),
    autor VARCHAR(100),
    cod_sessao INT,
    FOREIGN KEY (cod_sessao) REFERENCES SESSAO(codigo)
);

CREATE TABLE LIVRO_EMPRESTIMO (
    cod_livro INT,
    cod_emprestimo INT,
    PRIMARY KEY (cod_livro, cod_emprestimo),
    FOREIGN KEY (cod_livro) REFERENCES LIVRO(cod_livro),
    FOREIGN KEY (cod_emprestimo) REFERENCES EMPRESTIMO(codigo)
);
