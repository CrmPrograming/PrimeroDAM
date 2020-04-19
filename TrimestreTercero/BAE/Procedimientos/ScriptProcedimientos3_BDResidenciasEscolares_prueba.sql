-- ###################################

--		     PROCEDIMIENTOS 3

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 19/04/2020

USE BDResidenciasEscolares_prueba
GO

-- 8. Hacer un procedimiento almacenado que visualice todas las universidades, los nombres,
-- que tengan más residencias que un valor que introduciremos por parámetro.
CREATE PROCEDURE dbo.mostrarUniMasResidencias
@limiteResidencias INT
AS
	SELECT nomUniversidad
	FROM Universidades
	WHERE codUniversidad IN (
								SELECT codUniversidad
								FROM residencias
								GROUP BY codUniversidad
								HAVING COUNT(codResidencia) > @limiteResidencias
							)
GO

EXEC mostrarUniMasResidencias 1
GO

-- 9. Hacer un procedimiento que devuelva en un parámetro de salida la universidad que tiene más
-- residencias teniendo en cuenta el comedor y genero que les pasaremos por parámetro. Le introduciremos
-- por parámetro el comedor (1 o 0 si tiene o no comedor) y el género. También visualizaremos en otro parámetro
-- la cantidad de universidades que tienen ese valor máximo de residencias (me refiero que si pusiese with ties cuántas me aparecerían).

CREATE PROCEDURE dbo.universidadConMasResidencias
@comedor BIT, @genero CHAR(9),
@universidad VARCHAR(30) OUTPUT, @cantidadUniversidades INT OUTPUT
AS
	SELECT TOP 1 WITH TIES @universidad=nomUniversidad
	FROM Universidades
		INNER JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
	WHERE comedor = @comedor AND genero = @genero
	GROUP BY nomUniversidad
	ORDER BY COUNT(codResidencia) DESC
	
	SET @cantidadUniversidades = @@ROWCOUNT
GO

DECLARE @nomUni VARCHAR(30)
DECLARE @total INT
EXEC universidadConMasResidencias 1, 'mixto', @nomUni OUTPUT, @total OUTPUT
SELECT @nomUni [Universidad], @total [Total con misma cantidad de residencias]
GO


-- 10. Al ejercicio anterior le vamos a añadir que si genero es null tomaremos para cualquier género.
ALTER PROCEDURE dbo.universidadConMasResidencias
@comedor BIT, @genero CHAR(9) = NULL,
@universidad VARCHAR(30) OUTPUT, @cantidadUniversidades INT OUTPUT
AS
	IF @genero IS NULL
		BEGIN
			SELECT TOP 1 WITH TIES @universidad=nomUniversidad
			FROM Universidades
				INNER JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
			WHERE comedor = @comedor
			GROUP BY nomUniversidad
			ORDER BY COUNT(codResidencia) DESC
		END
	ELSE
		BEGIN
			SELECT TOP 1 WITH TIES @universidad=nomUniversidad
			FROM Universidades
				INNER JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
			WHERE comedor = @comedor AND genero = @genero
			GROUP BY nomUniversidad
			ORDER BY COUNT(codResidencia) DESC
		END	
	SET @cantidadUniversidades = @@ROWCOUNT
GO

DECLARE @nomUni VARCHAR(30)
DECLARE @total INT

EXEC universidadConMasResidencias 1, 'mixto', @nomUni OUTPUT, @total OUTPUT
SELECT @nomUni [Universidad], @total [Total con misma cantidad de residencias]

EXEC universidadConMasResidencias 1, NULL, @nomUni OUTPUT, @total OUTPUT
SELECT @nomUni [Universidad], @total [Total con misma cantidad de residencias]
GO