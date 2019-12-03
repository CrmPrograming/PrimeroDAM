 -- ######################################

--			CONSULTA BDRESIDENCIAS 8

-- ######################################

-- autor: César Ravelo Martínez
-- fecha: 03/12/2019

USE BDResidenciasEscolares
GO

-- 1. Visualiza el nombre del estudiante , el nombre de la residencia y las fechas en las cuales los estudiantes realizan sus estancias ordenado por nombre de estudiante.
SELECT es.nomEstudiante, r.nomResidencia, e.fechaInicio, e.fechaFin 
FROM estudiantes AS es 
	INNER JOIN estancias AS e ON es.codEstudiante = e.codEstudiante
	INNER JOIN residencias AS r ON e.codResidencia = r.codResidencia
ORDER BY es.nomEstudiante

-- 2. Visualiza el nombre del estudiante , el nombre de la universidad y las fechas en las cuales los estudiantes realizan sus estancias ordenado por nombre de universidad.
SELECT es.nomEstudiante, u.nomUniversidad, e.fechaInicio, e.fechaFin 
FROM estudiantes AS es 
	INNER JOIN estancias AS e ON es.codEstudiante = e.codEstudiante
	INNER JOIN residencias AS r ON e.codResidencia = r.codResidencia
	INNER JOIN universidades AS u ON r.codUniversidad = u.codUniversidad
ORDER BY u.nomUniversidad

-- 3. Visualiza el sexo y la cantidad de estudiantes de cada uno de los sexos que han realizado estancias.
SELECT es.sexo, COUNT(es.sexo) AS 'Cantidad estudiantes'
FROM estudiantes AS es
	INNER JOIN estancias AS e ON es.codEstudiante = e.codEstudiante
GROUP BY es.sexo

-- 4. Queremos conocer el nombre de la universidad, el genero de la residencia y la cantidad de estancias que hay de cada universidad y genero ordenado por nombre de universidad
SELECT u.nomUniversidad, r.genero, COUNT(e.codResidencia) AS 'Cantidad de estancias'
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
GROUP BY u.nomUniversidad, r.genero

-- 5. Cual es el nombre de la universidad y genero con más estancias
SELECT TOP 1 u.nomUniversidad, r.genero, COUNT(e.codResidencia) AS 'Cantidad plazas'
FROM universidades AS u
	INNER JOIN residencias AS r ON u.codUniversidad = r.codUniversidad
	INNER JOIN estancias AS e ON r.codResidencia = e.codResidencia
GROUP BY u.nomUniversidad, r.genero
ORDER BY COUNT(e.codResidencia) DESC

-- 6. visualiza todas las universidades y los nombres de las residencias que tiene cada una incluidas aquellas universidades que no tengan ninguna residencia
SELECT u.nomUniversidad, r.nomResidencia
FROM universidades AS u
	LEFT JOIN residencias AS r ON u.codUniversidad = r.codUniversidad