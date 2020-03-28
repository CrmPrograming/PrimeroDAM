-- ###################################

--		     SUBCONSULTAS 7

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 28/03/2020

USE BDResidenciasEscolares_prueba
GO

-- 8. De los estudiantes que no tienen email, cuales tienen alguna estancia
SELECT nomEstudiante
FROM (SELECT DISTINCT nomEstudiante, email FROM estudiantes INNER JOIN estancias ON estudiantes.codEstudiante = estancias.codEstudiante) AS T
WHERE email IS NULL
GO

-- 9. De los estudiantes que no tienen email, cual es el que mas estancias tiene.
SELECT TOP 1 nomEstudiante, (SELECT COUNT(codEstudiante) FROM estancias WHERE estudiantes.codEstudiante = estancias.codEstudiante GROUP BY estancias.codEstudiante) AS [Total]
FROM estudiantes
WHERE email IS NULL AND codEstudiante IN (
											SELECT DISTINCT codEstudiante
											FROM estancias
										 )
ORDER BY [Total] DESC
GO

-- 10. Visualiza todos los datos de las estancias del estudiante con dni X
SELECT * FROM estancias
WHERE codEstudiante = (SELECT codEstudiante FROM estudiantes WHERE dni = '11111111P')
GO

-- 11. Visualizar los nombres de las residencias y la cantidad de estudiantes que tiene cada una de las residencias en el dia X. Tener en cuenta que habrá que mirar que el dia X esté entre fechainicio y fechafin de la estancia.
SELECT nomResidencia, COALESCE((SELECT COUNT(*) FROM estancias AS e WHERE r.codResidencia = e.codResidencia AND '2009-08-04' BETWEEN fechaInicio AND fechaFin GROUP BY e.codResidencia), 0) AS [Total]
FROM residencias AS r
GO

-- 12. Cual es el nombre de la residencia que tiene alojados más estudiantes en el dia X.
SELECT TOP 1 nomResidencia, COALESCE((SELECT COUNT(*) FROM estancias AS e WHERE r.codResidencia = e.codResidencia AND '2009-08-04' BETWEEN fechaInicio AND fechaFin GROUP BY e.codResidencia), 0) AS [Total]
FROM residencias AS r
ORDER BY COALESCE((SELECT COUNT(*) FROM estancias AS e WHERE r.codResidencia = e.codResidencia AND '2009-08-04' BETWEEN fechaInicio AND fechaFin GROUP BY e.codResidencia), 0) DESC
GO

-- 13. Visualiza las residencias y la cantidad de plazas libres que tiene cada una en el dia X. (Habrá que restarle a la cantidad de plazas de la residencia las que tiene en estancias ese dia)
SELECT nomResidencia, cantidadPlazas - COALESCE((SELECT COUNT(*) FROM estancias AS e WHERE r.codResidencia = e.codResidencia AND '2009-08-04' BETWEEN fechaInicio AND fechaFin GROUP BY e.codResidencia), 0) AS [Total]
FROM residencias AS r
GO

-- 14. Visualiza la residencia con plazas libres en el dia X
SELECT nomResidencia
FROM residencias AS r
WHERE cantidadPlazas - COALESCE((SELECT COUNT(*) FROM estancias AS e WHERE r.codResidencia = e.codResidencia AND '2009-08-04' BETWEEN fechaInicio AND fechaFin GROUP BY e.codResidencia), 0) > 0
GO