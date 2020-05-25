-- ###################################

--		     FUNCIONES 2

-- ###################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 04/05/2020

USE BDResidenciasEscolares_prueba
GO


-- 9. Crea una funci�n escalar que reciba un par�metro de entrada de tipo varchar(40)
-- si este valor es null deber� devolver la funci�n �Valor nulo�

CREATE FUNCTION dbo.fn_nulo(@valor VARCHAR(40))
RETURNS VARCHAR(40)
AS
	BEGIN
		DECLARE @result VARCHAR(40)
		IF @valor IS NULL
			SET @result = 'Valor nulo'
		ELSE
			SET @result = @valor
		RETURN @result
	END
GO

SELECT dbo.fn_nulo(NULL) [Prueba Null], dbo.fn_nulo('Prueba') [Prueba Valor]
GO


-- 10. Haz una consulta que utilicemos la funci�n del ejercicio anterior en la cual visualicemos 
-- los nombres de todas las residencias y de todos los directores, en aquellos directores que tengan
-- valor null deber� aparecer �Valor nulo�.

SELECT nomResidencia, dbo.fn_nulo(nombreDirector) [director] from residencias
GO


-- 11. Haz una funci�n escalar que visualice el nombre de la universidad a la que pertenece la residencia con menos
-- plazas y con comedor o sin comedor en funci�n si pasamos por par�metro el valor 0 o 1. Si pasamos por par�metro de entrada
-- otro valor que no sea ni 0 ni 1 deber� visualizar -3. Hazlo tambi�n con los otros dos tipos de funciones. �Se podr� realizar?

-- Realizado con funci�n escalar
CREATE FUNCTION dbo.fn_mostrarUniversidadMenosPlazas(@comedor INT)
RETURNS VARCHAR(30)
AS
	BEGIN
		DECLARE @universidad VARCHAR(30)
		SET @universidad = '-3'

		IF (@comedor = 0 OR @comedor = 1)
			SELECT TOP 1 @universidad=nomUniversidad
			FROM Universidades
				INNER JOIN Residencias ON Universidades.codUniversidad = residencias.codUniversidad
			WHERE comedor = @comedor
			ORDER BY cantidadPlazas ASC

		RETURN @universidad
	END
GO

SELECT dbo.fn_mostrarUniversidadMenosPlazas(2)

SELECT dbo.fn_mostrarUniversidadMenosPlazas(1)

SELECT dbo.fn_mostrarUniversidadMenosPlazas(0)
GO

-- Realizado con funci�n con valores de tabla en l�nea
-- Nota: En el caso de estas funciones, no es posible sin utilizar
-- una funci�n intermediaria que controle el valor del par�metro tal y como se muestra a continuaci�n:

CREATE FUNCTION dbo.fn_mostrarUniversidadMenosPlazas_SolaLinea(@comedor INT)
RETURNS TABLE
AS
	RETURN (SELECT dbo.fn_mostrarUniversidadMenosPlazas(@comedor) AS [Universidad])
GO

SELECT * FROM dbo.fn_mostrarUniversidadMenosPlazas_SolaLinea(2)

SELECT * FROM dbo.fn_mostrarUniversidadMenosPlazas_SolaLinea(1)

SELECT * FROM dbo.fn_mostrarUniversidadMenosPlazas_SolaLinea(0)
GO

-- Realizado con funci�n con valores de tabla de varias instrucciones
CREATE FUNCTION dbo.fn_mostrarUniversidadMenosPlazas_VariasLineas(@comedor INT)
RETURNS @fn_universidad TABLE (nombreUniversidad VARCHAR(30) NOT NULL)
AS
	BEGIN
		IF (@comedor = 1 OR @comedor = 0)
			INSERT @fn_universidad SELECT TOP 1 nomUniversidad
								   FROM Universidades
									INNER JOIN Residencias ON Universidades.codUniversidad = residencias.codUniversidad
								   WHERE comedor = @comedor
								   ORDER BY cantidadPlazas ASC
		ELSE
			INSERT @fn_universidad VALUES ('-3')
		RETURN
	END
GO

SELECT * FROM dbo.fn_mostrarUniversidadMenosPlazas_VariasLineas(2)

SELECT * FROM dbo.fn_mostrarUniversidadMenosPlazas_VariasLineas(1)

SELECT * FROM dbo.fn_mostrarUniversidadMenosPlazas_VariasLineas(0)
GO


-- 12. Crear una funci�n escalar que pas�ndole un dni de un alumno nos devuelva en n�mero de meses el tiempo que ha estado en
-- residencias escolares en total (contando todos las residencias en las que ha estado), sino existe ning�n alumno con
-- el dni pasado por par�metro devuelva el valor -3.

CREATE FUNCTION dbo.fn_totalMeses(@dni CHAR(9))
RETURNS INT
AS
	BEGIN
		DECLARE @result INT

		IF (SELECT COUNT(*) FROM estudiantes WHERE dni = @dni) = 0
			SET @result = -3		
		ELSE
			SELECT @result=SUM(DATEDIFF(mm, fechaInicio, fechaFin))
			FROM estudiantes
				INNER JOIN estancias ON estudiantes.codEstudiante = estancias.codEstudiante
			WHERE dni = @dni
		RETURN @result
	END
GO

-- DNI de alumno no existente
SELECT dbo.fn_totalMeses('77777777Z')

-- DNI V�lido
SELECT dbo.fn_totalMeses('11111111P')
GO


-- 13. Crear una funci�n (no ser� escalar ahora) que haga lo mismo que el anterior ejercicio.

CREATE FUNCTION dbo.fn_totalMeses_Bis(@dni CHAR(9))
RETURNS @fn_meses TABLE (total INT)
AS
	BEGIN
		IF (SELECT COUNT(*) FROM estudiantes WHERE dni = @dni) = 0
			INSERT @fn_meses VALUES (-3)
		ELSE
			INSERT @fn_meses SELECT SUM(DATEDIFF(mm, fechaInicio, fechaFin))
			FROM estudiantes
				INNER JOIN estancias ON estudiantes.codEstudiante = estancias.codEstudiante
			WHERE dni = @dni
		RETURN
	END
GO

SELECT * FROM dbo.fn_totalMeses_Bis('77777777Z')
SELECT * FROM dbo.fn_totalMeses_Bis('11111111P')
GO