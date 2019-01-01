/*
Funções de Cadeia de Caracteres:
https://docs.microsoft.com/pt-br/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-2017

Quantidade total: 31
USO:
Frequente: 18
Provável: 8
Remoto: 5 (não serão ensinadas)

*/

-- OBS: FUNÇÕES COM * SÃO COMPATÍVEIS A PARTIR DA VERSÃO 2008

/* Funções Mais Utilizadas (2012 diante) --
	1) CONCAT
	2) FORMAT
	3) LOWER/UPPER*
	4) REPLICATE* 
	5) RTRIM/LTRIM*
	6) STR*
	7) REVERSE*
	8) CHARINDEX*
	9) PATINDEX*

*/

-- 1)CONCAT: Concatena dois ou mais valores 

	SELECT 'Feliz ' + 2019 + ' Século: ' + 3*7

	SELECT CONCAT ( 'Feliz ', 2019, ' Século: ', 3*7 ) AS Resultado  

	SELECT 
		NOME 
		--,SOBRENOME
		--,CONCAT(NOME, ' ', SOBRENOME) AS [NOME COMPLETO]
		--,CONCAT(NOME, ' ', SOBRENOME, ' possui ', DATEDIFF(YEAR,DATA_NASC,GETDATE()),' anos de idade') AS RESUMO
	FROM ALUNO

	

-- 2)FORMAT: Retorna um valor formatado com o formato e a cultura opcional
-- Sintaxe: FORMAT ( value, format, culture )  
-- Extra: https://www.dirceuresende.com/blog/sql-server-utilizando-a-funcao-format-para-aplicar-mascaras-e-formatacoes-em-numeros-e-datas/

	SELECT @@LANGUAGE

	-- Omitindo parâmetro Culture (pega padrão da instalação)
	DECLARE @d DATETIME = '2011/01/10';  
	SELECT FORMAT(@d,'d');

	-- Formatando valor
	SELECT FORMAT(3548250.15,'N') AS LUCRO

	DECLARE @d DATETIME = '2011/01/10';  
	SELECT FORMAT ( @d, 'd', 'en-US' ) AS 'US English Result'  
		  ,FORMAT ( @d, 'd', 'en-gb' ) AS 'Great Britain English Result'  
		  ,FORMAT ( @d, 'd', 'de-de' ) AS 'German Result'  
		  ,FORMAT ( @d, 'd', 'pt-br' ) AS 'Brazil Result'  

	DECLARE @d DATETIME = GETDATE();  
	SELECT 
			FORMAT( @d, 'dd/MM/yyyy', 'en-US' ) AS 'DateTime Result'  
			,FORMAT( @d, 'dd/mm/yyyy', 'en-US' ) AS 'DateTime Result'  
			,FORMAT(12345678900,'###-###-###-##') AS 'CPF';

	SELECT FORMAT(cast('07:35' as time), N'hh\.mm');  --> returns 07.35  
	SELECT FORMAT(cast('07:35' as time), N'h\:mm');  --> returns 07:35  

	SELECT FORMAT(29702,'#,#')




-- 3) LOWER/UPPER*
	SELECT
		NOME,
		LOWER(NOME) Nome_minusculo,
		UPPER(NOME) Nome_MAIUSCULO
	FROM
		ALUNO



-- 4) REPLICATE*
	SELECT	
			REPLICATE('0',10)
			,REPLICATE(' ',10)
			,NOTA
			--,REPLICATE('0',3) + '-' + NOTA AS CPF_TRATADO
	FROM
		NOTAS



-- 5) RTRIM/LTRIM*
	DECLARE 
		@TEXTO VARCHAR (50) = '     _ARQUIVO_ABC_123_FINAL_DATA     '
	
	SELECT RTRIM(@TEXTO)	AS [RTRIM]
		-- ''
	
	SELECT LTRIM(RTRIM(@TEXTO))	AS [LTRIM+RTRIM]
	-- ''



-- 6) STR*: Retorna dados de caractere convertidos de dados numéricos.
	SELECT STR(123.45, 10, 1)
	''

	SELECT STR(123.45, 2, 2)	-- Quando a expressão excede o comprimento especificado, a cadeia de caracteres retorna **



-- 7) REVERSE*
	SELECT
		EMAIL,
		REVERSE(EMAIL) Nome_Invertido
	FROM
		ALUNO



-- 8) CHARINDEX*: Essa função pesquisa uma expressão de caractere dentro de uma segunda expressão de caractere, 
--retornando a posição inicial da primeira expressão, se localizada.

	SELECT
		EMAIL,
		CHARINDEX('@',EMAIL,0) [POSICAO_@]
	FROM
		ALUNO 



-- 9) PATINDEX*: Retorna a posição inicial da primeira ocorrência de um padrão em uma expressão 
	
	-- CPFs que possuam seqência do dígito 3
	SELECT
		CPF
		,PATINDEX('%333%',CPF)
	FROM
		ALUNO
	WHERE
		PATINDEX('%333%',CPF) >= '0'

	-- Nomes que possuam "jo"
	SELECT
		NOME
		,PATINDEX('%jo%',NOME)
	FROM
		ALUNO
	WHERE
		PATINDEX('%jo%',NOME) > '0'

	-- Nomes que possuam "io"
	SELECT
		NOME
		,PATINDEX('%io%',NOME)
	FROM
		ALUNO
	WHERE
		PATINDEX('%io%',NOME) > '0'

	-- Nomes que Possuam Números
	SELECT
		NOME
		,PATINDEX('%[0-9]%',NOME)
	FROM
		ALUNO
	WHERE
		PATINDEX('%[0-9]%',NOME) > '0'

		-- Emails que Hotmail que possuam .br (Retirar)
	SELECT
		EMAIL
		,PATINDEX('%hotmail%.br%', EMAIL)
		,PATINDEX('%hotmail%', EMAIL)
	FROM
		ALUNO
	WHERE
		PATINDEX('%hotmail%.br%', EMAIL) >= '0'
	and PATINDEX('%hotmail%', EMAIL) >0 