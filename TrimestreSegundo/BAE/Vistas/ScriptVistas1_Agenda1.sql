USE Agenda1
GO

-- 1. Crea una vista con los contactos, con el nombre, apellidos y DNI, código de la provincia. Visualízalo ordenado por apellidos
CREATE VIEW dbo.v_contactos AS
	SELECT Nombre, Apellidos, DNI, Provincia FROM contactos
GO

SELECT * FROM v_contactos ORDER BY Apellidos
GO

-- 2. Igual al anterior pero le vamos a añadir el nombre de la provincia
ALTER VIEW dbo.v_contactos AS
	SELECT Nombre, Apellidos, DNI, provincias.Provincia, provincias.NombreProvincia FROM contactos
	INNER JOIN provincias ON contactos.Provincia = provincias.Provincia
GO

SELECT * FROM v_contactos ORDER BY Apellidos
GO

-- 3. Al primero le añadiremos la categoría y el nombre de la categoría
ALTER VIEW dbo.v_contactos AS
	SELECT Nombre, Apellidos, DNI, Provincia, contactos.Categoria, categorias.Descripcion FROM contactos
	INNER JOIN categorias ON categorias.Categoria = contactos.Categoria
GO

SELECT * FROM v_contactos ORDER BY Apellidos
GO

-- 4. Al ejercicio anterior le añadiremos el código de la provincia y el nombre de la provincia.
ALTER VIEW dbo.v_contactos AS
	SELECT Nombre, Apellidos, DNI, provincias.Provincia, provincias.NombreProvincia, contactos.Categoria, categorias.Descripcion FROM contactos
	INNER JOIN categorias ON categorias.Categoria = contactos.Categoria
	INNER JOIN provincias ON contactos.Provincia = provincias.Provincia
GO

SELECT * FROM v_contactos ORDER BY Apellidos
GO

-- 5. Crea una vista que visualice los 3 primeros contactos por orden alfabético de los apellidos.
CREATE VIEW dbo.v_contactos2 AS
	SELECT TOP 3 * FROM contactos ORDER BY Apellidos
GO

SELECT * FROM v_contactos2
GO

-- 6. Crea una vista de los contactos los campos nombre, apellido, teléfono, ecorreo al campo ecorreo queremos que se visualice como email. (Hazlo de dos formas)
CREATE VIEW dbo.v_contactos3 AS
	SELECT Nombre, Apellidos, Telefono, Ecorreo AS email FROM contactos
GO

SELECT * FROM v_contactos3
GO

ALTER VIEW dbo.v_contactos3 (Nombre, Apellidos, Telefono, email) AS
	SELECT Nombre, Apellidos, Telefono, Ecorreo FROM contactos
GO

SELECT * FROM v_contactos3
GO

-- 7. Visualiza todas las dependencias de la ultima vista creada.
EXEC sp_depends v_contactos3
GO

-- 8. Haz una vista con todos los contactos de la provincia X
CREATE VIEW dbo.v_contactos4 AS
	SELECT * FROM contactos WHERE Provincia = 10
GO

SELECT * FROM v_contactos4
GO

-- 9. Añádele 10 a todos los contactos de la provincia X, utiliza la vista anterior.
SELECT * FROM v_contactos4
GO

UPDATE v_contactos4 SET deuda = deuda + 10 WHERE Provincia = 0
GO

SELECT * FROM v_contactos4
GO

-- 10. Réstale 20 a todos los contactos de la provincia Y, utiliza la vista del ejercicio 6.
SELECT * FROM v_contactos2
GO

UPDATE v_contactos2 SET deuda = deuda - 20 WHERE Provincia = 10

SELECT * FROM v_contactos2
GO

-- 11. Modifica la vista del ejercicio 6 añadiéndole el with check option. Vuelve a ejecutar el ejercicio 7 y el 8
ALTER VIEW dbo.v_contactos3 (Nombre, Apellidos, Telefono, email) AS
	SELECT Nombre, Apellidos, Telefono, Ecorreo FROM contactos
WITH CHECK OPTION
GO

-- ?????
EXEC sp_depends v_contactos3
GO

-- ?????
CREATE VIEW dbo.v_contactos4 AS
	SELECT * FROM contactos WHERE Provincia = 10
GO

-- 12. Crea una vista con todas las provincias sus códigos y sus descripciones.
-- Hazla con select *., Añádele a la tabla provincias un atributo que sea numhabitantes entero. Visualiza la vista. Modifica la vista ponle la opción
-- with schemabinding. Añádele a la tabla provincias un campo capital de hasta 20 caracteres.

CREATE VIEW dbo.v_contactos5 AS
	SELECT * FROM provincias
GO

SELECT * FROM v_contactos5
GO

ALTER TABLE provincias