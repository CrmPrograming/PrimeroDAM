-- ###################################

--		     SUBCONSULTAS 8

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 30/03/2020

USE ConstruccionTrabajadores1
GO

-- 1. Visualiza de los edificios de categoría X y nivel Y los nombres de sus trabajadores
SELECT nombre
FROM TRABAJADOR
WHERE ID_TRABAJADOR IN (
						SELECT ID_TRABAJADOR
						FROM ASIGNACION
							INNER JOIN EDIFICIO ON ASIGNACION.ID_EDIFICIO = EDIFICIO.ID_EDIFICIO
						WHERE NIVEL_CALIDAD = 3 AND CATEGORIA = 'B'
					   )
GO

-- 2. Cuál es el nombre del trabajador o trabajadores que han trabajado más días en total (el mismo trabajador
-- podrá tener varias asignaciones en el mismo edificio) en el edificio con dirección X
SELECT NOMBRE
FROM TRABAJADOR
WHERE ID_TRABAJADOR IN (
						SELECT TOP 1 WITH TIES ID_TRABAJADOR
						FROM ASIGNACION
						WHERE ID_EDIFICIO IN (SELECT ID_EDIFICIO FROM EDIFICIO WHERE DIRECCION = 'calle chopitos')
						GROUP BY ID_TRABAJADOR
						ORDER BY SUM(NUM_DIAS) DESC
					  )
GO

-- 3. Visualiza los datos de los edificios que no tengan ninguna asignación.
SELECT *
FROM EDIFICIO
WHERE ID_EDIFICIO NOT IN (
							SELECT DISTINCT ID_EDIFICIO
							FROM ASIGNACION
						 )
GO

-- 4. Cuál es la categoría que tiene más edificios.
SELECT TOP 1 CATEGORIA
FROM EDIFICIO
GROUP BY CATEGORIA
ORDER BY COUNT(ID_EDIFICIO) DESC
GO

-- 5. Visualiza todas las asignaciones de los edificios que pertenezcan a la categoría con más edificios.
SELECT ID_ASIGNACION
FROM ASIGNACION
WHERE ID_EDIFICIO IN (
						SELECT ID_EDIFICIO
						FROM EDIFICIO
						WHERE CATEGORIA = (
											SELECT TOP 1 CATEGORIA
											FROM EDIFICIO
											GROUP BY CATEGORIA
											ORDER BY COUNT(ID_EDIFICIO) DESC
										  )
					 )
GO

-- 6. Cuál es la dirección del edificio en el que se han trabajado en total menos días.
SELECT DIRECCION
FROM EDIFICIO
WHERE ID_EDIFICIO = (
					 SELECT TOP 1 ID_EDIFICIO
					 FROM ASIGNACION
					 GROUP BY ID_EDIFICIO
					 ORDER BY SUM(NUM_DIAS) ASC
					)
GO

-- 7. Visualiza todos los datos de los edificios que se hayan trabajado más días en total que
-- lo que se ha trabajado en total para el edifico con dirección X.
SELECT *
FROM EDIFICIO
WHERE ID_EDIFICIO IN (
						SELECT ID_EDIFICIO
						FROM ASIGNACION						
						GROUP BY ID_EDIFICIO
						HAVING SUM(NUM_DIAS) > (
												SELECT SUM(NUM_DIAS)
												FROM ASIGNACION
												WHERE ID_EDIFICIO = (SELECT ID_EDIFICIO FROM EDIFICIO WHERE DIRECCION = 'calle calamares')												
											  )						
					 )
GO

-- 8. Visualiza los datos del edificio que haya tenido más cantidad de asignaciones.
SELECT *
FROM EDIFICIO
WHERE ID_EDIFICIO = (
					 SELECT TOP 1 ID_EDIFICIO
					 FROM ASIGNACION
					 GROUP BY ID_EDIFICIO
					 ORDER BY COUNT(ID_ASIGNACION) DESC
					)
GO

-- 9. De los edificios de tipo X Cual tiene más asignaciones en el año Y
SELECT TOP 1 ID_EDIFICIO
FROM ASIGNACION
WHERE YEAR(FECHA_INICIO) = 2021 AND ID_EDIFICIO IN (SELECT ID_EDIFICIO FROM EDIFICIO WHERE TIPO = 'Oficina')
GROUP BY ID_EDIFICIO
ORDER BY COUNT(ID_ASIGNACION) DESC 
GO