-- ######################################

--			CONSULTA BDRESIDENCIAS 9

-- ######################################

-- autor: César Ravelo Martínez
-- fecha: 05/12/2019

USE BDResidenciasEscolares
GO

-- 1. Visualiza el nombre de la universidad, el nombre de la residencia y lo que se ha pagado en cada una de las estancias realizadas.
SELECT u.nomUniversidad, r.nomResidencia, e.preciopagado
FROM universidades AS u 
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia

-- 2. Visualiza el nombre de la universidad y el total que se ha pagado a cada universidad en las estancias realizadas
SELECT u.nomUniversidad, SUM(e.preciopagado) AS 'Total Pagado'
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
GROUP BY u.nomUniversidad

-- 3. ¿Cuál es el nombre de la universidad que ha recibido más dinero por las estancias realizadas?
SELECT TOP 1 u.nomUniversidad
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
GROUP BY u.nomUniversidad
ORDER BY SUM(e.preciopagado) DESC

-- 4. Visualiza el nombre de la universidad y el total que se ha pagado a cada universidad en las estancias realizadas
-- siendo su fecha de inicio en el año X
SELECT u.nomUniversidad, SUM(e.preciopagado) AS 'Total Pagado'
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
WHERE YEAR(e.fechaInicio) = 2017
GROUP BY u.nomUniversidad

-- 5. Visualiza el nombre de la universidad y el total que se ha pagado a cada universidad en las estancias realizadas
-- siendo su fecha de inicio en el año X, pero solo visualiza aquellas que hayan cobrado en total mas de X
SELECT u.nomUniversidad, SUM(e.preciopagado) AS 'Total Pagado'
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
WHERE YEAR(e.fechaInicio) = 2017
GROUP BY u.nomUniversidad
HAVING SUM(e.preciopagado) > 60

-- 6. Visualiza el nombre de la universidad y el total que se ha pagado a cada universidad en las estancias realizadas
-- siendo su fecha de inicio en el año X y cada estancia individual deberá ser mayor a 400 €, pero solo visualiza aquellas
-- que hayan cobrado en total mas de X
SELECT u.nomUniversidad, SUM(e.preciopagado) AS 'Total Pagado'
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
WHERE YEAR(e.fechaInicio) = 2017 AND e.preciopagado > 400
GROUP BY u.nomUniversidad
HAVING SUM(e.preciopagado) > 60

-- 7. Visualiza los nombres de universidades , nombre de residencia y fechainicio y fin de cada estancia incluyendo aquellas
-- universidades que no tengan ninguna estancia
SELECT u.nomUniversidad, r.nomResidencia, e.fechaInicio, e.fechaFin
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	LEFT JOIN estancias AS e ON r.codResidencia = e.codResidencia

-- 8. Visualiza el nombre de la universidad y el total que se ha pagado a cada universidad en las estancias realizadas siendo
-- su fecha de inicio en el año X. Aquellas universidades que no tengan ninguna estancia también deberán aparecer.
SELECT u.nomUniversidad, SUM(e.preciopagado) AS 'Total pagado'
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	LEFT JOIN estancias AS e ON r.codResidencia = e.codResidencia
WHERE YEAR(e.fechaInicio) = 2017
GROUP BY u.nomUniversidad

-- 9. ¿Cuántas universidades no tienen ninguna estancia ?
SELECT COUNT(u.nomUniversidad) AS 'Total universidades sin estancia'
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	LEFT JOIN estancias AS e ON r.codResidencia = e.codResidencia
WHERE e.codResidencia IS NULL
GROUP BY u.nomUniversidad

-- 10. Visualiza los nombres de las universidades y los nombres de las residencias que les correspondan que no tengan director
SELECT u.nomUniversidad, r.nomResidencia
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
WHERE r.nombreDirector IS NULL

-- 11. De las residencias que no tienen director, ¿ cuantos estudiantes diferentes han pasado por cada una ? Visualiza el nombre
-- de la residencia y la cantidad de estudiantes diferentes que han pasado por cada una.
SELECT r.nomResidencia, COUNT(DISTINCT es.nomEstudiante) AS 'Total estudiantes diferentes'
FROM residencias AS r
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
	INNER JOIN estudiantes AS es ON e.codEstudiante = es.codEstudiante
WHERE r.nombreDirector IS NULL
GROUP BY r.nomResidencia

-- 12. ¿ Cuantas residencias hay sin director ?
SELECT COUNT(*) AS 'Total residencias sin director'
FROM residencias 
WHERE nombreDirector IS NULL