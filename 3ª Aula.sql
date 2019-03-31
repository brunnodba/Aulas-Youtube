/*
Funções de Cadeia de Caracteres:
https://docs.microsoft.com/pt-br/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-2017

*/

-- OBS: FUNÇÕES COM * SÃO COMPATÍVEIS A PARTIR DA VERSÃO 2012

/* Funções Mais Utilizadas (2008 diante) --
	1) CHARINDEX
	2) REPLACE
	3) SUBSTRING

*/

-- 1) CHARINDEX
	
	2345 Gilbert St.
	5 Gilbert St.
	 Gilbert St.
	SELECT TOP 5
		address,
		CHARINDEX('5',address,4),
		CHARINDEX('St',address,5)
	FROM
		production.Suppliers

















-- 2) REPLACE

	SELECT
		firstname,
		titleofcourtesy
		,replace(titleofcourtesy,'Ms.','Senhorita') AS FEMININO,
		replace(titleofcourtesy,'Mr.','Senhor') AS MASCULINO
	FROM HR.Employees
	WHERE 
		empid IN(1,3,5)
















-- 3) SUBSTRING*
		
	DECLARE @NASCIMENTO VARCHAR(12) =  '2000-10-25'

	SELECT
		firstname,
		birthdate
		,LEFT(birthdate,4) AS ANO_NASCIMENTO
		,RIGHT(birthdate,2) AS DIA_NASCIMENTO
		---- MES_NASCIMENTO ???
		,SUBSTRING(@NASCIMENTO,6,2) AS  MES_NASCIMENTO
		,SUBSTRING(CAST(birthdate AS VARCHAR(20)),6,2) AS  MES_NASCIMENTO
	FROM
		HR.Employees

