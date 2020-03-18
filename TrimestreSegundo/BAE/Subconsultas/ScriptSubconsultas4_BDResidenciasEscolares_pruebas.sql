-- ###################################

--		     SUBCONSULTAS 4

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 18/03/2020

USE BDResidenciasEscolares_prueba
GO

-- 1. Visualiza todos los nombres de las universidades y la cantidad de residencias que tiene cada una, incluyendo aquellas universidades que no tengan residencias.
SELECT T.nomUniversidad, COUNT(T.codResidencia) AS [Cantidad de residencias]
FROM (
	 SELECT nomUniversidad, codResidencia FROM Universidades
		LEFT JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
	 ) AS T
GROUP BY T.nomUniversidad
GO

SELECT nomUniversidad, (SELECT COUNT(codResidencia) FROM residencias WHERE residencias.codUniversidad = Universidades.codUniversidad)
FROM Universidades
GO

-- 2. Visualiza las universidades que no tengan ninguna residencia.
SELECT nomUniversidad FROM Universidades
WHERE codUniversidad NOT IN (SELECT codUniversidad FROM residencias)
GO

-- 3. Visualiza el nombre de la universidad con más residencias escolares.
SELECT TOP 1 T.nomUniversidad, COUNT(T.codResidencia) AS [Cantidad de residencias]
FROM (
	 SELECT nomUniversidad, codResidencia FROM Universidades
		LEFT JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
	 ) AS T
GROUP BY T.nomUniversidad
ORDER BY [Cantidad de residencias] DESC
GO

SELECT TOP 1 nomUniversidad, (SELECT COUNT(codResidencia) FROM residencias WHERE residencias.codUniversidad = Universidades.codUniversidad) AS [Cantidad Residencias]
FROM Universidades
ORDER BY [Cantidad Residencias] DESC
GO

-- 4. Cual o cuales con los nombres de las universidades que tienen más residencias que la universidad con nombre X
SELECT TOP 1 WITH TIES nomUniversidad, COUNT(codResidencia) AS [Cantidad]
FROM residencias INNER JOIN Universidades ON residencias.codUniversidad = Universidades.codUniversidad
GROUP BY nomUniversidad
HAVING COUNT(codResidencia) > (
							  SELECT COUNT(codResidencia) FROM residencias
							  WHERE codUniversidad = (SELECT codUniversidad FROM Universidades WHERE nomUniversidad = 'La Laguna')
							  GROUP BY codUniversidad
							 )
ORDER BY COUNT(codResidencia) DESC
GO

-- 5. Visualiza los nombres de las universidades que tengan alguna residencia con comedor
SELECT nomUniversidad FROM Universidades
WHERE codUniversidad IN (
						 SELECT codUniversidad FROM residencias
						 WHERE comedor = 1
						)
GO

-- 6. Visualiza los nombres de las universidades que no tengan ninguna residencia con comedor
SELECT nomUniversidad FROM Universidades
WHERE codUniversidad NOT IN (
						 SELECT codUniversidad FROM residencias
						 WHERE comedor = 1
						)
GO

-- 7. Visualiza los nombres de las universidades que tengan más residencias con comedor de género masculino y con precio menor de 1000 €
SELECT nomUniversidad FROM universidades
WHERE codUniversidad IN (
	SELECT TOP 1 WITH TIES codUniversidad FROM residencias
	WHERE genero = 'masculino' AND precioMensual < 1000 AND comedor = 1
	GROUP BY codUniversidad
	ORDER BY COUNT(codResidencia) DESC
)
GO

-- 8. Visualiza los nombres de las universidades y la cantidad total deplazas que tiene cada una sumando la cantidad de plazas de cada residencia perteneciente a cada universidad.
SELECT Universidades.nomUniversidad, (SELECT SUM(cantidadPlazas) FROM residencias WHERE codUniversidad = Universidades.codUniversidad)
FROM Universidades
GO

-- 9. Cual es el nombre de la universidad con más plazas de género mixto
SELECT nomUniversidad FROM Universidades
WHERE codUniversidad = (
	SELECT TOP 1 codUniversidad FROM residencias
	WHERE genero = 'mixto'
	GROUP BY codUniversidad
	ORDER BY SUM(cantidadPlazas) DESC
)
GO

-- 10. Visualiza el nombre  de las universidades y la cantidad total de plazas masculinas, de plazas femeninas y de plazas mixtas
SELECT nomUniversidad, (SELECT COALESCE(SUM(cantidadPlazas), 0) FROM residencias WHERE genero = 'masculino' AND codUniversidad = Universidades.codUniversidad) AS [Plazas Masculinas],
					(SELECT COALESCE(SUM(cantidadPlazas), 0) FROM residencias WHERE genero = 'femenino' AND codUniversidad = Universidades.codUniversidad) AS [Plazas Femeninas],
					(SELECT COALESCE(SUM(cantidadPlazas), 0) FROM residencias WHERE genero = 'mixto' AND codUniversidad = Universidades.codUniversidad) AS [Plazas Mixtas]
FROM Universidades
GO
-- NOTA: La función COALESCE recorre todos los parámetros indicados y devolverá el primero no nulo.
-- Se usa esto para a la hora de usar SUM, aquellos que devuelvan NULL dejarlos como 0.

-- 11. Visualiza los nombres de las residencias que han tenido alguna estancia
SELECT nomResidencia FROM residencias
WHERE codResidencia IN (SELECT codResidencia FROM estancias)
GO

-- 12. Visualiza los nombres de lasresidencias que no han tenido ninguna estancia
SELECT nomResidencia FROM residencias
WHERE codResidencia NOT IN (SELECT codResidencia FROM estancias)
GO

-- 13. Visualiza los nombres de las universidades que han tenido alguna estancia (alguna de sus residencias han tenido estancias)
SELECT nomUniversidad FROM Universidades
WHERE codUniversidad IN (
						 SELECT codUniversidad FROM residencias
						 WHERE codResidencia IN (
												 SELECT codResidencia FROM estancias
												)
						)
GO

-- 14. Visualiza los nombres de las universidades que no han tenido ninguna estancia (ninguna de sus residencias han tenido estancias)
SELECT nomUniversidad FROM Universidades
WHERE codUniversidad NOT IN (
							 SELECT codUniversidad FROM residencias
							 WHERE codResidencia IN (
													 SELECT codResidencia FROM estancias
													)
							)
GO