-- ###################################

--		     PROCEDIMIENTOS 1

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 14/04/2020

USE BDResidenciasEscolares_prueba
GO

-- 1. Crear un procedimiento almacenado que liste todos las estancias de cierto alumno pasando por parámetro de entrada
-- el dni del alumno ordenado por fecha de inicio.
-- Los datos a visualizar serán: Nombre de residencia, nombre de universidad, fecha de inicio, fecha de fin y precio de la estancia

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


-- 2. Crear un procedimiento almacenado que pasándole en parámetros de entrada un nombre de universidad
-- y un género nos devuelva en un parámetro de salida cuantas residencias hay de esa universidad y para ese género.
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


-- 3. Al ejercicio anterior añadirle que si alguno de los parámetros es null que visualice un mensaje y en ese parámetro
-- de salida visualice el valor -1 y no haga la consulta correspondiente.
ALTER PROCEDURE dbo.totalResidenciasUniversidadGenero
@universidad VARCHAR(30), @genero CHAR(9),
@total INT OUTPUT
AS
	IF (@universidad IS NULL OR @genero IS NULL)
		BEGIN
			PRINT '> Parámetros de entrada no válidos (uno o más es nulo)'
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


-- 4. Al ejercicio anterior añadirle que si la universidad no existe en la tabla de universidades en ese parámetro de
-- salida visualizar -2 y no haga la consulta correspondiente.
ALTER PROCEDURE dbo.totalResidenciasUniversidadGenero
@universidad VARCHAR(30), @genero CHAR(9),
@total INT OUTPUT
AS
	IF (@universidad IS NULL OR @genero IS NULL)
		BEGIN
			PRINT '> Parámetros de entrada no válidos (uno o más es nulo)'
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