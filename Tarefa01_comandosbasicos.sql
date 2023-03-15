create database if not exists TAREFA;
use TAREFA;

create table if not exists Usuario (
id int not null auto_increment primary key,
nome varchar(45),
email varchar(45),
senha varchar(45)
);

INSERT INTO Usuario (nome,email,senha) VALUES ('Alexandre','alexandre@email.com','12345');
INSERT INTO Usuario (nome,email,senha) VALUES ('Natanael','natanael12@email.com','ABCDE');
INSERT INTO Usuario (nome,email,senha) VALUES ('Julia','julia09@email.com','98765');
INSERT INTO Usuario (nome,email,senha) VALUES ('Fernanda','fernanda@email.com','EFGHI');

UPDATE usuario SET senha = '54321' WHERE id = 1;

DELETE FROM usuario where id = 4;

SELECT * from usuario; 

SELECT * FROM usuario WHERE nome like '%n%';