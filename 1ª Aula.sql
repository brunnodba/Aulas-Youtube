/*
Funções de Cadeia de Caracteres:
https://docs.microsoft.com/pt-br/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-2017

### AULA 01 ###

Funções Mais Utilizadas (2008 diante) --
	1) UPPER/LOWER
	2) RTRIM/ LTRIM/ TRIM**
	3) REVERSE
	4) CONCAT* / CONCAT_WS**

	Obs.:	 * 2012
			** 2017
*/




USE TSQLV4
-- 1) LOWER/UPPER (Manter Padrão na Entrada dos Dados)
	SELECT 
		firstname,
		LOWER(firstname) AS Nome_minusculo,
		UPPER(firstname) AS Nome_MAIUSCULO
	FROM HR.Employees

-- 2) RTRIM/LTRIM/TRIM**
	DECLARE 
		@TEXTO VARCHAR (50) = '     _ARQUIVO_ABC_123_FINAL_DATA     '
	
	SELECT RTRIM(@TEXTO)	AS [RTRIM]				

	SELECT LTRIM(@TEXTO)	AS [LTRIM]				
	
	SELECT LTRIM(RTRIM(@TEXTO))	AS [LTRIM+RTRIM]	

-- ** 2017
	SELECT TRIM(@TEXTO)		AS [TRIM]				






-- 3) REVERSE
	SELECT
		firstname,
		REVERSE(firstname) AS Nome_Invertido,
		POSTALCODE,
		REVERSE(POSTALCODE) AS POSTALCODE_REVERSE
	FROM
		HR.Employees

	
	DECLARE @NOME VARCHAR(10)
	SET @NOME = 'OVO'	
	
	SELECT
		 @NOME AS NOME
		,REVERSE(@NOME) AS NOME_REVERSE
		,CASE 
			WHEN @NOME = REVERSE(@NOME) THEN 'É PALÍNDROMO'
			ELSE 'NÃO É PALÍNDROMO'
		 END AS VERIFICA_NOME






		



-- 4) CONCAT: Concatena dois ou mais valores  (* 2012)

	SELECT 'Feliz ' + 2019 + ' Século: ' + 3*7

	SELECT 'Feliz ' + CAST(2019 AS VARCHAR(4)) + ' Século: ' + CAST(3*7 AS VARCHAR(2))
	
	SELECT CONCAT ( 'Feliz ', 2019, ' Século: ', 3*7 ) AS Resultado 

	SELECT 'Feliz' + NULL + '2019'

	SELECT CONCAT('Feliz', NULL, '2019')

	SELECT 
		firstname 
		,lastname
		,CONCAT(firstname, ' ', lastname) AS [NOME COMPLETO]
		,CONCAT(firstname, ' ', lastname, ' possui ', DATEDIFF(YEAR,birthdate,GETDATE()),' anos de idade') AS RESUMO
	FROM HR.Employees

	SELECT 
		firstname + ' ' + 
		lastname	AS [NOME COMPLETO]
	FROM HR.Employees

-- CONCAT_WS (separador) - (** 2017)

	SELECT CONCAT_WS ( '|','Feliz ', 2019, ' Século: ', 3*7 ) AS Resultado 

	SELECT CONCAT_WS ( '|','Feliz ', 2019, NULL, ' Século: ', 3*7 ) AS Resultado 

-- COMPARAÇÃO
	SELECT CONCAT_WS ( ',','Feliz', 2019, NULL,'Século', 3*7 ) AS Resultado 

	SELECT 'Feliz'						+ ','
			+ CAST(2019 AS VARCHAR(4))	+ ',' 
			+ ISNULL(NULL,'')
			+ 'Século'					+ ',' 
			+ CAST(3*7 AS VARCHAR(2))





