-- ###################################

--		     FUNCIONES 4

-- ###################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 11/05/2020

USE BDResidenciasEscolares_prueba
GO

-- 19. Haz una funci�n que visualice el nombre de la universidad que tenga en total menos cantidad de plazas entre
-- todas sus residencias. Hazlo con los tres tipos de funciones.

-- Funci�n escalar
CREATE FUNCTION dbo.fn_ejercicio19_1()
RETURNS VARCHAR(30)
AS
	BEGIN
		RETURN (SELECT TOP 1 nomUniversidad
				FROM Universidades
					INNER JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
				GROUP BY nomUniversidad
				ORDER BY SUM(cantidadPlazas) ASC
			)
	END
GO

-- Funci�n de tabla en una l�nea
CREATE FUNCTION dbo.fn_ejercicio19_2()
RETURNS TABLE
AS
	RETURN (SELECT TOP 1 nomUniversidad
			FROM Universidades
				INNER JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
			GROUP BY nomUniversidad
			ORDER BY SUM(cantidadPlazas) ASC
		)
GO

-- Funci�n de tabla en varias l�neas
CREATE FUNCTION dbo.fn_ejercicio19_3()
RETURNS @universidad TABLE (nombre VARCHAR(30))
AS
	BEGIN
		INSERT @universidad SELECT TOP 1 nomUniversidad
			FROM Universidades
				INNER JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
			GROUP BY nomUniversidad
			ORDER BY SUM(cantidadPlazas) ASC
		RETURN
	END
GO

SELECT dbo.fn_ejercicio19_1()
SELECT * FROM dbo.fn_ejercicio19_2()
SELECT * FROM dbo.fn_ejercicio19_3()
GO


-- 20. Haz una funci�n que visualice los nombres de las universidades y la cantidad total de plazas que tienen,
-- pero solo de aquellas universidades que en total tengan menos plazas en sus residencias que la universidad
-- cuyo nombre pasamos por par�metro. Si la universidad pasada por par�metro no existe visualizaremos �universidad
-- no existe�, -1 
-- �Se puede hacer con otros tipos de funciones?

CREATE FUNCTION dbo.fn_ejercicio20(@universidad VARCHAR(30))
RETURNS @result TABLE (nombre VARCHAR(30), cantidad INT)
AS
	BEGIN
		IF (SELECT COUNT(*) FROM Universidades WHERE nomUniversidad = @universidad) = 0
			INSERT @result VALUES ('universidad no existe', -1)
		ELSE
			BEGIN
				DECLARE @cantidadUni INT

				-- Calculamos primero la cantidad que tiene la universidad indicada por par�metro
				SELECT @cantidadUni=SUM(cantidadPlazas)
				FROM residencias
				WHERE codUniversidad = (SELECT codUniversidad FROM Universidades WHERE nomUniversidad = @universidad)

				-- Guardamos los resultados en la tabla a generar de las universidades con menor cantidad a la dada
				INSERT @result SELECT nomUniversidad, SUM(cantidadPlazas)
							   FROM Universidades
									INNER JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
							   GROUP BY nomUniversidad
							   HAVING SUM(cantidadPlazas) < @cantidadUni
			END
		RETURN
	END
GO

SELECT * FROM dbo.fn_ejercicio20('Universidad falsa')
SELECT * FROM dbo.fn_ejercicio20('Universidad de La Laguna')
GO

-- No se puede hacer con las otras funciones por los siguientes motivos:
-- Funciones escalares: Permiten que se retorne un valor �nico, simple. No podemos retornar el nombre y la cantidad simultaneamente (sin usar operaciones como concatenar en strings)
-- Funciones de tabla en una l�nea: No podemos realizar la comprobaci�n de si la universidad existe y obtener los resultados; requiere varias instrucciones


-- 21. Al ejercicio anterior modificamos y cuando no exista la universidad vamos a visualizar todos los nombres de todas las universidades
-- y cantidad de plazas en total de cada universidad. Cuando existe la universidad igual al anterior.

ALTER FUNCTION dbo.fn_ejercicio20(@universidad VARCHAR(30))
RETURNS @result TABLE (nombre VARCHAR(30), cantidad INT)
AS
	BEGIN
		IF (SELECT COUNT(*) FROM Universidades WHERE nomUniversidad = @universidad) = 0
			INSERT @result SELECT nomUniversidad, SUM(cantidadPlazas)
						   FROM Universidades
								INNER JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
						   GROUP BY nomUniversidad
		ELSE
			BEGIN
				DECLARE @cantidadUni INT

				-- Calculamos primero la cantidad que tiene la universidad indicada por par�metro
				SELECT @cantidadUni=SUM(cantidadPlazas)
				FROM residencias
				WHERE codUniversidad = (SELECT codUniversidad FROM Universidades WHERE nomUniversidad = @universidad)

				-- Guardamos los resultados en la tabla a generar de las universidades con menor cantidad a la dada
				INSERT @result SELECT nomUniversidad, SUM(cantidadPlazas)
							   FROM Universidades
									INNER JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
							   GROUP BY nomUniversidad
							   HAVING SUM(cantidadPlazas) < @cantidadUni
			END
		RETURN
	END
GO

SELECT * FROM dbo.fn_ejercicio20('Universidad falsa')
SELECT * FROM dbo.fn_ejercicio20('Universidad de La Laguna')
GO

-- 22. Hacer una funci�n escalar que pas�ndole el c�digo de la universidad nos devuelva la cantidad total de plazas que
-- tiene.

CREATE FUNCTION dbo.fn_ejercicio22(@universidad CHAR(6))
RETURNS INT
AS
	BEGIN
		RETURN (SELECT SUM(cantidadPlazas)
				FROM residencias
				WHERE codUniversidad = @universidad
				)
	END
GO

SELECT dbo.fn_ejercicio22('ull')
GO


-- 23. Haz una consulta en la que visualicemos los nombres de todas las universidades y la cantidad total de plazas que
-- tiene cada una, Utilizando la funci�n del ejercicio 22.

CREATE FUNCTION dbo.fn_ejercicio23()
RETURNS TABLE
AS
	RETURN (SELECT nomUniversidad [nombre], dbo.fn_ejercicio22(codUniversidad) [cantidad] FROM Universidades)
GO

SELECT * FROM dbo.fn_ejercicio23()
GO


-- 24. Repetir el ejercicio 21 utilizando la funci�n hecha en el ejercicio 22

ALTER FUNCTION dbo.fn_ejercicio20(@universidad VARCHAR(30))
RETURNS @result TABLE (nombre VARCHAR(30), cantidad INT)
AS
	BEGIN
		IF (SELECT COUNT(*) FROM Universidades WHERE nomUniversidad = @universidad) = 0
			INSERT @result SELECT nomUniversidad, dbo.fn_ejercicio22(codUniversidad)
						   FROM Universidades
		ELSE
			BEGIN
				DECLARE @cantidadUni INT

				-- Calculamos primero la cantidad que tiene la universidad indicada por par�metro
				SELECT @cantidadUni=dbo.fn_ejercicio22(codUniversidad)
				FROM Universidades
				WHERE nomUniversidad = @universidad

				-- Guardamos los resultados en la tabla a generar de las universidades con menor cantidad a la dada
				INSERT @result SELECT nomUniversidad, dbo.fn_ejercicio22(codUniversidad)
							   FROM Universidades
							   WHERE dbo.fn_ejercicio22(codUniversidad) < @cantidadUni
			END
		RETURN
	END
GO

SELECT * FROM dbo.fn_ejercicio20('Universidad falsa')
SELECT * FROM dbo.fn_ejercicio20('Universidad de La Laguna')
GO