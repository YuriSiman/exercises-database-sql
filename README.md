<div id="top"></div>

<br/>
<div align="center">
    <img src="./readme-img/microsoftsqlserver-plain.svg" alt="Logo" width="100" height="100" />
    <h1 align="center">SQL Server</h1>
    <p align="center">Banco de Dados com SQL Server</p>
</div>

<br/>

<div align="center">
    <a href="https://github.com/YuriSiman/learn-sql-server/blob/master/LICENSE" target="_blank">
      <img alt="LICENSE" src="https://img.shields.io/badge/license-mit-%23A6CE39?style=for-the-badge&logo=github" />
    </a>
    <a href="https://github.com/YuriSiman" target="_blank">
      <img alt="GitHub" src="https://img.shields.io/badge/github-perfil-%237159c1?style=for-the-badge&logo=github" />
    </a>
    <a href="https://yurisiman.com.br" target="_blank">
      <img alt="Site" src="https://img.shields.io/badge/site-yurisiman-E0A80D?style=for-the-badge&logo=Purism" />
    </a>
    <a href="https://www.linkedin.com/in/yurisiman/" target="_blank">
      <img alt="Linkedin" src="https://img.shields.io/badge/linkedin-social-0A66C2?style=for-the-badge&logo=LinkedIn" />
    </a>
    <a href="mailto:contato@yurisiman.com.br" target="_blank">
      <img alt="Gmail" src="https://img.shields.io/badge/email-contato-EA4335?style=for-the-badge&logo=Gmail" />
    </a>
</div>

<br/>

## :clipboard: Sobre o Projeto

Este repositório foi criado com o objetivo de ser uma fonte de documentação e consulta sobre os principais comandos do SQL Server.

Aproveite! :octocat:

---

## :pencil: Pré-requisitos

1. Se você não possui o SQL Server instalado, acesse [aqui](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) e instale conforme o seu sistema operacional.
2. Instale o [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15) para gerenciar bancos de dados e trabalhar com o SQL Server.
3. Clone este repositório em sua máquina local

   ```sh
   git clone https://github.com/YuriSiman/learn-sql-server.git
   ```

---

## :dart: Tópicos

<details>
  <summary>DDL - Linguagem de Definição de Dados</summary>
  <ul>
    <li><a href="#create">CREATE</a></li>
    <li><a href="#alter">ALTER</a></li>
    <li><a href="#drop">DROP</a></li>
    <li><a href="#truncate-table">TRUNCATE TABLE</a></li>
  </ul>
</details>
<details>
  <summary>DML - Linguagem de Manipulação de Dados</summary>
  <ul>
    <li><a href="#insert">INSERT</a></li>
    <li><a href="#select">SELECT</a></li>
    <li><a href="#update">UPDATE</a></li>
    <li><a href="#delete">DELETE</a></li>
  </ul>
</details>

---

## :rocket: Vamos Começar

### DDL - Linguagem de Definição de Dados

<div id="create"></div>

#### CREATE

Criando uma base de dados.

```sql
CREATE DATABASE teste
```

Criando uma tabela.

```sql
CREATE TABLE Alunos
(
	id INT PRIMARY KEY IDENTITY,
	nome VARCHAR(80) NOT NULL,
	cpf CHAR(11) NOT NULL,
	data_cadastro DATE,
	ativo BIT DEFAULT 1
)
```

<div id="alter"></div>

#### ALTER

Alterando uma tabela.

```sql

```

<div id="drop"></div>

#### DROP

Deletando uma tabela.

```sql
DROP TABLE Alunos
```

<div id="truncate-table"></div>

#### TRUNCATE TABLE

Deletando **somente os registros** de uma tabela.

```sql
TRUNCATE TABLE Alunos
```

<p align="right"><a href="#top">Início ↑</a></p>

---

### DML - Linguagem de Manipulação de Dados

<div id="insert"></div>

#### INSERT

Inserindo dados em uma tabela.

```sql
INSERT INTO Alunos
VALUES
('Yuri', '00000000001', GETDATE(), 1),
('Felipe', '00000000001', GETDATE(), 1),
('Henrique', '00000000001', GETDATE(), 1)
```

<div id="select"></div>

#### SELECT

Buscando todos os dados em uma tabela.

```sql
SELECT * FROM Alunos
```

Buscando dados específicos em uma tabela.

```sql
SELECT nome, cpf FROM Alunos
```

<div id="update"></div>

#### UPDATE

Alterando **todos** os registros de uma tabela.

```sql
UPDATE Alunos
SET ativo = 0
```

Alterando os registros de uma tabela conforme uma condição

```sql
UPDATE Alunos
SET ativo = 0
WHERE id = 1
```

<div id="delete"></div>

#### DELETE

Deletando dados em uma tabela.

```sql
DELETE FROM Alunos
```

Deletando 1 registro apenas da tabela.

```sql
DELETE TOP (1) FROM Alunos
```

Deletando uma quantidade percentual de registros da tabela.

```sql
DELETE TOP (10) PERCENT FROM Alunos
```

<p align="right"><a href="#top">Início ↑</a></p>

---

## :vertical_traffic_light: Status do Projeto

:heavy_check_mark: Concluído

---

## :thinking: Contribuindo

> Passo a passo de como contribuir...

### Passo 1

* :fork_and_knife: Fork este repositório!

### Passo 2

* :dancers: Clone este repositório para sua máquina local usando `git clone https://github.com/YuriSiman/learn-sql-server.git`

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

---

## :pencil: Licença

<a href="https://github.com/YuriSiman/learn-sql-server/blob/master/LICENSE" target="_blank">
  <img alt="LICENSE" src="https://img.shields.io/badge/license-mit-%23A6CE39?style=for-the-badge&logo=github" />
</a>

##

Code your life :octocat:

<p align="right"><a href="#top">Início ↑</a></p>
