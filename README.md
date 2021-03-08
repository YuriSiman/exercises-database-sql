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
IF DB_ID ('Teste') IS NULL
	CREATE DATABASE Teste
```

Ou, criando o banco de dados
```
CREATE DATABASE Teste
```

Entrando no contexto do banco de dados:

```
USE Teste
```

Criando tabelas com PRIMARY KEY, FOREIGN KEY, UNIQUE e definindo CONSTRAINT:

* PRIMARY KEY - A constraint Primary Key (chave primaria), não permite valores nulos e impõe a exclusividade de linhas.  
* FOREIGN KEY - Uma Foreign key (chave estrangeira), impõe a integridade referencial, ela é definida em um conjunto de atributos em que é chamada de tabela de referencia e aponta para os atributos de chaves candidatas (primary key, unique constraint).  
* UNIQUE - A Constraint Unique, também impõe a exclusividade de linhas, porem, é um pouco parecida com a primary key, podem existir varias Unique Constraints na mesma tabela.  
* CONSTRAINT - É usada para dar nome à restrição de integridade.  
* IDENTITY - Tem como finalidade incrementar um valor a cada nova inserção.  

```
CREATE TABLE Funcionario 
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

CREATE TABLE Departamento
(
    Id int NOT NULL,
    Nome varchar(100) NOT NULL,
    Id_Funcionario int IDENTITY,
    CONSTRAINT pk_departamento PRIMARY KEY (Id),
    CONSTRAINT un_departamento UNIQUE (Nome),
    CONSTRAINT fk_funcionario FOREIGN KEY (Id_funcionario) REFERENCES Funcionario (Id) ON DELETE NO ACTION
)
```

Removendo uma tabela:  

```
DROP TABLE Departamento
```

Removendo todas as linhas de uma tabela:  

```
TRUNCATE TABLE Departamento
```

Alterar a estrutura de uma tabela, adicionando, removendo ou alterando colunas e restrições:  

Incluir uma nova coluna, não é permitido configurar uma coluna NOT NULL, a menos que um valor DEFAULT seja informado, se criada como NULL, a coluna pode ser alterada depois para NOT NULL usando ALTER TABLE ... ALTER COLUMN:

```
ALTER TABLE Funcionario ADD Formacao varchar(200) NOT NULL DEFAULT 0
```

Alterar especificação da coluna (tipo de dados, NULL etc.):

```
ALTER TABLE Funcionario ADD Nivel varchar(200) NULL
ALTER TABLE Funcionario ALTER COLUMN Nivel varchar(200) NOT NULL
```

Excluir uma coluna fisicamente:

```
ALTER TABLE Funcionario DROP COLUMN Nivel
```

Adicionar apenas uma restrição (a coluna deve existir):

```
ALTER TABLE Funcionario ADD CONSTRAINT CK_ativo CHECK (ativo = 'S' OR ativo = 'N')
```

Excluir uma restrição:

```
ALTER TABLE Funcionario DROP CONSTRAINT CK_ativo
```

## Linguagem SQL - DML (Data Manipulation Language)  

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

