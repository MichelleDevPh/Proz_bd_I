CREATE DATABASE BIBLIOTECA;
USE BIBLIOTECA;

CREATE TABLE AUTOR (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE LIVRO (
    id INT PRIMARY KEY,
    titulo VARCHAR(200),
    id_autor INT,
    FOREIGN KEY (id_autor) REFERENCES AUTOR(id)
);

INSERT INTO AUTOR (id, nome) VALUES
(1, 'Machado de Assis'),
(2, 'Clarice Lispector');

INSERT INTO LIVRO (id, titulo, id_autor) VALUES
(1, 'Dom Casmurro', 1),
(2, 'A Hora da Estrela', 2),
(3, 'Memórias Póstumas de Brás Cubas', 1);

-- Consulta com JOIN
SELECT LIVRO.titulo, AUTOR.nome
FROM LIVRO
JOIN AUTOR ON LIVRO.id_autor = AUTOR.id;
