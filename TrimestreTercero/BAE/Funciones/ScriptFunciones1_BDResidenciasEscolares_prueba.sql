-- ###################################

--		     FUNCIONES 1

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 30/04/2020

USE BDResidenciasEscolares_prueba
GO

-- 1. Crea una función escalar que visualice cuantas residencias hay con comedor

CREATE FUNCTION dbo.fn_mostrarResidenciasComedor()
RETURNS INT
AS
BEGIN
	RETURN (SELECT COUNT(*) FROM residencias WHERE comedor = 1)
END

GO

SELECT dbo.fn_mostrarResidenciasComedor()

GO


-- 2. Crea una función escalar que visualice cuantas residencias hay con comedor y genero introducido por parámetro de entrada.

CREATE FUNCTION dbo.fn_mostrarResidenciasComedorGenero(@genero CHAR(9))
RETURNS INT
AS
BEGIN
	RETURN (SELECT COUNT(*) FROM residencias WHERE comedor = 1 AND genero = @genero)
END

GO

SELECT dbo.fn_mostrarResidenciasComedorGenero('mixto')
GO


-- 3. Visualiza los nombres y directores de las residencias con comedor y genero introducido por parámetro.

CREATE FUNCTION dbo.fn_mostrarResidenciasDirectores(@genero CHAR(9))
RETURNS TABLE
AS
	RETURN (SELECT nomResidencia, nombreDirector FROM residencias WHERE comedor = 1 AND genero = @genero)
GO

SELECT * FROM dbo.fn_mostrarResidenciasDirectores('femenino')
GO


-- 4. Visualiza los nombres y directores de las residencias con comedor y genero introducido por parámetro,
-- pero si el valor del género introducido por parámetro no es ni mixto, ni masculino ni femenino que las
-- visualice todas las residencias con comedor.

CREATE FUNCTION dbo.fn_obtenerResidenciasDirectores(@genero CHAR(9))
RETURNS @fn_residencias TABLE (residencia VARCHAR(30) NOT NULL, director VARCHAR(40))
AS
	BEGIN
		IF (@genero NOT IN ('mixto', 'masculino', 'femenino'))
			INSERT @fn_residencias SELECT nomResidencia, nombreDirector FROM residencias WHERE comedor = 1
		ELSE
			INSERT @fn_residencias SELECT nomResidencia, nombreDirector FROM residencias WHERE comedor = 1 AND genero = @genero
		RETURN
	END	
	
GO

SELECT * FROM dbo.fn_obtenerResidenciasDirectores('mixto')
SELECT * FROM dbo.fn_obtenerResidenciasDirectores('nada')

GO


-- 5. Al ejercicio anterior añadirle que si el valor del parámetro de entrada es null deberá visualizar no se permite null en cada uno de los campos a visualizar.

ALTER FUNCTION dbo.fn_obtenerResidenciasDirectores(@genero CHAR(9))
RETURNS @fn_residencias TABLE (residencia VARCHAR(30) NOT NULL, director VARCHAR(40))
AS
	BEGIN
		IF (@genero IS NULL)
			INSERT @fn_residencias VALUES ('no se permite null', 'no se permite null')
		ELSE IF (@genero NOT IN ('mixto', 'masculino', 'femenino'))
			INSERT @fn_residencias SELECT nomResidencia, nombreDirector FROM residencias WHERE comedor = 1
		ELSE
			INSERT @fn_residencias SELECT nomResidencia, nombreDirector FROM residencias WHERE comedor = 1 AND genero = @genero
		RETURN
	END	
	
GO

SELECT * FROM dbo.fn_obtenerResidenciasDirectores(NULL)
SELECT * FROM dbo.fn_obtenerResidenciasDirectores('mixto')
SELECT * FROM dbo.fn_obtenerResidenciasDirectores('nada')

GO


-- 6. Realiza una función escalar que cuente cuantas residencias hay en función de la universidad que le pasemos por parámetro de entrada.
-- Le pasaremos el nombre de la universidad.

CREATE FUNCTION dbo.fn_totalResidenciasEnUniversidad(@universidad VARCHAR(30))
RETURNS INT
AS
	BEGIN
		RETURN (SELECT COUNT(*) FROM residencias WHERE codUniversidad = (
																		 SELECT codUniversidad FROM Universidades
																		 WHERE nomUniversidad = @universidad
																		))
	END
GO

SELECT dbo.fn_totalResidenciasEnUniversidad('La Laguna')
GO


-- 7. Realiza una consulta utilizando la función creada en el ejercicio anterior que visualice los nombresde las universidades y la cantidad de residencias que tiene cada universidad.

SELECT nomUniversidad, dbo.fn_totalResidenciasEnUniversidad(nomUniversidad) [Cantidad Residencias] FROM Universidades
GO


-- 8. Realiza el ejercicio 6 con una función que no sea escalar.

CREATE FUNCTION dbo.fn_totalResidenciasEnUniversidad_bis(@universidad VARCHAR(30))
RETURNS @fn_cantidad TABLE (total INT)
AS
	BEGIN
		INSERT @fn_cantidad SELECT COUNT(*) FROM residencias WHERE codUniversidad = (
																					 SELECT codUniversidad FROM Universidades
																					 WHERE nomUniversidad = @universidad
																					)
		RETURN
	END
GO

SELECT * FROM dbo.fn_totalResidenciasEnUniversidad_bis('La Laguna')
GO