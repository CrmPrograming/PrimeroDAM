-- ###################################

--		     SUBCONSULTAS 9

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 03/04/2020

USE ConstruccionTrabajadores1
GO

-- 10. Visualiza la dirección de los edificios en los que hayan trabajado más trabajadores diferentes.
SELECT DIRECCION FROM EDIFICIO
WHERE ID_EDIFICIO IN (
						SELECT TOP 1 WITH TIES ID_EDIFICIO
						FROM ASIGNACION
						GROUP BY ID_EDIFICIO
						ORDER BY COUNT(DISTINCT ID_TRABAJADOR) DESC
					 )
GO

-- 11. De los edificios con más de 1 asignaciones de trabajadores, cual es la dirección del edificio
-- en el que se haya trabajado más días en total.
SELECT DIRECCION
FROM EDIFICIO
WHERE ID_EDIFICIO = (
					 SELECT TOP 1 ID_EDIFICIO
					 FROM ASIGNACION
					 GROUP BY ID_EDIFICIO
					 HAVING COUNT(ID_ASIGNACION) > 1
					 ORDER BY SUM(NUM_DIAS) DESC
					)
GO

-- 12. Visualiza de los edificios que tienen asignación, la media de las tarifa_hora de sus trabajadores
-- asignados. Osea, visualiza el id_edificio y la media de tarifa_hora de cada uno de los edificios.
SELECT ID_EDIFICIO, AVG(TARIFA_HORA) AS [Media Tarifa-Hora]
FROM ASIGNACION
	INNER JOIN TRABAJADOR ON ASIGNACION.ID_TRABAJADOR = TRABAJADOR.ID_TRABAJADOR
GROUP BY ID_EDIFICIO
GO

-- 13. Calcula la media de tarifa_hora de todos los edificios. Osea, a la media de tarifa_hora por edificio le aplicas la media.
SELECT AVG(T.Media) AS [Media Total]
FROM (
	  SELECT AVG(TARIFA_HORA) AS [Media]
	  FROM ASIGNACION
	   INNER JOIN TRABAJADOR ON ASIGNACION.ID_TRABAJADOR = TRABAJADOR.ID_TRABAJADOR
	  GROUP BY ID_EDIFICIO
	 ) AS T
GO

-- 14. Visualiza las direcciones de los edificios que tienen mayor tarifa_hora que la media de todos ellos.
SELECT DIRECCION
FROM EDIFICIO
WHERE ID_EDIFICIO IN (
						SELECT ID_EDIFICIO
						FROM ASIGNACION
							INNER JOIN TRABAJADOR ON ASIGNACION.ID_TRABAJADOR = TRABAJADOR.ID_TRABAJADOR
						GROUP BY ID_EDIFICIO
						HAVING AVG(TARIFA_HORA) > (
													SELECT AVG(T.Media)
													FROM (
														  SELECT AVG(TARIFA_HORA) AS [Media]
														  FROM ASIGNACION
														   INNER JOIN TRABAJADOR ON ASIGNACION.ID_TRABAJADOR = TRABAJADOR.ID_TRABAJADOR
														  GROUP BY ID_EDIFICIO
														 ) AS T
												  )
					 )
GO

-- 15. Visualiza los datos de los trabajadores que no tienen ninguna asignación.
SELECT * FROM TRABAJADOR
WHERE ID_TRABAJADOR NOT IN (SELECT ID_TRABAJADOR FROM ASIGNACION)
GO

-- 16. Cual es el nombre del trabajador que haya ganado menos en el año X.
-- (Tener en cuenta que cada día trabajan 8 horas y la tarifa es por hora)
SELECT NOMBRE
FROM TRABAJADOR
WHERE ID_TRABAJADOR = (
						SELECT TOP 1 ID_TRABAJADOR
						FROM ASIGNACION
						WHERE YEAR(FECHA_INICIO) = 2021
						ORDER BY 8 * NUM_DIAS * (SELECT TARIFA_HORA FROM TRABAJADOR WHERE TRABAJADOR.ID_TRABAJADOR = ASIGNACION.ID_TRABAJADOR) ASC
					  )
GO

-- 17. Visualizar por cada trabajador la cantidad de días totales que ha trabajado y la cantidad total de euros que ha ganado
SELECT ID_TRABAJADOR, NUM_DIAS, (SELECT 8 * NUM_DIAS * TARIFA_HORA FROM TRABAJADOR WHERE TRABAJADOR.ID_TRABAJADOR = ASIGNACION.ID_TRABAJADOR) AS [Total Ganado]
FROM ASIGNACION
GO