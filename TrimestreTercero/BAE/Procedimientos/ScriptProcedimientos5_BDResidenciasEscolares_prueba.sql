-- ###################################

--		     PROCEDIMIENTOS 5

-- ###################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 25/04/2020

USE BDResidenciasEscolares_prueba
GO

-- 14. Haz un procedimiento almacenado que inserte una estancia, pasaremos todos los datos por par�metro de entrada,
-- tambi�n todos los datos del estudiante. Si el estudiante no existe en la tabla de estudiantes tambi�n lo insertaremos
-- en la tabla correspondiente. En un par�metro de salida visualizaremos 0 si todo ok y 1 si no se ha realizado la inserci�n
-- en estancias. En otro par�metro de salida 0 si existe el estudiante, 1 si no existe el estudiante y se ha insertado el mismo
-- sin problema, 2 si no existe el estudiante y no se ha podido insertar.

CREATE PROCEDURE dbo.crearEstancia
@codEstudiante INT, @codResidencia INT, @inicio DATE, @fin DATE, @precio INT, @observaciones TEXT, @habitacion TINYINT,
@nomEstudiante VARCHAR(50), @dni CHAR(9), @tlf CHAR(9), @email VARCHAR(30), @sexo CHAR(1),
@estadoEstancias INT OUTPUT, @estadoEstudiante INT OUTPUT
AS
	-- Inicialmente asumimos que el estudiante existe
	SET @estadoEstudiante = 0
	IF (SELECT COUNT(*) FROM estudiantes WHERE codEstudiante = @codEstudiante AND nomEstudiante = @nomEstudiante
												AND dni = @dni AND telefonoEstudiante = @tlf
												AND email = @email AND sexo = @sexo) = 0
		BEGIN
			-- El estudiante no existe, intentamos crearlo
			INSERT estudiantes VALUES (@codEstudiante, @nomEstudiante, @dni, @tlf, @email, @sexo)
			IF @@ERROR <> 0
				BEGIN
					-- Dado que no se pudo crear el estudiante, tampoco se podr�a la estancia
					-- Por tanto marcamos @estadoEstancias a 1 para indicar que no se pudo crear la estancia
					SET @estadoEstudiante = 2
					SET @estadoEstancias = 1
				END
			ELSE
				SET @estadoEstudiante = 1
		END

	IF (@estadoEstudiante <> 2)
		BEGIN
			-- Intentamos insertar en estancias
			INSERT estancias VALUES (@codEstudiante, @codResidencia, @inicio, @fin, @precio, @observaciones, @habitacion)

			IF @@ERROR <> 0
				-- No se pudo crear la estancia
				SET @estadoEstancias = 1
			ELSE
				SET @estadoEstancias = 0				

		END
GO

DECLARE @estadoEstudiante INT
DECLARE @estadoEstancia INT

-- Fallo al intentar crear el estudiante
EXEC crearEstancia 777, 3, '2010-09-08', '2027-09-08', 100, NULL, NULL, 'Estudiante Falso', '123', '777777777', 'email_falso@mail.com', 'F', @estadoEstancia OUTPUT, @estadoEstudiante OUTPUT
SELECT @estadoEstancia AS [Estancia], @estadoEstudiante AS [Estudiante]

-- Creado el estudiante, pero fallo en la estancia
EXEC crearEstancia 777, 223, '2010-09-08', '2027-09-08', 100, NULL, NULL, 'Estudiante Falso', '1234567-Q', '777777777', 'email_falso@mail.com', 'F', @estadoEstancia OUTPUT, @estadoEstudiante OUTPUT
SELECT @estadoEstancia AS [Estancia], @estadoEstudiante AS [Estudiante]

-- Estudiante existente, estancia creada sin problemas
EXEC crearEstancia 777, 3, '2010-09-08', '2027-09-08', 100, NULL, NULL, 'Estudiante Falso', '1234567-Q', '777777777', 'email_falso@mail.com', 'F', @estadoEstancia OUTPUT, @estadoEstudiante OUTPUT
SELECT @estadoEstancia AS [Estancia], @estadoEstudiante AS [Estudiante]
GO


-- 15. Haz un procedimiento almacenado que visualice el director que en el a�o que pasamos por par�metro ha tenido m�s
-- estancias de estudiantes diferentes. Queremos visualizar el nombre del director y el nombre dela residencia en la cual
-- ha tenido m�s estancias de estudiante diferentes en el a�o indicado. Si el a�o pasado por par�metro es mayor al a�o 
-- actual visualizar a�o incorrecto y en un par�metro de salida el valor -1 y si no el valor 0.

CREATE PROCEDURE dbo.consultarDirector
@fecha INT,
@estado INT OUTPUT
AS
	IF (@fecha > YEAR(GETDATE()))
		BEGIN
			SET @estado = -1
			PRINT 'A�o incorrecto'
		END
	ELSE
		BEGIN
			SET @estado = 0
			SELECT nomResidencia [Residencia], nombreDirector [Director]
			FROM residencias
			WHERE codResidencia = (
									SELECT TOP 1 codResidencia
									FROM estancias
									WHERE @fecha BETWEEN YEAR(fechaInicio) AND YEAR(GETDATE())
									GROUP BY codResidencia
									ORDER BY COUNT(DISTINCT codEstudiante) DESC
								  )
		END
GO

DECLARE @estado INT
DECLARE @fecha INT

-- NOTA: Inicializamos @fecha a un valor escogido al azar de tal manera que siempre sea el a�o actual + 10
-- Esto se hace para que la prueba en la cual la fecha dada sea inferior al a�o actual, siempre d� error
-- independiente de cu�ndo se ejecute
SET @fecha = YEAR(GETDATE()) + 10

-- Prueba para a�o superior al actual
EXEC consultarDirector @fecha, @estado OUTPUT
SELECT @estado [Estado]

EXEC consultarDirector 2017, @estado OUTPUT
SELECT @estado [Estado]

GO


-- 16. Haz un procedimiento que nos devuelva en un par�metro de salida el a�o en el cual la universidad
-- (el nombre) que pasamos por par�metro de entrada ha recaudado en total m�s dinero. El dinero recaudado en cada
-- estancia lo obtendremos multiplicando el precio pagado por la cantidad de meses de esa estancia. En otro par�metro
-- de salida devolveremos 0 si la universidad existe, 1 si no existe y 2 si le hemos pasado el valor null.

-- Nota: Entendemos que el precio pagado se calcula para fechaFin; Una vez terminada la estancia, es cuando
-- se contabilizan todos los meses por el preciopagado.

CREATE PROCEDURE dbo.consultarFechaMejorRecaudacion
@universidad VARCHAR(30),
@result INT OUTPUT, @estado INT OUTPUT
AS
	IF (@universidad IS NULL)
		SET @estado = 2
	ELSE IF (SELECT COUNT(*) FROM Universidades WHERE nomUniversidad = @universidad) = 0
		SET @estado = 1
	ELSE
		BEGIN
			SET @estado = 0
			SELECT TOP 1 @result = YEAR(fechaInicio)
			FROM estancias
			WHERE codResidencia IN (
									SELECT codResidencia
									FROM residencias
										INNER JOIN Universidades ON residencias.codUniversidad = Universidades.codUniversidad
									WHERE nomUniversidad = @universidad
								   )
			GROUP BY YEAR(fechaInicio), preciopagado
			ORDER BY SUM(precioPagado * DATEDIFF(month, fechaInicio, fechaFin)) DESC
		END
GO

DECLARE @fecha INT
DECLARE @estado INT

-- Prueba con nombre de universidad NULL
EXEC consultarFechaMejorRecaudacion NULL, @fecha OUTPUT, @estado OUTPUT
SELECT @fecha [Fecha], @estado [Estado]

-- Prueba con universidad no existente
EXEC consultarFechaMejorRecaudacion 'Universidad Falsa', @fecha OUTPUT, @estado OUTPUT
SELECT @fecha [Fecha], @estado [Estado]

-- Prueba con universidad existente
EXEC consultarFechaMejorRecaudacion 'La Laguna', @fecha OUTPUT, @estado OUTPUT
SELECT @fecha [Fecha], @estado [Estado]
GO