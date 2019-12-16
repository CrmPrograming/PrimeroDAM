-- ######################################

--		  CONSULTA CONSTRUCCION 2

-- ######################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 16/12/2019

USE construccion
GO

-- 13. De los edificios de categor�a X visualiza las direcciones de los edificios que se ha trabajado menos de 10 d�as en total
SELECT e.direccion
FROM edificio AS e
	LEFT JOIN asignacion AS a ON e.id_edificio = a.id_edificio
WHERE e.categoria = 'A'
GROUP BY e.direccion
HAVING SUM(a.num_dias) < 10

-- 14. Cual es la categor�a o categor�as del edifico a la cual se le han asignado mas electricistas
SELECT TOP 1 WITH TIES e.categoria
FROM edificio AS e
	INNER JOIN asignacion AS a ON e.id_edificio = a.id_edificio
	INNER JOIN trabajador AS t ON a.id_trabajador = t.id_trabajador
WHERE t.oficio = 'electricista'
GROUP BY e.categoria
ORDER BY COUNT(a.id_trabajador) DESC

-- 15. De los edificios que no han tenido ninguna asignaci�n visualiza sus categor�as y las cantidades de edificios
-- de cada categor�a que hay.
SELECT e.categoria, COUNT(*) AS 'Total edificios por categoria'
FROM edificio AS e
	LEFT JOIN asignacion AS a ON e.id_edificio = a.id_edificio
	INNER JOIN trabajador AS t ON a.id_trabajador = t.id_trabajador
WHERE a.id_edificio IS NULL
GROUP BY e.categoria

-- ESTA ES LA CORRECTA
SELECT e.categoria, COUNT(*) AS 'Total edificios por categoria'
FROM trabajador as T
	INNER JOIN asignacion AS a ON t.id_trabajador = a.id_trabajador
	RIGHT JOIN edificio AS e ON a.id_edificio = e.id_edificio
WHERE a.id_edificio IS NULL
GROUP BY e.categoria

-- 16. Cuales son los nivel_calidad de los edificios que no tenga ninguna asignaci�n.
SELECT DISTINCT e.nivel_calidad
FROM edificio AS e
	LEFT JOIN asignacion AS a ON e.id_edificio = a.id_edificio
WHERE a.id_edificio IS NULL
	
-- 17. De los edificios de categor�a X Cuales son los nivel_calidad de los edificios que no 
-- tenga ninguna asignaci�n.
SELECT DISTINCT e.nivel_calidad
FROM edificio AS e
	LEFT JOIN asignacion AS a ON e.id_edificio = a.id_edificio
WHERE a.id_edificio IS NULL AND e.categoria = 'A'

-- 18. Cual es el a�o o a�os en los que han trabajado mas trabajadores diferentes
SELECT TOP 1 WITH TIES YEAR(a.fecha_inicio) AS 'A�o trabajado'
FROM asignacion AS a
	INNER JOIN trabajador AS t ON a.id_trabajador = t.id_trabajador
GROUP BY YEAR(a.fecha_inicio)
ORDER BY COUNT(DISTINCT a.id_trabajador) DESC

-- 19. Cual es el a�o o a�os en los que han trabajado mas electricistas diferentes
SELECT TOP 1 WITH TIES YEAR(a.fecha_inicio) AS 'A�o trabajado'
FROM asignacion AS a
	INNER JOIN trabajador AS t ON a.id_trabajador = t.id_trabajador
WHERE t.oficio = 'electricista'
GROUP BY YEAR(a.fecha_inicio)
ORDER BY COUNT(DISTINCT a.id_trabajador) DESC

-- 20. Cual es el a�o o a�os en el que se ha trabajado en mas edificios diferentes
SELECT TOP 1 WITH TIES YEAR(a.fecha_inicio) AS 'A�o trabajado'
FROM asignacion AS a
	INNER JOIN trabajador AS t ON a.id_trabajador = t.id_trabajador
GROUP BY YEAR(a.fecha_inicio)
ORDER BY COUNT(DISTINCT a.id_edificio) DESC

-- 21. Visualiza las direcciones de edificios y trabajadores que han sido asignados al mismo
-- edificio en mas de una ocasi�n
SELECT e.direccion, a.id_trabajador
FROM edificio AS e
	INNER JOIN asignacion AS a ON e.id_edificio = a.id_edificio
GROUP BY e.direccion, a.id_trabajador
HAVING COUNT(*) > 1

-- 22. Visualiza por cada tipo de edifico y a�o cuantas asignaciones de trabajo tiene
SELECT e.tipo, YEAR(a.fecha_inicio) AS 'A�o', COUNT(a.id_asignacion) AS 'Total Asignaciones'
FROM edificio AS e
	INNER JOIN asignacion AS a ON e.id_edificio = a.id_edificio
GROUP BY e.tipo, YEAR(a.fecha_inicio)

-- 23. Visualiza por cada tipo de edifico y a�o cuantas asignaciones de trabajadores tiene
SELECT e.tipo, YEAR(a.fecha_inicio) AS 'A�o', COUNT(a.id_trabajador) AS 'Total Trabajadores'
FROM edificio AS e
	INNER JOIN asignacion AS a ON e.id_edificio = a.id_edificio
GROUP BY e.tipo, YEAR(a.fecha_inicio)

-- 24. Visualiza por cada tipo de edifico y a�o cuantas asignaciones de trabajadores diferentes tiene
SELECT e.tipo, YEAR(a.fecha_inicio) AS 'A�o', COUNT(DISTINCT a.id_trabajador) AS 'Total Trabajadores'
FROM edificio AS e
	INNER JOIN asignacion AS a ON e.id_edificio = a.id_edificio
GROUP BY e.tipo, YEAR(a.fecha_inicio)