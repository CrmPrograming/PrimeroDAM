-- ###################################

--		     FUNCIONES 3

-- ###################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 09/05/2020

USE BDResidenciasEscolares_prueba
GO

-- 14. Haz una funci�n que visualice todas las observaciones que tengan los estudiantes que han hecho su estancia en la habitaci�n pasada
-- por par�metro de la residencia tambi�n pasada por par�metro el c�digo de residencia. Hazlo de los 3 tipos de funci�n que se pueda hacer
-- y en caso que alguno no pueda explica por que no. 

-- Funci�n escalar
CREATE FUNCTION dbo.fn_mostrarObservaciones0(@habitacion TINYINT, @residencia INT)
RETURNS VARCHAR(40)
AS
	BEGIN
		RETURN (SELECT observaciones FROM estancias WHERE codResidencia = @residencia AND numhabitacion = @habitacion)
	END
GO

-- Funci�n con valores de tabla en l�nea
CREATE FUNCTION dbo.fn_mostrarObservaciones1(@habitacion TINYINT, @residencia INT)
RETURNS TABLE
AS
	RETURN (SELECT observaciones FROM estancias WHERE codResidencia = @residencia AND numhabitacion = @habitacion)
GO

-- Funci�n con valores de tabla en varias l�neas
CREATE FUNCTION dbo.fn_mostrarObservaciones2(@habitacion TINYINT, @residencia INT)
RETURNS @observaciones TABLE (obs TEXT)
AS
	BEGIN
		INSERT @observaciones SELECT observaciones FROM estancias WHERE codResidencia = @residencia AND numhabitacion = @habitacion
		RETURN
	END	
GO

SELECT dbo.fn_mostrarObservaciones0(9, 4)
SELECT * FROM dbo.fn_mostrarObservaciones1(9, 4)
SELECT * FROM dbo.fn_mostrarObservaciones2(9, 4)
GO


-- 15. Al ejercicio anterior a��dele las comprobaciones, si la residencia no existe visualizar �no existe residencia�,
-- si esa residencia existe pero no tiene ninguna estancia visualizar �residencia sin estancias�, y si esa residencia
-- tiene estancias pero no en la habitaci�n indicada visualizar �residencia sin estancia en habitaci�n indicada�.

-- Funci�n escalar
ALTER FUNCTION dbo.fn_mostrarObservaciones0(@habitacion TINYINT, @residencia INT)
RETURNS VARCHAR(40)
AS
	BEGIN
		DECLARE @obs VARCHAR(40)
		IF (SELECT COUNT(*) FROM residencias WHERE codResidencia = @residencia) = 0
			SET @obs='No existe residencia'
		ELSE IF (SELECT COUNT(*) FROM estancias WHERE codResidencia = @residencia) = 0
			SET @obs='Residencia sin estancias'
		ELSE IF (SELECT COUNT(*) FROM estancias WHERE codResidencia = @residencia AND numhabitacion = @habitacion) = 0
			SET @obs='Residencia sin estancia en la habitaci�n indicada'
		ELSE
			SELECT @obs=observaciones FROM estancias WHERE codResidencia = @residencia AND numhabitacion = @habitacion
		RETURN (@obs)
	END
GO

-- Funci�n con valores de tabla en l�nea
-- No es posible realizar las comprobaciones en este tipo de funciones sin utilizar una funci�n intermediaria

-- Funci�n con valores de tabla en varias l�neas
ALTER FUNCTION dbo.fn_mostrarObservaciones2(@habitacion TINYINT, @residencia INT)
RETURNS @observaciones TABLE (obs TEXT)
AS
	BEGIN
		IF (SELECT COUNT(*) FROM residencias WHERE codResidencia = @residencia) = 0
			INSERT @observaciones VALUES ('No existe residencia')
		ELSE IF (SELECT COUNT(*) FROM estancias WHERE codResidencia = @residencia) = 0
			INSERT @observaciones VALUES ('Residencia sin estancias')
		ELSE IF (SELECT COUNT(*) FROM estancias WHERE codResidencia = @residencia AND numhabitacion = @habitacion) = 0
			INSERT @observaciones VALUES ('Residencia sin estancia en la habitaci�n indicada')
		ELSE
			INSERT @observaciones SELECT observaciones FROM estancias WHERE codResidencia = @residencia AND numhabitacion = @habitacion
		RETURN
	END	
GO

SELECT dbo.fn_mostrarObservaciones0(9, 27)
SELECT dbo.fn_mostrarObservaciones0(9, 10)
SELECT dbo.fn_mostrarObservaciones0(9, 3)
SELECT dbo.fn_mostrarObservaciones0(9, 4)

SELECT * FROM dbo.fn_mostrarObservaciones2(9, 27)
SELECT * FROM dbo.fn_mostrarObservaciones2(9, 10)
SELECT * FROM dbo.fn_mostrarObservaciones2(9, 3)
SELECT * FROM dbo.fn_mostrarObservaciones2(9, 4)
GO


-- 16. Haz una funci�n que visualice el a�o de la fechainicio en el que la residencia pasada por par�metro su c�digo 
-- tenga m�s estancias en la habitaci�n tambi�n indicada por par�metro. Hazlo de los tres modos de funci�n.

-- Funci�n escalar
CREATE FUNCTION dbo.fn_mostrarFechaMasResidencias1(@residencia INT, @habitacion TINYINT)
RETURNS INT
AS
	BEGIN		
		RETURN (SELECT TOP 1 YEAR(fechaInicio)
				FROM estancias
				WHERE codResidencia = @residencia AND numhabitacion = @habitacion
				GROUP BY YEAR(fechaInicio)
				ORDER BY COUNT(*) DESC
			  )
	END
GO

-- Funci�n con valores de tabla en l�nea
CREATE FUNCTION dbo.fn_mostrarFechaMasResidencias2(@residencia INT, @habitacion TINYINT)
RETURNS TABLE
AS
	RETURN (SELECT TOP 1 YEAR(fechaInicio) [Fecha]
				FROM estancias
				WHERE codResidencia = @residencia AND numhabitacion = @habitacion
				GROUP BY YEAR(fechaInicio)
				ORDER BY COUNT(*) DESC
			  )	
GO

-- Funci�n con valores de tabla en varias l�neas
CREATE FUNCTION dbo.fn_mostrarFechaMasResidencias3(@residencia INT, @habitacion TINYINT)
RETURNS @fecha TABLE (fecha INT)
AS
	BEGIN
		INSERT @fecha SELECT TOP 1 YEAR(fechaInicio) [A�o]
				FROM estancias
				WHERE codResidencia = @residencia AND numhabitacion = @habitacion
				GROUP BY YEAR(fechaInicio)
				ORDER BY COUNT(*) DESC
		RETURN
	END	
GO

SELECT dbo.fn_mostrarFechaMasResidencias1(4, 9)
SELECT * FROM dbo.fn_mostrarFechaMasResidencias2(4, 9)
SELECT * FROM dbo.fn_mostrarFechaMasResidencias3(4, 9)
GO


-- 17. Haz una funci�n que pas�ndole por par�metro un a�o nos indique el estudiante que ha estado m�s d�as en
-- ese a�o en residencias, tener en cuenta que un estudiante en el mismo a�o puede haber pasado por varias residencias.
-- Podr�s usar datediff para ver los d�as que hay entre fecha inicio y fechafin. Hacerlo de diversas formas de funci�n.

-- Funci�n escalar
CREATE FUNCTION dbo.fn_estudianteMasDias1(@fecha INT)
RETURNS INT
AS
	BEGIN
		RETURN (SELECT TOP 1 codEstudiante
				FROM estancias
				WHERE YEAR(fechaInicio) = @fecha
				GROUP BY codEstudiante
				ORDER BY SUM(DATEDIFF(day, fechaInicio, fechaFin)) DESC
			   )
	END
GO

-- Funci�n con valores de tabla
CREATE FUNCTION dbo.fn_estudianteMasDias2(@fecha INT)
RETURNS TABLE
AS
	RETURN (SELECT TOP 1 codEstudiante
			FROM estancias
			WHERE YEAR(fechaInicio) = @fecha
			GROUP BY codEstudiante
			ORDER BY SUM(DATEDIFF(day, fechaInicio, fechaFin)) DESC
		   )	
GO

-- Funci�n con valores de tabla en varias l�neas
CREATE FUNCTION dbo.fn_estudianteMasDias3(@fecha INT)
RETURNS @resultados TABLE (estudiante INT)
AS
	BEGIN
		INSERT @resultados SELECT TOP 1 codEstudiante
						   FROM estancias
						   WHERE YEAR(fechaInicio) = @fecha
						   GROUP BY codEstudiante
						   ORDER BY SUM(DATEDIFF(day, fechaInicio, fechaFin)) DESC		
		RETURN
	END
GO

SELECT dbo.fn_estudianteMasDias1(2009)
SELECT * FROM dbo.fn_estudianteMasDias2(2009)
SELECT * FROM dbo.fn_estudianteMasDias3(2009)
GO


-- 18. Al ejercicio anterior a�adirle que si el a�o pasado por par�metro es posterior al a�o actual visualice
-- �a�o erroneo�.  Hazlo de todos los modos de funci�n que puedas.

-- Funci�n escalar
ALTER FUNCTION dbo.fn_estudianteMasDias1(@fecha INT)
RETURNS VARCHAR(15)
AS
	BEGIN
		DECLARE @result VARCHAR(15)

		IF (@fecha > YEAR(GETDATE()))
			SET @result = 'A�o erroneo'
		ELSE
			SELECT TOP 1 @result = CONVERT(VARCHAR(15), codEstudiante)
			FROM estancias
			WHERE YEAR(fechaInicio) = @fecha
			GROUP BY codEstudiante
			ORDER BY SUM(DATEDIFF(day, fechaInicio, fechaFin)) DESC
		RETURN @result
	END
GO

-- Funci�n con valores de tabla
-- No se puede realizar ya que en una �nica l�nea no podemos hacer la comprobaci�n de fecha

-- Funci�n con valores de tabla en varias l�neas
ALTER FUNCTION dbo.fn_estudianteMasDias3(@fecha INT)
RETURNS @resultados TABLE (estudiante VARCHAR(15))
AS
	BEGIN
		IF (@fecha > YEAR(GETDATE()))
			INSERT @resultados VALUES ('A�o erroneo')
		ELSE
			INSERT @resultados SELECT TOP 1 CONVERT(VARCHAR(15), codEstudiante)
						   FROM estancias
						   WHERE YEAR(fechaInicio) = @fecha
						   GROUP BY codEstudiante
						   ORDER BY SUM(DATEDIFF(day, fechaInicio, fechaFin)) DESC		
		RETURN
	END
GO

SELECT dbo.fn_estudianteMasDias1(2025)
SELECT dbo.fn_estudianteMasDias1(2009)
SELECT * FROM dbo.fn_estudianteMasDias3(2025)
SELECT * FROM dbo.fn_estudianteMasDias3(2009)
GO