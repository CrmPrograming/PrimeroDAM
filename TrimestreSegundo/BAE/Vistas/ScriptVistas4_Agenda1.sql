-- ###################################

--		  CREACIÓN VISTAS 4

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 06/03/2020

USE Agenda1
GO

-- 22. Crea una vista con los nombres de las poblaciones en las que tengo contactos, sin repetir las poblaciones.
CREATE VIEW dbo.v_agenda22 AS
	SELECT DISTINCT Poblacion FROM contactos
	WHERE Poblacion IS NOT NULL
GO

SELECT * FROM v_agenda22
GO

-- 23. Crea una vista con los nombres de las categorías en las que no tengo ningún contacto.
CREATE VIEW dbo.v_agenda23 AS
	SELECT DISTINCT ca.Descripcion FROM categorias AS ca
		LEFT JOIN contactos AS c ON ca.Categoria = c.Categoria
	WHERE c.id_contacto IS NULL
GO

SELECT * FROM v_agenda23
GO

-- 24. Crea una vista con los nombres de las categorías y la cantidad de contactos en cada una de las categorías
CREATE VIEW dbo.v_agenda24 AS
	SELECT ca.Descripcion, COUNT(c.id_contacto) AS [Total Contactos] FROM categorias AS ca
		LEFT JOIN contactos AS c ON ca.Categoria = c.Categoria
	GROUP BY ca.Descripcion
GO

SELECT * FROM v_agenda24
GO

-- 25. Crea  una vista  que visualice los nombres de todas aquellas categorías que tengan más de 1 contacto.
CREATE VIEW dbo.v_agenda25 AS
	SELECT ca.Descripcion, COUNT(c.id_contacto) AS [Total Contactos] FROM categorias AS ca
		INNER JOIN contactos AS c ON ca.Categoria = c.Categoria
	GROUP BY ca.Descripcion
	HAVING COUNT(c.id_contacto) > 1
GO

SELECT * FROM v_agenda25
GO

-- 26. Crea una vista que visualice los nombres de todas aquellas categorías que tengan más de 1 contacto y que los contactos pertenezcan a la provincia con nombre X
CREATE VIEW dbo.v_agenda26 AS	
	SELECT ca.Descripcion, COUNT(c.id_contacto) AS [Total Contactos] FROM categorias AS ca
		INNER JOIN contactos AS c ON ca.Categoria = c.Categoria
		INNER JOIN provincias AS p ON c.Provincia = p.Provincia
	WHERE p.NombreProvincia LIKE 'S%'
	GROUP BY ca.Descripcion
	HAVING COUNT(c.id_contacto) > 1
GO

SELECT * FROM v_agenda26
GO

-- 27. Cual o cuales son la provincia con más contactos de la categoría X
CREATE VIEW dbo.v_agenda27 AS
	SELECT TOP 1 WITH TIES p.NombreProvincia, COUNT(c.id_contacto) AS Total FROM provincias AS p
		INNER JOIN contactos AS c ON p.Provincia = c.Provincia
	WHERE c.Categoria = 'CUMP'
	GROUP BY p.NombreProvincia
	ORDER BY COUNT(c.id_contacto) DESC
GO

SELECT * FROM v_agenda27
GO

-- 28. Cual o cuales son la provincia con contactos de la categoría X y más de 1 contacto
CREATE VIEW dbo.v_agenda28 AS
	SELECT TOP 1 WITH TIES p.NombreProvincia, COUNT(c.id_contacto) AS Total FROM provincias AS p
		INNER JOIN contactos AS c ON p.Provincia = c.Provincia
	WHERE c.Categoria = 'CUMP'
	GROUP BY p.NombreProvincia
	HAVING COUNT(c.id_contacto) > 1
	ORDER BY COUNT(c.id_contacto) DESC
GO

SELECT * FROM v_agenda28
GO

-- 29. Visualiza todas las categorías de más de 1 contacto que todos sean mayores de edad.
SELECT Descripcion FROM categorias AS ca
	INNER JOIN contactos AS c ON ca.Categoria = c.Categoria
	INNER JOIN provincias AS p ON c.Provincia = p.Provincia
WHERE YEAR(GETDATE()) - YEAR(Fechacumple) >= 19 OR 
	(YEAR(GETDATE()) - YEAR(Fechacumple) = 18 AND (MONTH(Fechacumple) * DAY(EOMONTH(Fechacumple)) + DAY(Fechacumple)) - (MONTH(GETDATE()) * DAY(EOMONTH(GETDATE())) + DAY(GETDATE())) <= 0)
GROUP BY Descripcion
HAVING COUNT(Nombre) > 1
GO

-- 30. Cual es la provincia con mas contactos mayores de edad
SELECT TOP 1 NombreProvincia, COUNT(id_contacto) AS Total FROM categorias AS ca
	INNER JOIN contactos AS c ON ca.Categoria = c.Categoria
	INNER JOIN provincias AS p ON c.Provincia = p.Provincia
WHERE YEAR(GETDATE()) - YEAR(Fechacumple) >= 19 OR 
	(YEAR(GETDATE()) - YEAR(Fechacumple) = 18 AND (MONTH(Fechacumple) * DAY(EOMONTH(Fechacumple)) + DAY(Fechacumple)) - (MONTH(GETDATE()) * DAY(EOMONTH(GETDATE())) + DAY(GETDATE())) <= 0)
GROUP BY NombreProvincia
ORDER BY COUNT(id_contacto) DESC
GO

-- 31. Cual es la categoría con mas contactos mayores de edad
SELECT TOP 1 Descripcion, COUNT(id_contacto) AS Total FROM categorias AS ca
	INNER JOIN contactos AS c ON ca.Categoria = c.Categoria
	INNER JOIN provincias AS p ON c.Provincia = p.Provincia
WHERE YEAR(GETDATE()) - YEAR(Fechacumple) >= 19 OR 
	(YEAR(GETDATE()) - YEAR(Fechacumple) = 18 AND (MONTH(Fechacumple) * DAY(EOMONTH(Fechacumple)) + DAY(Fechacumple)) - (MONTH(GETDATE()) * DAY(EOMONTH(GETDATE())) + DAY(GETDATE())) <= 0)
GROUP BY Descripcion
ORDER BY COUNT(id_contacto) DESC
GO