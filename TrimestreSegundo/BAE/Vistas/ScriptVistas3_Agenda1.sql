-- ###################################

--		  CREACIÓN VISTAS 3

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 05/03/2020

USE Agenda1
GO

-- 20. Sobre la vista anterior queremos conocer:
-- a) los datos del contacto con más edad
SELECT Nombre, Fechacumple FROM v_provincias19 ORDER BY Fechacumple
GO

-- b) Cual es el contacto o contactos que están más próximos a cumplir años
SELECT TOP 1 WITH TIES Nombre, (MONTH(Fechacumple) * DAY(EOMONTH(Fechacumple)) + DAY(Fechacumple)) - (MONTH(GETDATE()) * DAY(EOMONTH(GETDATE())) + DAY(GETDATE())) AS [Días Restantes] FROM v_provincias19 
WHERE (MONTH(Fechacumple) * DAY(EOMONTH(Fechacumple)) + DAY(Fechacumple)) - (MONTH(GETDATE()) * DAY(EOMONTH(GETDATE())) + DAY(GETDATE())) >= 0
ORDER BY [Días Restantes]
GO

-- c) Cual o cuales son la provincia con más contactos de la categoría X
SELECT TOP 1 WITH TIES NombreProvincia, COUNT(Nombre) AS Total FROM v_provincias19
WHERE Descripcion = 'Social'
GROUP BY NombreProvincia
ORDER BY Total DESC
GO

-- d) Cual o cuales son la provincia con contactos de la categoría X y más de 1 contacto
SELECT TOP 1 WITH TIES NombreProvincia, COUNT(Nombre) AS Total FROM v_provincias19
WHERE Descripcion = 'Social'
GROUP BY NombreProvincia
HAVING COUNT(Nombre) > 1
ORDER BY Total DESC
GO

-- e) Visualiza todos los contactos de más de 18 años
SELECT * FROM v_provincias19
WHERE YEAR(GETDATE()) - YEAR(Fechacumple) >= 19 OR 
	(YEAR(GETDATE()) - YEAR(Fechacumple) = 18 AND (MONTH(Fechacumple) * DAY(EOMONTH(Fechacumple)) + DAY(Fechacumple)) - (MONTH(GETDATE()) * DAY(EOMONTH(GETDATE())) + DAY(GETDATE())) <= 0)
GO
-- El criterio del WHERE busca aquellos que tengan cumplidos 19 o más años o los que cumplen este año 18 y ya fue su cumple

-- f) Visualiza todas las categorías con más de 1 contacto
SELECT Descripcion, COUNT(Nombre) AS [Total contactos] FROM v_provincias19
GROUP BY Descripcion
HAVING COUNT(Nombre) > 1
GO

-- g) Visualiza todas las categorías de más de 1 contacto que todos sean mayores de edad.
SELECT Descripcion FROM v_provincias19
WHERE YEAR(GETDATE()) - YEAR(Fechacumple) >= 19 OR 
	(YEAR(GETDATE()) - YEAR(Fechacumple) = 18 AND (MONTH(Fechacumple) * DAY(EOMONTH(Fechacumple)) + DAY(Fechacumple)) - (MONTH(GETDATE()) * DAY(EOMONTH(GETDATE())) + DAY(GETDATE())) <= 0)
GROUP BY Descripcion
HAVING COUNT(Nombre) > 1
GO

-- h) Cual es la población con menos contactos
SELECT TOP 1 Poblacion FROM v_provincias19
WHERE Poblacion IS NOT NULL
GROUP BY Poblacion
ORDER BY COUNT(Nombre)
GO

-- 21. Crea una vista que Visualice todas las categorías de más de 1 contacto que todos sean mayores de edad.
CREATE VIEW dbo.v_vistasagenda21 AS
	SELECT Descripcion FROM v_provincias19
	WHERE YEAR(GETDATE()) - YEAR(Fechacumple) >= 19 OR 
		(YEAR(GETDATE()) - YEAR(Fechacumple) = 18 AND (MONTH(Fechacumple) * DAY(EOMONTH(Fechacumple)) + DAY(Fechacumple)) - (MONTH(GETDATE()) * DAY(EOMONTH(GETDATE())) + DAY(GETDATE())) <= 0)
	GROUP BY Descripcion
	HAVING COUNT(Nombre) > 1
GO