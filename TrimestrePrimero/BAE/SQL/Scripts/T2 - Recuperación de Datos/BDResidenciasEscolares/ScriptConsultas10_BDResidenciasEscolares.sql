-- ######################################

--		  CONSULTA BDRESIDENCIAS 10

-- ######################################

-- autor: César Ravelo Martínez
-- fecha: 13/12/2019

USE BDResidenciasEscolares
GO

-- 1. Visualiza los nombres de las residencias que no tengan ninguna estancia
SELECT r.nomResidencia
FROM residencias AS r
	LEFT JOIN estancias AS e ON r.codResidencia = e.codResidencia
WHERE e.codResidencia IS NULL

-- 2. ¿Cuantas residencias no tienen ninguna estancia ?
SELECT COUNT(r.codResidencia) AS 'Residencias sin estancia'
FROM residencias AS r
	LEFT JOIN estancias AS e ON r.codResidencia = e.codResidencia
WHERE e.codResidencia IS NULL

-- 3. Visualiza el nombre de la residencia y cuantas estancias de estudiantes
-- han tenido con fechainicio en el año X
SELECT r.nomResidencia, COUNT(e.codResidencia) AS 'Total estancias'
FROM residencias AS r
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
WHERE YEAR(e.fechaInicio) = 2009
GROUP BY r.nomResidencia

-- 4. Visualiza el nombre de la residencia y cuantas estancias de estudiantes
-- diferentes han tenido con fechainicio en el año X
SELECT r.nomResidencia, COUNT(DISTINCT e.codResidencia) AS 'Total estancias'
FROM residencias AS r
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
WHERE YEAR(e.fechaInicio) = 2009
GROUP BY r.nomResidencia

-- 5. Visualiza el nombre de las residencias y el total de días de cada residencia
-- en todas sus estancias
SELECT r.nomResidencia, SUM(DATEDIFF(dd, e.fechaInicio, e.fechaFin)) AS 'Total de días'
FROM residencias AS r
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
GROUP BY r.nomResidencia

-- 6. Cual es la residencia o residencias que ha tenido mas estancias contando los días.
SELECT TOP 1 WITH TIES r.nomResidencia
FROM residencias AS r
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
GROUP BY r.nomResidencia
ORDER BY SUM(DATEDIFF(dd, e.fechaInicio, e.fechaFin)) DESC

-- 7. Visualiza los nombres de las residencias que han tenido en sus estancias en total 
-- mas de 100 dias en los años X e Y
SELECT r.nomResidencia
FROM residencias AS r
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
WHERE YEAR(e.fechaInicio) >= 2000 AND YEAR(e.fechaFin) <= 2024
GROUP BY r.nomResidencia
HAVING SUM(DATEDIFF(dd, e.fechaInicio, e.fechaFin)) > 100

-- 8. Queremos visualizar el nombre de la universidad, el nombre de la residencia y el
-- total de días de estancias de cada una.
SELECT u.nomUniversidad, r.nomResidencia, SUM(DATEDIFF(dd, e.fechaInicio, e.fechaFin)) AS 'Total de días de estancia'
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
GROUP BY u.nomUniversidad, r.nomResidencia

-- 9. Igual al anterior pero solo de las residencias con comedor y que su total de días sea menos de 2000
SELECT u.nomUniversidad, r.nomResidencia, SUM(DATEDIFF(dd, e.fechaInicio, e.fechaFin)) AS 'Total de días de estancia'
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
WHERE r.comedor = 1
GROUP BY u.nomUniversidad, r.nomResidencia
HAVING SUM(DATEDIFF(dd, e.fechaInicio, e.fechaFin)) < 2000