-- ###################################

--		     SUBCONSULTAS 6

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 25/03/2020

USE BDResidenciasEscolares_prueba
GO

-- 1. A que nombre de universidad pertenece la residencia con menor paga mensual
SELECT nomUniversidad
FROM Universidades
WHERE codUniversidad = (
					 SELECT TOP 1 codUniversidad
					 FROM residencias
					 ORDER BY precioMensual ASC
					)

SELECT TOP 1 nomUniversidad
FROM Universidades
	INNER JOIN residencias
	ON Universidades.codUniversidad = residencias.codUniversidad
ORDER BY precioMensual ASC
GO

-- 2. Cual o cuales son los nombres de la universidad con menos residencias con comedor.
SELECT nomUniversidad
FROM Universidades
WHERE codUniversidad IN (
					 SELECT TOP 1 WITH TIES codUniversidad
					 FROM residencias
					 WHERE comedor = 1
					 GROUP BY codUniversidad
					 ORDER BY COUNT(codResidencia) ASC
					)

SELECT TOP 1 WITH TIES nomUniversidad
FROM Universidades
	INNER JOIN residencias
	ON Universidades.codUniversidad = residencias.codUniversidad
WHERE COMEDOR = 1
GROUP BY Universidades.nomUniversidad
ORDER BY COUNT(codResidencia) ASC
GO

-- 3. Cual es el nombre de la universidad que su estancia sea con menor precio pagado y su fecha de inicio sea la menor.
SELECT nomUniversidad
FROM Universidades
	INNER JOIN residencias
	ON Universidades.codUniversidad = residencias.codUniversidad
WHERE codResidencia = (
						SELECT TOP 1 codResidencia
						FROM estancias
						ORDER BY preciopagado ASC, fechaInicio ASC
					  )
GO

-- 4. De las residencias que no tienen estancias, ¿cuántas tienen comedor?
SELECT COUNT(codResidencia) AS [Total]
FROM residencias
WHERE comedor = 1 AND codResidencia NOT IN (SELECT DISTINCT codResidencia FROM estancias)

SELECT COUNT(*) AS [Total]
FROM residencias
	LEFT JOIN estancias ON residencias.codResidencia = estancias.codResidencia
WHERE codEstudiante IS NULL AND comedor = 1
GO

-- 5. Visualiza las universidades que no tienen residencia
SELECT nomUniversidad
FROM Universidades
	LEFT JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
WHERE codResidencia IS NULL

SELECT nomUniversidad
FROM Universidades
WHERE codUniversidad NOT IN (SELECT codUniversidad FROM residencias)
GO

-- 6. Visualiza las universidades que alguna de sus residencias no tiene estancias
SELECT DISTINCT nomUniversidad
FROM Universidades
	INNER JOIN residencias ON Universidades.codUniversidad = residencias.codUniversidad
WHERE codResidencia = ANY (
							SELECT codResidencia
							FROM residencias
							WHERE codResidencia NOT IN (
														SELECT codResidencia FROM estancias
														)
						 )
GO

-- 7. Visualiza las universidades que todas sus residencias no tienen estancias
SELECT nomuniversidad
FROM universidades
WHERE coduniversidad NOT IN (
							 SELECT DISTINCT coduniversidad
							 FROM residencias
							 INNER JOIN estancias ON residencias.codresidencia=estancias.codresidencia
							)
GO