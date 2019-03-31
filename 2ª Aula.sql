/*
Funções de Cadeia de Caracteres:
https://docs.microsoft.com/pt-br/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-2017

*/

-- OBS: FUNÇÕES COM * SÃO COMPATÍVEIS A PARTIR DA VERSÃO 2012

/* Funções Mais Utilizadas (2008 diante) --
	1) SPACE
	2) LEFT / RIGHT
	3) LEN
	4) REPLICATE

*/

-- 1) SPACE
	SELECT
		firstname,
		firstname + SPACE(10) + lastname AS [NOME COM ESPACO]
		firstname + '          ' + lastname + 
		SPACE(250)
	FROM
		HR.Employees

		'Sara          Davis'
		

	select '123          ' + 'abc'
	select '123' + SPACE(10) + 'abc'

-- Exemplo Arquivo Posicional
SELECT TOP 5
/*01-07*/ 'AGENCIA' + 
/*08-02*/ SPACE(2)  +  
/*10-02*/ CAST(EMPID AS CHAR(1)) +
/*11-02*/ SPACE(2)  +  
/*13-20*/ FIRSTNAME +
/*33-05*/ SPACE(5)  +  
/*38-40*/ LASTNAME                    
FROM
		HR.Employees






-- 2) LEFT / RIGHT

	DECLARE @CARTAO VARCHAR(50) = '4004 1111 2222 4444'

	SELECT 
		'4 PRIMEIROS DIGITOS DO CARTAO: '+
		LEFT(@CARTAO,4) +
		SPACE(10) +
		'4 ÚLTIMOS DIGITOS DO CARTAO ' +
		RIGHT(@CARTAO,4)
	FROM HR.Employees










-- 3) LEN

	SELECT 
		FIRSTNAME,
		LEN(FIRSTNAME)
	FROM HR.Employees
















-- 4) REPLICATE*
	
	SELECT	
			REPLICATE('0',10)
			,REPLICATE('S',10)
			,POSTALCODE
			,REPLICATE('0',3) + '-' + CONVERT(VARCHAR(50),POSTALCODE) AS CEP
	FROM
		HR.Employees

