-- ###################################

--		     PROCEDIMIENTOS 4

-- ###################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 21/04/2020

USE BDResidenciasEscolares_prueba
GO

-- 11. Crear un procedimiento almacenado que inserte una residenciaEscolar, de modo que se le pase como par�metros todos los datos. 
-- Comprobar que el codigo de universidad pasado exista en la tabla universidades. En caso de que no exista la universidad que no inserte. 
-- Devolver en un par�metro de salida: 0 si la universidad no existe y 1 si la universidad existe.
-- Devolver en otro par�metro de salida  0 si la residencia no se insert� y 1 si la inserci�n fue correcta.
-- Puedes utilizar el par�metro @@error

CREATE PROCEDURE dbo.nuevaResidencia
@nombre VARCHAR(30), @universidad CHAR(6), @precio INT, @comedor BIT, @plazas INT, @director VARCHAR(40), @genero CHAR(9),
@uniExiste INT OUTPUT, @resiInsert INT OUTPUT
AS
	IF (SELECT COUNT(*) FROM Universidades WHERE codUniversidad = @universidad) = 0
		BEGIN
			SET @uniExiste = 0
			SET @resiInsert = 0
			PRINT 'Insert no realizado, la universidad no existe'
		END
	ELSE
		BEGIN
			SET @uniExiste = 1
			INSERT residencias VALUES(@nombre, @universidad, @precio, @comedor, @plazas, @director, @genero)
			IF @@ERROR <> 0
				BEGIN
					SET @resiInsert = 0
					PRINT 'Insert no realizado, se produjo un error'
				END
			ELSE
				BEGIN
					SET @resiInsert = 1
					PRINT 'Insert realizado con �xito'
				END
		END
GO

-- Intentamos crear una residencia con universidad falsa
SELECT * FROM residencias

DECLARE @uExiste INT
DECLARE @iRealizado INT

EXEC nuevaResidencia 'NombreResi', 'ufal', 777, 1, 77, 'director', 'mixto', @uExiste OUTPUT, @iRealizado OUTPUT
SELECT @uExiste [Existe Uni], @iRealizado [Insert realizado]
GO

-- Intentamos crear la residencia con datos no v�lidos
SELECT * FROM residencias

DECLARE @uExiste INT
DECLARE @iRealizado INT

EXEC nuevaResidencia 'NombreResi', 'ull', 777, 1, 77, 'director', 'ninguno', @uExiste OUTPUT, @iRealizado OUTPUT
SELECT @uExiste [Existe Uni], @iRealizado [Insert realizado]
GO

-- Insert realizado con �xito
SELECT * FROM residencias

DECLARE @uExiste INT
DECLARE @iRealizado INT

EXEC nuevaResidencia 'NombreResi', 'ull', 777, 1, 77, 'director', 'mixto', @uExiste OUTPUT, @iRealizado OUTPUT
SELECT @uExiste [Existe Uni], @iRealizado [Insert realizado]
SELECT * FROM residencias
GO


-- 12. Hacer un procedimiento almacenado que visualice los nombres de los estudiantes y las fechas en las que han
-- estado en una determinada habitaci�n de una determinada residencia. Se pasar� como par�metro de entrada el c�digo
-- de la residencia y el n�mero de la habitaci�n. Tambi�n queremos en un par�metro de salida la cantidad de estudiantes
-- diferentes que han estado en esa residencia y habitaci�n. En otro par�metro de salida mostraremos -1 si no existe la
-- residencia, -2 si no hay alguna estancia en esa residencia y esa habitaci�n y -3 si existe alguna estancia en esa residencia y habitaci�n.

CREATE PROCEDURE dbo.estudiantesResidencia
@residencia INT, @habita TINYINT,
@total INT OUTPUT, @estado INT OUTPUT
AS
	SET @total = 0
	IF (SELECT COUNT(*) FROM residencias WHERE codResidencia = @residencia) = 0
		BEGIN
			SET @estado = -1
		END
	ELSE IF (SELECT COUNT(*) FROM estancias WHERE codResidencia = @residencia AND numhabitacion = @habita) = 0
		BEGIN
			SET @estado = -2
		END
	ELSE
		BEGIN
			SET @estado = -3
			SELECT nomEstudiante, fechaInicio, fechaFin
			FROM estudiantes
				INNER JOIN estancias ON estudiantes.codEstudiante = estancias.codEstudiante
			WHERE numhabitacion = @habita AND codResidencia = @residencia

			SELECT @total = COUNT(DISTINCT codEstudiante)
			FROM estancias
			WHERE numhabitacion = @habita AND codResidencia = @residencia
		END	
GO

DECLARE @total INT
DECLARE @estado INT

-- Probamos con una residencia que no existe
EXEC estudiantesResidencia 20, 8, @total OUTPUT, @estado OUTPUT
SELECT @total [Cantidad de estudiantes], @estado [Estado]

-- Ahora probamos con una que existe, pero no tiene estancias
EXEC estudiantesResidencia 10, 8, @total OUTPUT, @estado OUTPUT
SELECT @total [Cantidad de estudiantes], @estado [Estado]

-- Finalmente, ejecuci�n v�lida
EXEC estudiantesResidencia 3, 8, @total OUTPUT, @estado OUTPUT
SELECT @total [Cantidad de estudiantes], @estado [Estado]
GO


-- 13. Hacer un procedimiento almacenado que visualice todas las universidades que tengan m�s
-- residencias que la universidad que hemos pasado por par�metro su c�digo. En un par�metro de salida
-- mostraremos -1 si no existe esa universidad y -2 si existe. En otro par�metro de salida la cantidad
-- de universidades visualizadas.

CREATE PROCEDURE dbo.universidadesMasQueOtra
@universidad CHAR(6),
@estado INT OUTPUT, @total INT OUTPUT
AS
	IF (SELECT COUNT(*) FROM Universidades WHERE codUniversidad = @universidad) = 0
		BEGIN
			SET @total = 0
			SET @estado = -1
		END
	ELSE
		BEGIN
			SET @estado = -2

			SELECT nomUniversidad
			FROM Universidades
				INNER JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
			GROUP BY nomUniversidad
			HAVING COUNT(codResidencia) > (
								SELECT COUNT(codResidencia)
								FROM residencias
								WHERE codUniversidad = @universidad
							  )
			SET @total = @@ROWCOUNT
		END
GO

DECLARE @total INT
DECLARE @estado INT

-- Universidad no existente
EXEC universidadesMasQueOtra 'unfal', @estado OUTPUT, @total OUTPUT
SELECT @estado [Estado], @total [Total]

-- Universidad existente
EXEC universidadesMasQueOtra 'UGrana', @estado OUTPUT, @total OUTPUT
SELECT @estado [Estado], @total [Total]
GO