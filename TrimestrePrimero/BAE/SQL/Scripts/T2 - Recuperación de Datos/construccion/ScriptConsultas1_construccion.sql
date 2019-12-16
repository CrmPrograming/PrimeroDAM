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
SELECT COUNT(DISTINCT t.id_trabajador) AS 'Trabajadores con asignación de trabajo'
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
GROUP BY t.nombre, t.id_trabajador
HAVING SUM(a.num_dias) > 20

-- 6. Visualiza todos los oficios y las cantidades de trabajadores diferentes que tienen 
-- asignación de tareas
SELECT t.oficio, COUNT(DISTINCT t.id_trabajador) AS 'Trabajadores diferentes'
FROM trabajador AS t
	INNER JOIN asignacion AS a ON t.id_trabajador = a.id_trabajador
GROUP BY t.oficio

-- 7. Visualiza todos los oficios y las cantidades de trabajadores diferentes que tienen
-- asignación de tareas con fecha de inicio en el año X, y que esa cantidad de trabajadores
-- sea mayor de tres
SELECT t.oficio, COUNT(DISTINCT t.id_trabajador) AS 'Trabajadores diferentes'
FROM trabajador AS t
	INNER JOIN asignacion AS a ON t.id_trabajador = a.id_trabajador
WHERE YEAR(a.fecha_inicio) = 2019
GROUP BY t.oficio
HAVING COUNT(DISTINCT t.id_trabajador) > 3

-- 8. Visualiza el oficio que tenga mas trabajadores asignados
SELECT TOP 1 t.oficio
FROM trabajador AS t
	INNER JOIN asignacion AS a ON t.id_trabajador = a.id_trabajador
GROUP BY t.oficio
ORDER BY COUNT(a.id_trabajador) DESC

-- 9. Visualiza nombre del trabajador y nombre del supervisor que le corresponda a cada trabajador.
SELECT trabajadores.nombre AS 'Trabajador', supervisores.nombre AS 'Supervisor'
FROM trabajador AS trabajadores
	INNER JOIN trabajador AS supervisores ON trabajadores.id_supervisor = supervisores.id_trabajador

-- 10. Cual es la dirección del edificio o edificios en los que se ha trabajado más días en total
SELECT TOP 1 WITH TIES e.direccion
FROM edificio AS e
	INNER JOIN asignacion AS a ON e.id_edificio = a.id_edificio
GROUP BY e.direccion
ORDER BY SUM(a.num_dias) DESC

-- 11. Cual es la dirección del edificio o edificios enlos que han trabajado más trabajadores diferentes
SELECT TOP 1 WITH TIES e.direccion
FROM edificio AS e
	INNER JOIN asignacion AS a ON e.id_edificio = a.id_edificio
GROUP BY e.direccion
ORDER BY COUNT(DISTINCT a.id_trabajador) DESC

-- 12. Visualiza las direcciones de los edificios en los cuales se ha trabajado menos de 10 dias en total
SELECT e.direccion
FROM edificio AS e
	INNER JOIN asignacion AS a ON e.id_edificio = a.id_edificio
GROUP BY e.direccion
HAVING SUM(a.num_dias) < 10