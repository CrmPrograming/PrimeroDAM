-- ###################################

--		     SUBCONSULTAS 2

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 10/03/2020

USE Agenda1
GO

-- 6. Visualiza con subconsultas los nombres de las provincias en las que no tengo ningún contacto.
SELECT NombreProvincia FROM provincias
WHERE Provincia NOT IN
	(SELECT Provincia FROM contactos)
GO

-- 7. Visualiza con subconsultas los nombres de las provincias y la cantidad de contactos en cada una de las provincias
SELECT NombreProvincia, (SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Provincia = provincias.Provincia ) AS [Total contactos] FROM provincias
GO

-- 8. Visualiza con subconsultas los nombres de las provincias pero solo de aquellas provincias que tengan más de 1 contacto.
SELECT NombreProvincia FROM provincias
WHERE (SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Provincia = provincias.Provincia ) > 1
GO

-- 9. Igual al anterior y el nombre de la provincia comience por X
SELECT NombreProvincia FROM provincias
WHERE (SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Provincia = provincias.Provincia ) > 1 AND NombreProvincia LIKE 'S%'
GO

-- 10. Cual o cuales son los nombre de provincia con más contactos de la categoría X
SELECT TOP 1 WITH TIES NombreProvincia FROM provincias
WHERE Provincia IN (SELECT Provincia FROM contactos WHERE Categoria = 'CUMP')
ORDER BY (SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Provincia = provincias.Provincia) DESC
GO

-- 11. Cual o cuales son los nombre de provincia  con contactos de la categoría X y más de 1 contacto
SELECT NombreProvincia FROM provincias
WHERE Provincia IN (SELECT Provincia FROM contactos WHERE Categoria = 'CUMP') AND
(SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Provincia = provincias.Provincia) > 1
GO

-- 12. Visualiza todas las descripciones de categorías con más de 1 contacto
SELECT Descripcion FROM categorias
WHERE Categoria IN (SELECT Categoria FROM contactos) AND
	(SELECT COUNT(id_contacto) FROM contactos WHERE categorias.Categoria = contactos.Categoria) > 1
GO

-- 13. Cuales son los nombres de provincias que tienen mas contactos que la cantidad de contactos de la provincia con codigo  X.
SELECT NombreProvincia FROM provincias
WHERE Provincia IN (SELECT Provincia FROM contactos) AND
	(SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Provincia = provincias.Provincia) > (SELECT COUNT(id_contacto) FROM contactos WHERE Provincia = 10)
GO

-- 14. Cuales son las poblaciones que tienen mas contactos que la cantidad de contactos de la población  X.
SELECT Poblacion FROM contactos AS c1
WHERE Poblacion IS NOT NULL AND
	(SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Poblacion = c1.Poblacion) > (SELECT COUNT(id_contacto) FROM contactos WHERE Poblacion = 'Tacoronte')
GO

-- 15. Visualiza la media de contactos por poblacion ( para ello tendrás que calcular cuantos contactos tiene cada población y a ese resultado aplicarle la media)
SELECT AVG(Total) AS [Media contactos por poblacion]
FROM
	(SELECT COUNT(id_contacto) AS Total
	FROM contactos GROUP BY Poblacion) AS [Cantidad contactos por poblacion]
GO

-- 16. Cuales son las poblaciones con mas contactos que la media de contactos por población.
SELECT Poblacion
FROM contactos AS c
GROUP BY Poblacion
HAVING COUNT(id_contacto) > 	
		(SELECT AVG(Total)
		 FROM
			(SELECT COUNT(id_contacto) AS Total
			 FROM contactos GROUP BY Poblacion) AS [Cantidad contactos por poblacion])
GO