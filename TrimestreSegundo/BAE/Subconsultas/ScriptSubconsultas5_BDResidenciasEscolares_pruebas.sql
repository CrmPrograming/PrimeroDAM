-- ###################################

--		     SUBCONSULTAS 5

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 23/03/2020

USE BDResidenciasEscolares_prueba
GO

-- 15. Visualiza cada estancia con todos sus datos y además la cantidad de días de cada estancia. Utiliza datediff(dd,fechainicio,fecha fin)( no hace falta que uses subconsultas en estee jercicio)
SELECT codEstudiante, codResidencia, fechaInicio, fechaFin, preciopagado, observaciones, numhabitacion, DATEDIFF(dd, fechainicio, fechafin) AS [Cantidad de días]
FROM estancias
GO

-- 16. Visualiza los nombres de las residencias y el total de días de estancias que ha tenido cada una
SELECT nomResidencia, (SELECT COALESCE(SUM(DATEDIFF(dd, fechainicio, fechafin)), 0) FROM estancias WHERE r.codResidencia = estancias.codResidencia) AS [Cantidad de días]
FROM residencias AS r

SELECT nomResidencia, COALESCE(SUM(DATEDIFF(dd, fechainicio, fechafin)), 0) AS [Cantidad de días]
FROM residencias LEFT JOIN estancias ON residencias.codResidencia = estancias.codResidencia
GROUP BY nomResidencia
GO

-- 17. Visualiza los nombres de las residencias que han tenido más días de estancias que la residencia con nombre X
SELECT nomResidencia, (SELECT COALESCE(SUM(DATEDIFF(dd, fechainicio, fechafin)), 0) FROM estancias WHERE r.codResidencia = estancias.codResidencia) AS [Cantidad de días]
FROM residencias AS r
WHERE (SELECT COALESCE(SUM(DATEDIFF(dd, fechainicio, fechafin)), 0) FROM estancias WHERE r.codResidencia = estancias.codResidencia) > (
		SELECT COALESCE(SUM(DATEDIFF(dd, fechainicio, fechafin)), 0) FROM estancias
		WHERE r.codResidencia = (SELECT codResidencia FROM residencias WHERE nomResidencia = 'Residencia Pepe')
	  )

SELECT nomResidencia, COALESCE(SUM(DATEDIFF(dd, fechainicio, fechafin)), 0) AS [Cantidad de días]
FROM residencias LEFT JOIN estancias ON residencias.codResidencia = estancias.codResidencia
GROUP BY nomResidencia
HAVING COALESCE(SUM(DATEDIFF(dd, fechainicio, fechafin)), 0) > (
		SELECT COALESCE(SUM(DATEDIFF(dd, fechainicio, fechafin)), 0) FROM estancias
		WHERE codResidencia = (SELECT codResidencia FROM residencias WHERE nomResidencia = 'Residencia Pepe')
)
GO

-- 18. Cual es el nombre de la universidad o universidades que han tenido más días de estancias.
SELECT nomUniversidad FROM Universidades
WHERE codUniversidad IN (
						 SELECT TOP 1 WITH TIES codUniversidad 
						 FROM residencias AS r
						 ORDER BY (SELECT COALESCE(SUM(DATEDIFF(dd, fechainicio, fechafin)), 0) FROM estancias WHERE r.codResidencia = estancias.codResidencia) DESC
						)
GO

-- 19. Visualiza la media de días de estancia por residencias. Para ello, primero obtén la cantidad de días de estancias por residencia y a esos valores aplícalela media.
SELECT AVG(T.P) AS [Medía de días de estancia]
FROM (SELECT nomResidencia, (SELECT COALESCE(SUM(DATEDIFF(dd, fechainicio, fechafin)), 0) FROM estancias WHERE r.codResidencia = estancias.codResidencia) AS P
	FROM residencias AS r) AS T
GO

-- 20. Cuales son las universidades que tienen mas días de estancias totales que la media de días de estancia por universidad. La media de días de estancia por universidad se obtiene obteniendo el total de díasde estancia por universidad y a eso se le aplicará la media.
SELECT (
		SELECT nomUniversidad FROM Universidades
		WHERE codUniversidad IN (
								SELECT codUniversidad FROM residencias
								WHERE residencias.codResidencia = estancias.codResidencia
								)
	   ) AS [Universidad]
FROM estancias
GROUP BY codResidencia
HAVING COALESCE(SUM(DATEDIFF(dd, fechaInicio, fechaFin)), 0) > (SELECT AVG(DATEDIFF(dd, fechaInicio, fechaFin)) FROM estancias)

-- 21. Cuales son los nombres de los estudiantes que han estado en más de una residencia.
SELECT nomEstudiante
FROM estudiantes
WHERE codEstudiante IN (
						SELECT codEstudiante FROM estancias
						GROUP BY codEstudiante
						HAVING COUNT(codResidencia) > 1
					   )
GO

-- 22. Cual es el nombre de la residencia o residencias que en el año X (la fecha de inicio de la estancia deberá ser del año X) ha obtenido
-- más euros en total, contando los precios que han pagado los estudiantes por la estancia
SELECT nomResidencia
FROM residencias
WHERE codResidencia IN (
						SELECT TOP 1 WITH TIES codResidencia
						FROM estancias
						WHERE YEAR(fechaInicio) = 2009
						GROUP BY codResidencia
						ORDER BY SUM(preciopagado) DESC
					  )
GO

SELECT TOP 1 WITH TIES nomResidencia
FROM residencias
	INNER JOIN estancias ON residencias.codResidencia = estancias.codResidencia
WHERE YEAR(fechaInicio) = 2009
GROUP BY nomResidencia
ORDER BY SUM(precioPagado) DESC
GO

-- 23. Cual es el nombre de la residencia por la que han pasado más estudiantes diferentes.
SELECT TOP 1 nomResidencia
FROM residencias
ORDER BY (SELECT COUNT(DISTINCT codEstudiante) FROM estancias WHERE estancias.codResidencia = residencias.codResidencia) DESC
GO

-- 24. Cual es el nombre de la residencia por la que han repetido más estudiantes (que tenga más estudiantes que hayan hecho mas de una
-- estancia en la misma residencia).
SELECT TOP 1 nomResidencia
FROM residencias
WHERE (SELECT COUNT(codEstudiante) FROM estancias WHERE estancias.codResidencia = residencias.codResidencia) > 1
ORDER BY (SELECT COUNT(codEstudiante) FROM estancias WHERE estancias.codResidencia = residencias.codResidencia) DESC
GO

-- 25. Cuales son los nombres de los estudiantes que no han realizado ninguna estancia con fecha de inicio en el año X
SELECT nomEstudiante
FROM estudiantes
WHERE codEstudiante NOT IN (
							SELECT codEstudiante
							FROM estancias
							WHERE YEAR(fechaInicio) = 2009
						   )
GO