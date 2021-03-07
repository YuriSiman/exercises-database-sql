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

--- 

## :rocket: Vamos Começar  

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

## Tipos de Dados Disponíveis  

BD1_07_sql_ddl.pdf pág 15

---

## Linguagem SQL - DDL (Data Definition Language)  

Os comandos DDL para **criar**, **alterar** e **remover** tabelas e outros objetos são:  

* CREATE
* ALTER
* DROP

Criando um banco de dados:

```
CREATE DATABASE Teste
```

Criando tabelas:

```
CREATE TABLE Funcionario 
(
    CPF char(11) not null,
    Nome varchar(100) not null,
    Salario numeric(7,2) not null,
    Endereco varchar(200),
    DataNascimento datetime not null,
    PRIMARY KEY (CPF)
)

CREATE TABLE Departamento
(
    Numero int not null,
    Nome varchar(100) not null,
    CPF_Funcionario char(11),
    PRIMARY KEY (Numero),
    UNIQUE (Nome),
    FOREIGN KEY (CPF_Funcionario) REFERENCES Funcionario (CPF)
)
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

