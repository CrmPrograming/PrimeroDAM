-- ###################################

--		     PROCEDIMIENTOS 1

-- ###################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 14/04/2020

USE BDResidenciasEscolares_prueba
GO

-- 1. Crear un procedimiento almacenado que liste todos las estancias de cierto alumno pasando por par�metro de entrada
-- el dni del alumno ordenado por fecha de inicio.
-- Los datos a visualizar ser�n: Nombre de residencia, nombre de universidad, fecha de inicio, fecha de fin y precio de la estancia

CREATE PROCEDURE dbo.listarEstanciasAlumno
@alumno CHAR(9)
AS
	SELECT nomUniversidad, nomResidencia, fechaInicio, fechaFin, preciopagado
	FROM Universidades AS U
		INNER JOIN residencias AS R ON U.codUniversidad = R.codUniversidad
		INNER JOIN estancias AS E ON R.codResidencia = E.codResidencia
	WHERE E.codEstudiante = (
							 SELECT codEstudiante
							 FROM estudiantes
							 WHERE dni = @alumno
							)
	ORDER BY E.fechaInicio
GO

EXEC listarEstanciasAlumno '11111111P'
GO


-- 2. Crear un procedimiento almacenado que pas�ndole en par�metros de entrada un nombre de universidad
-- y un g�nero nos devuelva en un par�metro de salida cuantas residencias hay de esa universidad y para ese g�nero.
CREATE PROCEDURE dbo.totalResidenciasUniversidadGenero
@universidad VARCHAR(30), @genero CHAR(9),
@total INT OUTPUT
AS
	SELECT @total = COUNT(codResidencia)
	FROM residencias
	WHERE genero = @genero AND codUniversidad = (SELECT codUniversidad FROM Universidades WHERE nomUniversidad = @universidad)
GO

DECLARE @cantidad INT
EXEC totalResidenciasUniversidadGenero 'Universidad de Lorenzo', 'masculino', @cantidad OUTPUT
SELECT @cantidad AS [Total]
GO


-- 3. Al ejercicio anterior a�adirle que si alguno de los par�metros es null que visualice un mensaje y en ese par�metro
-- de salida visualice el valor -1 y no haga la consulta correspondiente.
ALTER PROCEDURE dbo.totalResidenciasUniversidadGenero
@universidad VARCHAR(30), @genero CHAR(9),
@total INT OUTPUT
AS
	IF (@universidad IS NULL OR @genero IS NULL)
		BEGIN
			PRINT '> Par�metros de entrada no v�lidos (uno o m�s es nulo)'
			SET @total = -1
		END
	ELSE
		BEGIN
			SELECT @total = COUNT(codResidencia)
			FROM residencias
			WHERE genero = @genero AND codUniversidad = (SELECT codUniversidad FROM Universidades WHERE nomUniversidad = @universidad)
		END
GO

DECLARE @cantidad INT
EXEC totalResidenciasUniversidadGenero 'Universidad de Lorenzo', 'masculino', @cantidad OUTPUT
SELECT @cantidad AS [Total]

EXEC totalResidenciasUniversidadGenero 'Universidad de Lorenzo', NULL, @cantidad OUTPUT
SELECT @cantidad AS [Total]

EXEC totalResidenciasUniversidadGenero NULL, 'masculino', @cantidad OUTPUT
SELECT @cantidad AS [Total]

EXEC totalResidenciasUniversidadGenero NULL, NULL, @cantidad OUTPUT
SELECT @cantidad AS [Total]
GO


-- 4. Al ejercicio anterior a�adirle que si la universidad no existe en la tabla de universidades en ese par�metro de
-- salida visualizar -2 y no haga la consulta correspondiente.
ALTER PROCEDURE dbo.totalResidenciasUniversidadGenero
@universidad VARCHAR(30), @genero CHAR(9),
@total INT OUTPUT
AS
	IF (@universidad IS NULL OR @genero IS NULL)
		BEGIN
			PRINT '> Par�metros de entrada no v�lidos (uno o m�s es nulo)'
			SET @total = -1
		END
	ELSE IF (SELECT COUNT(*) FROM Universidades WHERE nomUniversidad = @universidad) = 0
		BEGIN
			PRINT '> Universidad no existente en la BD'
			SET @total = -2
		END
	ELSE
		BEGIN
			SELECT @total = COUNT(codResidencia)
			FROM residencias
			WHERE genero = @genero AND codUniversidad = (SELECT codUniversidad FROM Universidades WHERE nomUniversidad = @universidad)
		END
GO

DECLARE @cantidad INT
EXEC totalResidenciasUniversidadGenero 'Universidad de Lorenzo', 'masculino', @cantidad OUTPUT
SELECT @cantidad AS [Total]

EXEC totalResidenciasUniversidadGenero 'Universidad de Lorenzo', NULL, @cantidad OUTPUT
SELECT @cantidad AS [Total]

EXEC totalResidenciasUniversidadGenero NULL, 'masculino', @cantidad OUTPUT
SELECT @cantidad AS [Total]

EXEC totalResidenciasUniversidadGenero NULL, NULL, @cantidad OUTPUT
SELECT @cantidad AS [Total]

EXEC totalResidenciasUniversidadGenero 'Universidad Falsa de Mentira', 'masculino', @cantidad OUTPUT
SELECT @cantidad AS [Total]
GO