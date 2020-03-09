-- ###################################

--		     SUBCONSULTAS 1

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 09/03/2020

USE Agenda1
GO

-- 1. Crea con subconsultas los contactos, con el nombre, apellidos y DNI, código de la provincia y el nombre de la provincia
SELECT Nombre, Apellidos, DNI, Provincia, (SELECT NombreProvincia FROM provincias WHERE contactos.Provincia = provincias.Provincia) AS [NombreProvincia] FROM contactos
GO

-- 2. Crea con subconsultas los contactos, con el nombre, apellidos y DNI, código de la categoria y el nombre de la categoria
SELECT Nombre, Apellidos, DNI, Categoria, (SELECT Descripcion FROM categorias WHERE contactos.Categoria = categorias.Categoria) AS [Descripcion] FROM contactos
GO

-- 3. Crea con subconsultas los contactos, con el nombre , apellidos y DNI, código de la categoria y el nombre de la categoria, código de la provincia y el nombre de la provincia
SELECT Nombre, Apellidos, DNI, Categoria, (SELECT Descripcion FROM categorias WHERE contactos.Categoria = categorias.Categoria) AS [Descripcion],
	Provincia, (SELECT NombreProvincia FROM provincias WHERE contactos.Provincia = provincias.Provincia) AS [NombreProvincia] FROM contactos
GO

-- 4. Visualiza con subconsultas todos los datos de los contactos de la provincia con nombre X
SELECT * FROM contactos
WHERE Provincia =
	(SELECT Provincia FROM provincias
	WHERE NombreProvincia = 'Santa Cruz de Tenerife')
GO

-- 5. Crea una consulta utilizando subconsultas con los nombres de las provincias en las que tengo contactos, sin repetir las provincias.
SELECT NombreProvincia FROM provincias
WHERE Provincia IN
	(SELECT DISTINCT Provincia FROM contactos)
GO