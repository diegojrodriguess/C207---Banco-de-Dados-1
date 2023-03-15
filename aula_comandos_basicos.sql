create database if not exists aula003;
use aula003;

create table if not exists usuario(
id int not null auto_increment primary key,
nome varchar(50),
ano_nascimento varchar(50),
pais varchar(50)
);

create table if not exists Cliente(
cpf varchar(50) primary key,
nome varchar(50),
idade int,
telefone varchar(50),
cidade varchar(50),
TotalCompra float
);

#INSERT
INSERT INTO usuario(nome,ano_nascimento,pais) VALUES ('Fulano', '2002', 'Brasil');
INSERT INTO usuario(nome,ano_nascimento,pais) VALUES ('Beltrano', '1990', 'USA');

select * from usuario;

INSERT INTO Cliente(cpf, nome, idade, telefone, cidade, TotalCompra) VALUES ('123456789','Lucas',25,'593459349-4234324','Veranopolis',145);
INSERT INTO Cliente(cpf, nome, idade, telefone, cidade, TotalCompra) VALUES ('14490626606','Diego',19,'(35)99239-6211','Santa Rita do Sapucai',1700);
select * from Cliente;

#SELECT 
#0 * significa que buscas todas as colunas
SELECT * FROM usuario;

#SELECT COM FILTRO
SELECT nome, idade, cidade FROM Cliente WHERE cidade = 'Veranopolis';

#SELECT COM OPERADORES ARITMETICOS
SELECT nome,cidade,TotalCompra FROM Cliente WHERE TotalCompra>=100 and not cidade = 'Veranopolis';

#SELECT COM FUNCOES PRONTAS
SELECT max(TotalCompra) from Cliente;
SELECT avg(TotalCompra) from Cliente;

#SELECT COM FILTRO DE TEXTO
SELECT * FROM Cliente WHERE nome like 'Di___%';

#SELECT COM NUMERO LIMITE DE LINHAS
SELECT nome,cidade,telefone FROM Cliente limit 2;

#SELECT SEM REPETICAO
SELECT DISTINCT cidade from Cliente;

#UPDATE 
UPDATE usuario SET nome = 'Renan' WHERE id = 2;
SELECT * from usuario;

#DELETE 
DELETE FROM usuario WHERE id = 1;
SELECT * FROM usuario;
