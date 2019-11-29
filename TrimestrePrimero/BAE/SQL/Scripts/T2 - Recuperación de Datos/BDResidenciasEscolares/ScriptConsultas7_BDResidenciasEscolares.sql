 -- ######################################

--			CONSULTA BDRESIDENCIAS 7

-- ######################################

-- autor: César Ravelo Martínez
-- fecha: 29/11/2019

-- 1. Visualiza todas las residencias y los nombres de las universidades en la que se encuentra cada una ordenada por nombre de universidades
SELECT r.codResidencia, r.nomResidencia, u.nomUniversidad FROM residencias AS r
INNER JOIN universidades AS u ON r.codUniversidad = u.codUniversidad
GO

-- 2. Visualiza todas las residencias y los nombres de las universidades en la que se encuentra cada una ordenada por nombre de universidades, pero solo aquellas que pertenezcan a la universidad con nombre X
SELECT r.codResidencia, r.nomResidencia, u.nomUniversidad FROM residencias AS r
INNER JOIN universidades AS u
	ON r.codUniversidad = u.codUniversidad
WHERE u.nomUniversidad = 'Universidad de Gran Canaria'
ORDER BY u.nomUniversidad
GO

-- 3. Visualiza todas las residencias y los nombres de las universidades en la que se encuentra cada una, pero solo aquellas residencias que tengan mas de 100 plazas ordenado por nombreresidencia
SELECT r.codResidencia, r.nomResidencia, u.nomUniversidad FROM residencias AS r
INNER JOIN universidades AS u
	ON r.codUniversidad = u.codUniversidad
WHERE r.cantidadPlazas > 100
ORDER BY r.nomResidencia
GO

-- 4. Visualiza la residencia , el nombre de la residencia, la cantidad de plazas  y nombre de la universidad  , pero solo quiero ver las que menos plazas tienen
SELECT TOP 1 WITH TIES r.codResidencia, r.nomResidencia, r.cantidadPlazas, u.nomUniversidad
FROM residencias AS r
INNER JOIN universidades AS u
	ON r.codUniversidad = u.codUniversidad
ORDER BY r.cantidadPlazas ASC
GO

-- 5. Visualiza todos los datos de las residencias y todas las estancias que tiene cada una ordenado por nombre de residencias
SELECT r.*, e.* 
FROM residencias AS r
INNER JOIN estancias AS e
	ON r.codResidencia = e.codResidencia
ORDER BY r.nomResidencia
GO

-- 6. Visualiza todos los datos de los estudiantes y todas las estancias de cada uno , pero solo aquellos cuya fecha inicio sea en el año X
SELECT es.*, e.*
FROM estudiantes AS es
INNER JOIN estancias AS e
	ON es.codEstudiante = e.codEstudiante
WHERE YEAR(e.fechaInicio) = 2019
GO

-- 7. Visualiza los nombre de las universidades y las cantidades de residencias que tiene cada universidad
SELECT u.nomUniversidad, COUNT(r.codResidencia) AS 'Cantidad Residencias'
FROM universidades AS u
INNER JOIN residencias AS r
	ON u.codUniversidad = r.codUniversidad
GROUP BY r.codResidencia
GO