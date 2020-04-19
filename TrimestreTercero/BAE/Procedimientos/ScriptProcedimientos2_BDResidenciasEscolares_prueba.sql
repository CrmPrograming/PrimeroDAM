-- ###################################

--		     PROCEDIMIENTOS 2

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 16/04/2020

USE BDResidenciasEscolares_prueba
GO

-- 5. Crear un procedimiento almacenado que indicándole una universidad (nombre) y precioMensual, devuelva en un parámetro
-- de salida la cantidad de residencias que hay en esa universidad y en otro parámetro de salida la cantidad de residencias
-- de esa universidad pero con un precioMensual inferioral indicado. Si el nombre de universidad introducido es null visualizar
-- el mensaje ‘ no se permite valor null’ y poner todos los valores de los parámetros de salida a -1, si esa universidad no
-- existe en la tabla de universidades visualizar ‘ no existe esa universidad’ y todos los parámetros de salida a-2

CREATE PROCEDURE dbo.buscarResidenciasUniversidad
@universidad VARCHAR(30), @precio INT,
@totalResidencias INT OUTPUT, @totalResidenciasPrecioInferior INT OUTPUT
AS
	IF (@universidad IS NULL)
		BEGIN
			PRINT 'no se permite valor null'
			SET @totalResidencias = -1
			SET @totalResidenciasPrecioInferior = -1
		END
	ELSE IF (SELECT (COUNT(*)) FROM Universidades WHERE nomUniversidad = @universidad) = 0
		BEGIN
			PRINT 'no existe esa universidad'
			SET @totalResidencias = -2
			SET @totalResidenciasPrecioInferior = -2
		END
	ELSE
		BEGIN

			/*
			Manera alternativa de hacer el ejercicio. De esta forma,
			preguntamos por el código de la universidad una sola vez

			DECLARE @codUni CHAR(6)

			SELECT @codUni = codUniversidad
			FROM Universidades
			WHERE nomUniversidad = @universidad

			SELECT @totalResidencias = COUNT(*)
			FROM residencias
			WHERE codUniversidad = @codUni

			SELECT @totalResidenciasPrecioInferior = COUNT(*)
			FROM residencias
			WHERE codUniversidad = @codUni AND precioMensual < @precio
			*/
			
			SELECT @totalResidencias = COUNT(*)
			FROM residencias
			WHERE codUniversidad = (SELECT codUniversidad FROM Universidades WHERE nomUniversidad = @universidad)

			SELECT @totalResidenciasPrecioInferior = COUNT(*)
			FROM residencias
			WHERE codUniversidad = (SELECT codUniversidad FROM Universidades WHERE nomUniversidad = @universidad)
				AND precioMensual < @precio			
		END
GO

DECLARE @totalR INT
DECLARE @totalRPrecioMenor INT

EXEC buscarResidenciasUniversidad NULL, 300, @totalR OUTPUT, @totalRPrecioMenor OUTPUT
SELECT @totalR [Total residencias], @totalRPrecioMenor [Total residencias con precio menor]

EXEC buscarResidenciasUniversidad 'Universidad falsa', 300, @totalR OUTPUT, @totalRPrecioMenor OUTPUT
SELECT @totalR [Total residencias], @totalRPrecioMenor [Total residencias con precio menor]

EXEC buscarResidenciasUniversidad 'Universidad de La Laguna', 300, @totalR OUTPUT, @totalRPrecioMenor OUTPUT
SELECT @totalR [Total residencias], @totalRPrecioMenor [Total residencias con precio menor]
GO


-- 6. Crear un procedimiento almacenado que actualice la fechafin de una determinada estancia, le pasaremos por parámetro
-- el código del estudiante, el código de la residencia, la fecha de inicio y la nueva fechafin. No se permitirá que la
-- fechafin sea anterioro iguala la fecha de inicio.  En un parámetro de salidamostrar 0 si todo es correcto y 1 si no se
-- ha podido realizar la actualización.

CREATE PROCEDURE dbo.actualizarFechaFin
@estudiante INT, @residencia INT, @inicio DATE, @fin DATE,
@resultado INT OUTPUT
AS
	IF (@fin <= (SELECT fechaInicio FROM estancias WHERE codEstudiante = @estudiante AND codResidencia = @residencia AND fechaInicio = @inicio))
		BEGIN
			SET @resultado = 1
		END
	ELSE
		BEGIN
			UPDATE estancias SET fechaFin = @fin WHERE codEstudiante = @estudiante AND codResidencia = @residencia AND fechaInicio = @inicio
			IF @@ERROR = 0
				SET @resultado = 0
		END
GO

DECLARE @result INT

EXEC actualizarFechaFin 3, 3, '2012-07-09', '2012-04-09', @result OUTPUT
SELECT @result [Resultado Operación]

EXEC actualizarFechaFin 3, 3, '2012-07-09', '2012-11-21', @result OUTPUT
SELECT @result [Resultado Operación]

GO


-- 7. Igual al anterior pero en lugar de pasarle el código del estudiante le pasamos su dni. Y usaremos otro parámetro de salida
-- en el cual indicaremos 1 si ese estudiante no existe y 0 si existe, otro parámetro de salida que muestre 1 si la residencia no existe y 0 si existe.

ALTER PROCEDURE dbo.actualizarFechaFin
@estudiante CHAR(9), @residencia INT, @inicio DATE, @fin DATE,
@resultado INT OUTPUT, @existeEstudiante INT OUTPUT, @existeResidencia INT OUTPUT
AS
	SET @existeEstudiante = 0
	SET @existeResidencia = 0
	SET @resultado = 0

	IF (SELECT COUNT(*) FROM estudiantes WHERE dni = @estudiante) = 0
		BEGIN
			SET @resultado = 1
			SET @existeEstudiante = 1
		END
	ELSE IF (SELECT COUNT(*) FROM estancias WHERE codResidencia = @residencia) = 0
		BEGIN
			SET @resultado = 1
			SET @existeResidencia = 1
		END
	ELSE IF (@fin <= (SELECT fechaInicio FROM estancias WHERE codEstudiante =
				(SELECT codEstudiante FROM estudiantes WHERE dni = @estudiante)
				AND codResidencia = @residencia AND fechaInicio = @inicio))
		BEGIN
			SET @resultado = 1
		END
	ELSE
		BEGIN
			UPDATE estancias SET fechaFin = @fin
			WHERE codEstudiante = (SELECT codEstudiante FROM estudiantes WHERE dni = @estudiante)
				AND codResidencia = @residencia AND fechaInicio = @inicio
			IF @@ERROR <> 0
				SET @resultado = 1
		END
GO

DECLARE @result INT
DECLARE @estudiante INT
DECLARE @residencia INT

EXEC actualizarFechaFin 'FALSO', 3, '2012-07-09', '2012-04-09', @result OUTPUT, @estudiante OUTPUT, @residencia OUTPUT
SELECT @result [Resultado Operación], @estudiante [Existe estudiante], @residencia [Existe residencia]

EXEC actualizarFechaFin '44444444W', -1, '2012-07-09', '2012-04-09', @result OUTPUT, @estudiante OUTPUT, @residencia OUTPUT
SELECT @result [Resultado Operación], @estudiante [Existe estudiante], @residencia [Existe residencia]

EXEC actualizarFechaFin '44444444W', 5, '2011-12-05', '2009-12-05', @result OUTPUT, @estudiante OUTPUT, @residencia OUTPUT
SELECT @result [Resultado Operación], @estudiante [Existe estudiante], @residencia [Existe residencia]

EXEC actualizarFechaFin '44444444W', 5, '2011-12-05', '2013-01-20', @result OUTPUT, @estudiante OUTPUT, @residencia OUTPUT
SELECT @result [Resultado Operación], @estudiante [Existe estudiante], @residencia [Existe residencia]

GO