-- ######################################

--		  CONSULTA CONSTRUCCION 1

-- ######################################

-- autor: César Ravelo Martínez
-- fecha: 13/12/2019

USE construccion
GO

-- 1. Cuantos trabajadores hay de cada oficio
SELECT oficio, COUNT(*) AS 'Total trabajadores'
FROM trabajador
GROUP BY oficio

-- 2. Visualiza los trabajadores que nunca han tenido asignación de trabajo
SELECT t.nombre
FROM trabajador AS t
	LEFT JOIN asignacion AS a ON t.id_trabajador = a.id_trabajador
WHERE a.id_trabajador IS NULL

-- 3. Cuantos trabajadores tienen asignación de trabajo
SELECT COUNT(*) AS 'Trabajadores con asignación de trabajo'
FROM trabajador AS t
	INNER JOIN asignacion AS a ON t.id_trabajador = a.id_trabajador

-- 4. Cuales son los trabajadores sin asignación de trabajo que cobren menos por hora
SELECT TOP 1 WITH TIES t.nombre
FROM trabajador AS t
	LEFT JOIN asignacion AS a ON t.id_trabajador = a.id_trabajador
WHERE a.id_trabajador IS NULL
ORDER BY t.tarifa_hora ASC

-- 5. De todas las asignaciones de oficio electricista cuales son los trabajadores que han
-- tenido en totalasignados más de 20 días.
SELECT t.nombre
FROM trabajador AS t
	INNER JOIN asignacion AS a ON t.id_trabajador = a.id_trabajador
WHERE t.oficio = 'electricista'