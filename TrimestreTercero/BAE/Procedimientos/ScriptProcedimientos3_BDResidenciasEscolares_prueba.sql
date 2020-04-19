-- ###################################

--		     PROCEDIMIENTOS 3

-- ###################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 19/04/2020

USE BDResidenciasEscolares_prueba
GO

-- 8. Hacer un procedimiento almacenado que visualice todas las universidades, los nombres,
-- que tengan m�s residencias que un valor que introduciremos por par�metro.
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

-- 9. Hacer un procedimiento que devuelva en un par�metro de salida la universidad que tiene m�s
-- residencias teniendo en cuenta el comedor y genero que les pasaremos por par�metro. Le introduciremos
-- por par�metro el comedor (1 o 0 si tiene o no comedor) y el g�nero. Tambi�n visualizaremos en otro par�metro
-- la cantidad de universidades que tienen ese valor m�ximo de residencias (me refiero que si pusiese with ties cu�ntas me aparecer�an).

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


-- 10. Al ejercicio anterior le vamos a a�adir que si genero es null tomaremos para cualquier g�nero.
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