CREATE DATABASE Escola

GO

USE Escola

GO

-------------------------------------------------------

-- Criando as Tabelas ---------------------------------

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

-- Inserindo Registros --------------------------------

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

-- Cláusulas e Operadores -----------------------------

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

-- Busque em paginação os registros de alunos a partir do aluno de id = 3

SELECT * FROM Alunos 
ORDER BY id
OFFSET 2 ROWS

-- Busque em paginação os registros de alunos a partir do aluno de id = 3, após, retorne apenas os próximos 2 registros

SELECT * FROM Alunos 
ORDER BY id
OFFSET 2 ROWS
FETCH FIRST 2 ROWS ONLY

-- Busque todos os alunos onde a sua cidade seja Minas Gerais

SELECT * FROM Alunos WHERE cidade = 'Minas Gerais'

-- Busque todos os alunos onde a sua cidade seja Minhas Gerais e que o id seja maior ou igual a 2

SELECT * FROM Alunos WHERE cidade = 'Minas Gerais' AND id >= 2

-- Busque todos os alunos onde a sua cidade seja Minas Gerais ou São Paulo

SELECT * FROM Alunos WHERE cidade = 'Minas Gerais' OR cidade = 'São Paulo'

-- Busque todos os alunos onde o id seja >= 3 e que o nome seja igual a 'Felipe' ou 'Henrique'

SELECT * FROM Alunos WHERE id >= 3 AND (nome = 'Felipe' OR nome = 'Henrique')

-- Busque todos os alunos onde o nome possua a letra 'e'

SELECT * FROM Alunos WHERE nome LIKE '%e%'

-- Busque todos os alunos onde o nome começa com 'Y'

SELECT * FROM Alunos WHERE nome LIKE 'Y%'

-- Busque todos os alunos onde o nome começa com 'Y' e termina com 'i'

SELECT * FROM Alunos WHERE nome LIKE 'Y%i'

-- Busque qual o id máximo que temos na tabela Alunos

SELECT MAX(id) FROM Alunos

-- Busque qual o id mínimo que temos na tabela Alunos

SELECT MIN(id) FROM Alunos

-- Busque o aluno onde o id é igual ao valor máximo de id na tabela

SELECT * FROM Alunos WHERE id = (SELECT MAX(id) FROM Alunos)

-- Busque a quantidade de registros que existem na tabela Cursos

SELECT COUNT(*) FROM Cursos 

-- Busque a soma da horas de todos os cursos

SELECT SUM(total_horas) FROM Cursos

-- Busque a quantidade de registros que existem na tabela Cursos, a soma das horas e a soma dos valores. Informe os nomes respectivos para cada coluna.

SELECT COUNT(*) as total_registros,
SUM(total_horas) as total_horas,
SUM(valor) as valor 
FROM Cursos

-- Busque todas as cidades e estados de forma agrupada da tabela Alunos

SELECT cidade, estado FROM Alunos
GROUP BY cidade, estado

-- Busque todas as cidades e estados de forma agrupada da tabela Alunos, e retorne em outra coluna a quantidade que tem de cada estado

SELECT cidade, estado, COUNT(*) as total_estados FROM Alunos
GROUP BY cidade, estado

-- Busque de forma agrupada todas as cidades e estados que tenham mais de 1 registro cadastrado na tabela Alunos, e retorne em outra coluna a quantidade que tem de cada estado

SELECT cidade, estado, COUNT(*) as total FROM Alunos
GROUP BY cidade, estado
HAVING COUNT(*) > 1

-- Busque todos os alunos que possuam os id's 2 e 4

SELECT * FROM Alunos WHERE id IN (2, 4)

-- Busque todos os alunos pelo id em uma subquery

SELECT * FROM Alunos WHERE id IN (SELECT id FROM Alunos)

-- Busque todos os alunos que estejam entre os valores 2 e 4

SELECT * FROM Alunos WHERE id BETWEEN 2 AND 4

-------------------------------------------------------

-- JOINS ----------------------------------------------

-- INNER JOIN
-- Busque os Cursos registrados e suas respectivas Categorias

SELECT * FROM Cursos cr
INNER JOIN Categorias ca
ON cr.categoria_id = ca.id

-- Busque a descrição dos Cursos registrados e a descrição de suas respectivas Categorias

SELECT cr.descricao as Cursos, ca.descricao as Categorias FROM Cursos cr
INNER JOIN Categorias ca
ON cr.categoria_id = ca.id

-- LEFT JOIN
-- Busque as Categorias registradas e seus respectivos Cursos, até mesmo as Categorias que não possuem cursos registrados

SELECT * FROM Categorias ca
LEFT JOIN Cursos cr
ON ca.id = cr.categoria_id

-- RIGHT JOIN
-- Busque as Categorias registradas e seus respectivos Cursos, até mesmo as Categorias que não possuem cursos registrados

SELECT * FROM Cursos cr
RIGHT JOIN Categorias ca
ON cr.categoria_id = ca.id

-- FULL JOIN (Combinação entre o LEFT JOIN e o RIGHT JOIN)
-- Busque todos os registros de Categorias e Cursos, independente se há valores nulos ou não

SELECT * FROM Cursos cr
FULL JOIN Categorias ca
ON cr.categoria_id = ca.id
-- ou
SELECT * FROM Categorias ca
FULL JOIN Cursos cr
ON cr.categoria_id = ca.id

-- UNION
-- Busque em uma mesma consulta (em uma mesma coluna) a descrição do Curso de id '1', a descrição de sua categoria e imprima um valor dinâmico 'FIM', não pegando valores duplicados

SELECT descricao FROM Cursos
WHERE id = 1
UNION
SELECT descricao FROM Categorias
WHERE id = 1
UNION
SELECT 'FIM'
UNION 
SELECT 'FIM'

-- UNION ALL
-- Busque em uma mesma consulta (em uma mesma coluna) a descrição do Curso de id '1', a descrição de sua categoria e imprima um valor dinâmico 'FIM', pegando valores duplicados caso existam

SELECT descricao FROM Cursos
WHERE id = 1
UNION ALL
SELECT descricao FROM Categorias
WHERE id = 1
UNION ALL
SELECT 'FIM'
UNION ALL
SELECT 'FIM'

-------------------------------------------------------

-- Transaction (Garantindo a integridade dos dados) ---

-- Atualize a descrição de todas as Categorias para Uppercase e exclua a Categoria de id 4

BEGIN TRANSACTION -- Iniciando uma transação

UPDATE Categorias
SET descricao = UPPER(descricao)
WHERE id > 0

GO

DELETE Categorias
WHERE id = 4

GO

COMMIT -- Confirmando as modificação da transação

ROLLBACK -- Desfazendo as modificações da transação

-- Save Point (Fazer ROLLBACk em um determinado ponto da Transação)
-- Insira dois novos registros de Categorias e salve, depois atualize um dos registros de Categorias. Volte ao ponto que foi salvo, desfazendo o UPDATE do registro atualizado

BEGIN TRANSACTION

INSERT INTO Categorias (descricao, cadastrado_em)
VALUES
('Categoria Nova 1', GETDATE()),
('Categoria Nova 2', GETDATE())

GO

SAVE TRANSACTION AtualizacaoPoint

UPDATE Categorias
SET descricao = 'Aplicação WEB'
WHERE descricao = 'WEB'

GO

SELECT * FROM Categorias

ROLLBACK TRANSACTION AtualizacaoPoint
COMMIT

SELECT * FROM Categorias

-------------------------------------------------------

-- T-SQL ----------------------------------------------