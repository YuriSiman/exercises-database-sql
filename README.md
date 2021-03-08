<h1 align="center">Banco de Dados SQL</h1>

<p align="center">Neste repositório seguem conceitos e exercícios a respeito de Banco de Dados SQL</p>

---

### :dart: Objetivo

Tenho como objetivo documentar conceitos essenciais sobre Banco de Dados e exercícios para que possa servir de consulta e fonte de estudos sobre Banco de Dados SQL.  

### Clone

Clone este repositório em sua máquina local usando:  

```
git clone https://github.com/YuriSiman/exercises-database-sql.git
```

## :clipboard: Tópicos

* [Conceitos](https://github.com/YuriSiman/exercises-database-sql#conceitos)  
* [Exercícios](https://github.com/YuriSiman/exercises-database-sql#exercicios)  

--- 

## :rocket: Vamos Começar  

## Conceitos

## SGBD

O SGBD é software que facilita o processo de definição, construção, manipulação e compartilhamento de bancos de dados entre 
diversos usuários e aplicações.  

## Normalização

Normalização é o processo de análise dos esquemas de relações com base nas dependências funcionais dos atributos visando:  

– Minimizar redundância de dados
– Minimizar anomalias de atualização  

Normalização é o processo através do qual esquemas de relação são sucessivamente refinados até que satisfaçam determinadas propriedades ou formas normais.

#### Primeira Forma Normal (1FN)  

Um esquema de relação está na 1FN:  

– Se todos os seus atributos estiverem definidos em domínios que contenham apenas valores atômicos (simples, monovalorados) e não por conjuntos de valores.  
– A interseção de uma linha e coluna (célula) deve possuir apenas um único valor.  

#### Segunda Forma Normal (2FN)  

Um esquema de relação está na 2FN:  

– Se a relação estiver na 1FN.  
– Todos os atributos que não fazem parte da chave primária devem depender funcionalmente de todos os atributos da chave primária.  
– Quando a chave primária é composta: A dependência funcional não pode ser parcial, isto é, deve ser total.  
– Dependência parcial: Quando se puder retirar algum atributo e a dependência continuar existindo.  

#### Terceira Forma Normal (3FN)  

Um esquema de relação está na 3FN:  

– Se a relação estiver na 2FN.  
– Todos os atributos da relação devem depender diretamente da chave primária, isto é, não podem depender transitivamente da chave primária.  

## Alguns Tipos de Dados Disponíveis  

Tipo de Dados | Descrição
------------ | -------------
CHAR(n) | Strings de caracteres de tamanho fixo
VARCHAR(n) | Strings de caracteres de tamanho variável
INT | Números inteiros (2^10)
SMALLINT | Números inteiros pequenos (2^5)
NUMERIC(p,s) | Números exatos com casas decimais Ex: NUMERIC(7,2) tem 5 inteiros e 2 decimais
DATE | Data
TIME | Hora
DATETIME | Data e hora dd/mm/yyyy hh:mm:ss.ttt
SMALLDATETIME | Data e hora dd/mm/yyyy hh:mm

Data Types: https://docs.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?redirectedfrom=MSDN&view=sql-server-ver15

---

## Linguagem SQL - DDL (Data Definition Language)  

Os comandos DDL para **criar**, **alterar** e **remover** tabelas e outros objetos são:  

* CREATE - Cria
* ALTER - Altera
* DROP - Remove

Criando um banco de dados:

Verificando se o banco de dados já existe
```
IF DB_ID ('teste') IS NULL
	CREATE DATABASE teste
```

Ou, criando o banco de dados
```
CREATE DATABASE teste
```

Entrando no contexto do banco de dados:

```
USE teste
```

Criando tabelas com PRIMARY KEY, FOREIGN KEY, UNIQUE e definindo CONSTRAINT:

* PRIMARY KEY - A constraint Primary Key (chave primaria), não permite valores nulos e impõe a exclusividade de linhas.  
* FOREIGN KEY - Uma Foreign key (chave estrangeira), impõe a integridade referencial, ela é definida em um conjunto de atributos em que é chamada de tabela de referencia e aponta para os atributos de chaves candidatas (primary key, unique constraint).  
* UNIQUE - A Constraint Unique, também impõe a exclusividade de linhas, porem, é um pouco parecida com a primary key, podem existir varias Unique Constraints na mesma tabela.  
* CONSTRAINT - É usada para dar nome à restrição de integridade.  
* IDENTITY - Tem como finalidade incrementar um valor a cada nova inserção.  

```
CREATE TABLE funcionarios 
(
    Id int IDENTITY NOT NULL,
    CPF char(11) NOT NULL,
    Nome varchar(100) NOT NULL,
    Salario numeric(7,2) NOT NULL,
    Endereco varchar(200),
    DataNascimento datetime NOT NULL,
    Ativo char(1) NOT NULL DEFAULT 'S',
    CONSTRAINT pk_funcionario PRIMARY KEY (Id),
    CONSTRAINT un_funcionario UNIQUE (CPF)
)

CREATE TABLE departamentos
(
    Id int NOT NULL,
    Nome varchar(100) NOT NULL,
    Id_Funcionario int IDENTITY,
    CONSTRAINT pk_departamento PRIMARY KEY (Id),
    CONSTRAINT un_departamento UNIQUE (Nome),
    CONSTRAINT fk_funcionario FOREIGN KEY (Id_funcionario) REFERENCES funcionarios (Id) ON DELETE NO ACTION
)
```

Removendo uma tabela:  

```
DROP TABLE departamentos
```

Removendo todas as linhas de uma tabela:  

```
TRUNCATE TABLE departamentos
```

Alterar a estrutura de uma tabela, adicionando, removendo ou alterando colunas e restrições:  

Incluir uma nova coluna, não é permitido configurar uma coluna NOT NULL, a menos que um valor DEFAULT seja informado, se criada como NULL, a coluna pode ser alterada depois para NOT NULL usando ALTER TABLE ... ALTER COLUMN:

```
ALTER TABLE funcionarios ADD Formacao varchar(200) NOT NULL DEFAULT 0
```

Alterar especificação da coluna (tipo de dados, NULL etc.):

```
ALTER TABLE funcionarios ADD Nivel varchar(200) NULL
ALTER TABLE funcionarios ALTER COLUMN Nivel varchar(200) NOT NULL
```

Excluir uma coluna fisicamente:

```
ALTER TABLE funcionarios DROP COLUMN Nivel
```

Adicionar apenas uma restrição (a coluna deve existir):

```
ALTER TABLE funcionarios ADD CONSTRAINT CK_ativo CHECK (ativo = 'S' OR ativo = 'N')
```

Excluir uma restrição:

```
ALTER TABLE funcionarios DROP CONSTRAINT CK_ativo
```

## Linguagem SQL - DML (Data Manipulation Language)  

Os comandos DML para **inserir**, **selecionar**, **atualizar** e **excluir** são:  

* INSERT - Inserir
* SELECT - Selecionar
* UPDATE - Atualizar
* DELETE - Excluir  

Listando todos os funcionários:

```
SELECT * FROM funcionarios
```

Recuperar o nome, a data de nascimento e o endereço dos funcionários que moram em ‘MG’:

```
SELECT nom_empregado, dat_nascimento, dsc_endereco
FROM funcionarios
WHERE sig_uf = 'MG'
```

Recuperar o nome e o salário de todos os funcionarios que recebem igual ou maior que 2.500,00:

```
SELECT nom_empregado, val_salario
FROM funcionarios
WHERE val_salario >= 2500.00
```

Recuperar os dados dos departamentos 1, 3 ou 5:

```
SELECT * FROM departamentos 
WHERE cod_depto = 1 OR cod_depto = 3 
OR cod_depto = 5

ou

SELECT * FROM departamentos
WHERE cod_depto IN (1,3,5)
```

Recuperar os empregados que moram no estado de “MG” ou “RJ”:

```
SELECT nome, nom_cidade, sig_uf
FROM funcionarios
WHERE sig_uf IN ('MG', 'RJ')
```

Listar o código e o nome de todos os departamentos que começam com ‘V’ e cujo codigo está entre 1 e 3:

```
SELECT d.cod_depto AS depto, d.nom_depto
FROM departamento d
WHERE d.nom_depto LIKE 'V%'
AND d.cod_depto BETWEEN 1 AND 3
```

SELECT DISTINCT pode remover duplicidade. Listar as cidades distintas de todos os empregados que moram em ‘MG’:

```
SELECT DISTINCT e.nom_cidade
FROM empregado AS e 
WHERE e.sig_uf = 'MG'
```

ORDER BY ordena o resultado do SELECT  
Recuperar em ordem alfabética, a matrícula e o nome de todos os empregados do sexo masculino e do departamento 1:

```
SELECT num_matricula, nome
FROM funcionarios
WHEREsex_empregado = 'M' 
AND cod_depto = 1
ORDER BY nome
```

Listar o nome do empregado, a UF e o salário dos empregados ordenando por UF ascendente e salário descendente:

```
SELECT e.nom_empregado, e.sig_uf, e.val_salario
FROM empregado AS e
ORDER BY e.sig_uf ASC, e.val_salario DESC
```

Valores nulos  
Listar os empregados sem supervisores:  

```
SELECT e.nom_empregado FROM empregado AS e
WHERE e.num_matricula_supervisor IS NULL
```

Listar os departamentos que possuem gerente:

```
SELECT d.nom_depto FROM departamento as d
WHERE d.num_matricula_gerente IS NOT NULL
```

Listar o nome do empregado e o supervisor:

```
SELECT nom_empregado, num_matricula_supervisor
FROM empregado

ou

SELECT nom_empregado, COALESCE(num_matricula_supervisor,0) 
FROM empregado

ou

SELECT nom_empregado, COALESCE(CONVERT(varchar, 
num_matricula_supervisor),'(sem supervisor)') 
FROM empregado
```

TOP X linhas  
É possível retornar apenas as primeiras X linhas de um SELECT (TOP X)  

Listar 4 linhas da tabela de empregado:

```
SELECT TOP 4 num_matricula, nom_empregado
FROM empregado
```

Listar os 3 empregados com os maiores salários da empresa:  

```
SELECT TOP 3 num_matricula, 
nom_empregado, val_salario
FROM empregado 
ORDER BY val_salario DESC
```

INSERT - Inserção de linhas em uma tabela

```
INSERT INTO empregado VALUES (10,'Pelé','1970-02-03','Av das Americas 33','Curitiba','PR','M',1500.00,1,2)  
INSERT INTO departamento VALUES (6,'Marketing',null,null)  
INSERT INTO departamento (nom_depto, cod_depto) VALUES ('Escritório de Projetos', 7)
```

Inserção de linhas em uma tabela com IDENTITY:  

```
CREATE TABLE teste
(
codigo int not null PRIMARY KEY IDENTITY,
nome varchar(100),
data datetime DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO teste VALUES (1,'Nome 1', CURRENT_TIMESTAMP)
```

Inserção de linhas em uma tabela com DEFAULT:

```
INSERT INTO teste (nome, data) 
VALUES ('Nome 2', default)
```

DELETE - Exclusão de linhas de uma tabela  

Excluir todos os empregados:  

```
DELETE FROM empregado
```

Excluir todos os empregados cuja UF é “PR”:

```
DELETE FROM empregado WHERE sig_uf='PR'
```

Excluir os departamentos com código >= 6:  

```
DELETE FROM departamento WHERE cod_depto >= 6
```

UPDATE - Atualização de valores das colunas  

Atualizar o salário de todos os empregados do departamento 2 para 2000.00:

```
UPDATE empregado 
SET val_salario = 2000.00
WHERE cod_depto = 2
```

Aumentar em 20% o salário dos empregados do departamento 3 e transferi-los para o depto 5:  

```
UPDATE empregado 
SET cod_depto= 5, val_salario = val_salario * 1.2
WHERE cod_depto = 3
```

## Linguagem SQL - DML (Data Manipulation Language) - JOINS


---

## :vertical_traffic_light: Status do Projeto

:construction: Projeto sendo implementado :construction:

---

## :thinking: Contribuindo

> Para começar...

### Passo 1

* :fork_and_knife: Fork este repositório!

### Passo 2

* :dancers: Clone este repositório para sua máquina local usando `git clone https://github.com/YuriSiman/exercises-database-sql.git`

### Passo 3

* :trident: Crie sua feature branch usando `git checkout -b minha-feature`

### Passo 4

* :white_check_mark: Commit suas mudanças usando `git commit -m "feat: Minha nova feature"`

### Passo 5

* :pushpin: Dê um push usando `git push -u origin minha-feature`

### Passo 6

* :arrows_clockwise: Crie um novo pull request

Depois que seu pull request for mesclado, você pode excluir sua feature branch  

> Caso tenha dúvidas, confira este guia de como [contribuir no GitHub](https://github.com/firstcontributions/first-contributions)  

---

## :speech_balloon: Suporte

> Entre em contato comigo...  

* Me chame pelo [Linkedin](https://www.linkedin.com/in/yurisiman/)  
* Me mande um e-mail [contato@yurisiman.com.br](mailto:contato@yurisiman.com.br)  

[![Github](https://img.shields.io/badge/github-profile-%237159c1?style=for-the-badge&logo=github)](https://github.com/YuriSiman)  
[![Curriculum](https://img.shields.io/badge/site-curriculum-%23563D7C?style=for-the-badge&logo=bootstrap)](https://yurisiman.com.br)  

---

## :pencil: Licença

[![License](https://img.shields.io/badge/license-mit-%23A6CE39?style=for-the-badge&logo=github)](https://github.com/YuriSiman/exercises-database-sql/blob/master/LICENSE)   

---

Code your life...

