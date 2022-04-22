CREATE DATABASE Escola

GO

USE Escola

GO

-------------------------------------------------------

-- Criando as Tabelas

CREATE TABLE Alunos
(
	id INT PRIMARY KEY IDENTITY,
	nome VARCHAR(80) NOT NULL,
	cpf CHAR(11) NOT NULL,
	cidade VARCHAR(60) NOT NULL,
	estado CHAR(2) NOT NULL,
	data_nascimento DATE,
	ativo BIT DEFAULT 1
)

GO

CREATE TABLE Categorias
(
	id INT PRIMARY KEY IDENTITY,
	descricao VARCHAR(80) NOT NULL,
	cadastrado_em DATETIME DEFAULT GETDATE()
)

GO

CREATE TABLE Cursos
(
	id INT PRIMARY KEY IDENTITY,
	categoria_id INT NOT NULL,
	descricao VARCHAR(80) NOT NULL,
	total_horas INT NOT NULL,
	valor DECIMAL(12,2) NOT NULL DEFAULT 0,
	cadastrado_em DATETIME DEFAULT GETDATE(),
	ativo BIT DEFAULT 1,
	CONSTRAINT fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
)

GO

-- Tabela Associativa
CREATE TABLE Alunos_Cursos
(
	aluno_id INT NOT NULL,
	curso_id INT NOT NULL,
	cadastrado_em DATETIME DEFAULT GETDATE(),
	CONSTRAINT pk_alunos_cursos PRIMARY KEY (aluno_id, curso_id),
	CONSTRAINT fk_aluno_id FOREIGN KEY (aluno_id) REFERENCES Alunos(id),
	CONSTRAINT fk_curso_id FOREIGN KEY (curso_id) REFERENCES Cursos(id)
)

GO

-------------------------------------------------------

-- Inserindo Registros

INSERT INTO Alunos (nome, cpf, cidade, estado, data_nascimento)
VALUES
('Yuri', '00000000001', 'Minas Gerais', 'MG', '2000-01-01'),
('Vitoria', '00000000002', 'Minas Gerais', 'MG', '2000-01-02'),
('Felipe', '00000000003', 'São Paulo', 'SP', '2000-01-03'),
('Henrique', '00000000004', 'São Paulo', 'SP', '2000-01-04'),
('Daniel', '00000000005', 'Rio de Janeiro', 'RJ', '2000-01-05')

GO

INSERT INTO Categorias (descricao)
VALUES
('Acesso a Dados'),
('Segurança'),
('WEB')

GO

INSERT INTO Cursos (categoria_id, descricao, total_horas, valor)
VALUES
(1, 'EF Core', 17, 300),
(1, 'SQL Server', 5, 200),
(3, 'ASP.NET Core Enterprise', 5, 200),
(2, 'Fundamentos de IdentityServer4', 5, 200)

GO

INSERT INTO Alunos_Cursos (aluno_id, curso_id)
VALUES
(1,1),
(1,2),
(2,3),
(3,1),
(4,4),
(5,1),
(5,2),
(5,3)

GO

-------------------------------------------------------

-- Cláusulas e Operadores

-- Busque quais cidades e estados estão cadastradas na tabela Alunos, sem dados duplicados

SELECT DISTINCT cidade, estado FROM Alunos

-- Busque todos os alunos em ordem alfabética pelo nome (ascendente)

SELECT * FROM Alunos ORDER BY nome ASC

-- Busque todos os alunos em ordem alfabética pelo nome (descendente)

SELECT * FROM Alunos ORDER BY nome DESC

-- Busque todos os alunos ordenando primeiro pelo nome (ascendente) e depois pelo cpf (descendente) e estado (ascendente)

SELECT * FROM Alunos ORDER BY nome ASC, cpf DESC, estado ASC

-- Busque apenas os 4 primeiros registros de alunos

SELECT TOP 4 * FROM Alunos

-- Busque apenas 10% de registros de alunos

SELECT TOP 10 PERCENT * FROM Alunos

-- Busque em paginação os registros de alunos a partir do aluno de id = 3, após, retorne apenas os próximos 2 registros

SELECT * FROM Alunos 
ORDER BY id
OFFSET 2 ROWS
FETCH FIRST 2 ROWS ONLY
