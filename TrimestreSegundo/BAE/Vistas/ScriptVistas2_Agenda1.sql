-- ###################################

--		  CREACIÓN VISTAS 2

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 03/03/2020

USE Agenda1
GO

-- 14. Crea una vista con los nombres de las provincias en las que tengo contactos, sin repetir las provincias.
CREATE VIEW dbo.v_provincias14
AS
	SELECT DISTINCT provincias.NombreProvincia FROM provincias
	INNER JOIN contactos ON contactos.Provincia = provincias.Provincia
GO

SELECT * FROM v_provincias14
GO

-- 15. Crea una vista con los nombres de las provincias en las que no tengo ningún contacto.
CREATE VIEW dbo.v_provincias15
AS
	SELECT DISTINCT provincias.NombreProvincia FROM provincias
	LEFT JOIN contactos ON contactos.Provincia = provincias.Provincia
	WHERE contactos.Id_contacto IS NULL
GO

SELECT * FROM v_provincias15
GO

-- 16. Crea una vista con los nombres de las provincias y la cantidad de contactos en cada una de las provincias
CREATE VIEW dbo.v_provincias16
AS
	SELECT provincias.NombreProvincia, COUNT(contactos.id_contacto) AS [Total Contactos]
	FROM provincias
	INNER JOIN contactos ON contactos.Provincia = provincias.Provincia
	GROUP BY provincias.NombreProvincia
GO

SELECT * FROM v_provincias16
GO

-- 17. Igual al anterior pero solo de aquellas provincias que tengan más de 1 contacto.
CREATE VIEW dbo.v_provincias17
AS
	SELECT provincias.NombreProvincia, COUNT(contactos.id_contacto) AS [Total Contactos]
	FROM provincias
	INNER JOIN contactos ON contactos.Provincia = provincias.Provincia
	GROUP BY provincias.NombreProvincia
	HAVING COUNT(contactos.id_contacto) > 1
GO

SELECT * FROM v_provincias17
GO

-- 18. Igual al anterior y el nombre de la provincia comience por X
CREATE VIEW dbo.v_provincias18
AS
	SELECT provincias.NombreProvincia, COUNT(contactos.id_contacto) AS [Total Contactos]
	FROM provincias	
	INNER JOIN contactos ON contactos.Provincia = provincias.Provincia
	WHERE provincias.NombreProvincia LIKE 'S%'
	GROUP BY provincias.NombreProvincia
	HAVING COUNT(contactos.id_contacto) > 1
GO

SELECT * FROM v_provincias18
GO

-- 19. Crea una vista con Nombre, apellidos, fechacumple, población, nombre provincia y nombre de categoría.
CREATE VIEW dbo.v_provincias19
AS
	SELECT c.Nombre, c.Apellidos, c.Fechacumple, c.Poblacion, p.NombreProvincia, ca.Descripcion
	FROM categorias AS ca
	INNER JOIN contactos AS c ON ca.Categoria = c.Categoria
	INNER JOIN provincias AS p ON c.Provincia = p.Provincia
GO

SELECT * FROM v_provincias19
GO