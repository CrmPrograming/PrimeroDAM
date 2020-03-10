-- ###################################

--		     SUBCONSULTAS 2

-- ###################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 10/03/2020

USE Agenda1
GO

-- 6. Visualiza con subconsultas los nombres de las provincias en las que no tengo ning�n contacto.
SELECT NombreProvincia FROM provincias
WHERE Provincia NOT IN
	(SELECT Provincia FROM contactos)
GO

-- 7. Visualiza con subconsultas los nombres de las provincias y la cantidad de contactos en cada una de las provincias
SELECT NombreProvincia, (SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Provincia = provincias.Provincia ) AS [Total contactos] FROM provincias
GO

-- 8. Visualiza con subconsultas los nombres de las provincias pero solo de aquellas provincias que tengan m�s de 1 contacto.
SELECT NombreProvincia FROM provincias
WHERE (SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Provincia = provincias.Provincia ) > 1
GO

-- 9. Igual al anterior y el nombre de la provincia comience por X
SELECT NombreProvincia FROM provincias
WHERE (SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Provincia = provincias.Provincia ) > 1 AND NombreProvincia LIKE 'S%'
GO

-- 10. Cual o cuales son los nombre de provincia con m�s contactos de la categor�a X
SELECT TOP 1 WITH TIES NombreProvincia FROM provincias
WHERE Provincia IN (SELECT Provincia FROM contactos WHERE Categoria = 'CUMP')
ORDER BY (SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Provincia = provincias.Provincia) DESC
GO

-- 11. Cual o cuales son los nombre de provincia  con contactos de la categor�a X y m�s de 1 contacto
SELECT NombreProvincia FROM provincias
WHERE Provincia IN (SELECT Provincia FROM contactos WHERE Categoria = 'CUMP') AND
(SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Provincia = provincias.Provincia) > 1
GO

-- 12. Visualiza todas las descripciones de categor�as con m�s de 1 contacto
SELECT Descripcion FROM categorias
WHERE Categoria IN (SELECT Categoria FROM contactos) AND
	(SELECT COUNT(id_contacto) FROM contactos WHERE categorias.Categoria = contactos.Categoria) > 1
GO

-- 13. Cuales son los nombres de provincias que tienen mas contactos que la cantidad de contactos de la provincia con codigo  X.
SELECT NombreProvincia FROM provincias
WHERE Provincia IN (SELECT Provincia FROM contactos) AND
	(SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Provincia = provincias.Provincia) > (SELECT COUNT(id_contacto) FROM contactos WHERE Provincia = 10)
GO

-- 14. Cuales son las poblaciones que tienen mas contactos que la cantidad de contactos de la poblaci�n  X.
SELECT Poblacion FROM contactos AS c1
WHERE Poblacion IS NOT NULL AND
	(SELECT COUNT(id_contacto) FROM contactos WHERE contactos.Poblacion = c1.Poblacion) > (SELECT COUNT(id_contacto) FROM contactos WHERE Poblacion = 'Tacoronte')
GO

-- 15. Visualiza la media de contactos por poblacion ( para ello tendr�s que calcular cuantos contactos tiene cada poblaci�n y a ese resultado aplicarle la media)
SELECT AVG(Total) AS [Media contactos por poblacion]
FROM
	(SELECT COUNT(id_contacto) AS Total
	FROM contactos GROUP BY Poblacion) AS [Cantidad contactos por poblacion]
GO

-- 16. Cuales son las poblaciones con mas contactos que la media de contactos por poblaci�n.
SELECT Poblacion
FROM contactos AS c
GROUP BY Poblacion
HAVING COUNT(id_contacto) > 	
		(SELECT AVG(Total)
		 FROM
			(SELECT COUNT(id_contacto) AS Total
			 FROM contactos GROUP BY Poblacion) AS [Cantidad contactos por poblacion])
GO