-- ###################################

--		  CREACI�N VISTAS 1

-- ###################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 03/03/2020

USE Agenda1
GO

-- 1. Crea una vista con los contactos, con el nombre, apellidos y DNI, c�digo de la provincia. Visual�zalo ordenado por apellidos
CREATE VIEW dbo.v_contactos AS
	SELECT Nombre, Apellidos, DNI, Provincia FROM contactos
GO

SELECT * FROM v_contactos ORDER BY Apellidos
GO

-- 2. Igual al anterior pero le vamos a a�adir el nombre de la provincia
ALTER VIEW dbo.v_contactos AS
	SELECT Nombre, Apellidos, DNI, provincias.Provincia, provincias.NombreProvincia FROM contactos
	INNER JOIN provincias ON contactos.Provincia = provincias.Provincia
GO

SELECT * FROM v_contactos ORDER BY Apellidos
GO

-- 3. Al primero le a�adiremos la categor�a y el nombre de la categor�a
ALTER VIEW dbo.v_contactos AS
	SELECT Nombre, Apellidos, DNI, Provincia, contactos.Categoria, categorias.Descripcion FROM contactos
	INNER JOIN categorias ON categorias.Categoria = contactos.Categoria
GO

SELECT * FROM v_contactos ORDER BY Apellidos
GO

-- 4. Al ejercicio anterior le a�adiremos el c�digo de la provincia y el nombre de la provincia.
ALTER VIEW dbo.v_contactos AS
	SELECT Nombre, Apellidos, DNI, provincias.Provincia, provincias.NombreProvincia, contactos.Categoria, categorias.Descripcion FROM contactos
	INNER JOIN categorias ON categorias.Categoria = contactos.Categoria
	INNER JOIN provincias ON contactos.Provincia = provincias.Provincia
GO

SELECT * FROM v_contactos ORDER BY Apellidos
GO

-- 5. Crea una vista que visualice los 3 primeros contactos por orden alfab�tico de los apellidos.
CREATE VIEW dbo.v_contactos2 AS
	SELECT TOP 3 * FROM contactos ORDER BY Apellidos
GO

SELECT * FROM v_contactos2
GO

-- 6. Crea una vista de los contactos los campos nombre, apellido, tel�fono, ecorreo al campo ecorreo queremos que se visualice como email. (Hazlo de dos formas)
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

-- 9. A��dele 10 a todos los contactos de la provincia X, utiliza la vista anterior.
SELECT * FROM v_contactos4
GO

UPDATE v_contactos4 SET deuda = deuda + 10
GO

SELECT * FROM v_contactos4
GO

-- 10. R�stale 20 a todos los contactos de la provincia Y, utiliza la vista del ejercicio 6.
SELECT * FROM v_contactos2
GO

UPDATE v_contactos2 SET deuda = deuda - 20 WHERE Provincia = 10

SELECT * FROM v_contactos2
GO

-- 11. Modifica la vista del ejercicio 8 a�adi�ndole el with check option. Vuelve a ejecutar el ejercicio 7 y el 8
ALTER VIEW dbo.v_contactos4 AS
	SELECT * FROM contactos WHERE Provincia = 10
WITH CHECK OPTION
GO

-- Al intentar actualizar la Provincia, no se puede realizar debido al WITH CHECK OPTION
UPDATE v_contactos4 SET Provincia = 20
GO

-- 12. Crea una vista con todas las provincias sus c�digos y sus descripciones.
-- Hazla con select *., A��dele a la tabla provincias un atributo que sea numhabitantes entero. Visualiza la vista. Modifica la vista ponle la opci�n
-- with schemabinding. A��dele a la tabla provincias un campo capital de hasta 20 caracteres.

CREATE VIEW dbo.v_provincias AS
	SELECT * FROM provincias
GO

SELECT * FROM v_provincias
GO

-- A�adimos la nueva columna numhabitantes
ALTER TABLE provincias ADD numhabitantes INT
GO

-- Visualizamos la vista tanto con select como con exec
SELECT * FROM v_provincias
GO

EXEC sp_helptext v_provincias
GO

-- Modificamos la vista con la opci�n schemabinding (en este caso no podemos usar SELECT * con SCHEMABINDING)
ALTER VIEW dbo.v_provincias
WITH SCHEMABINDING
AS
	SELECT Provincia, NombreProvincia, numhabitantes FROM dbo.provincias
GO

SELECT * FROM v_provincias
GO

-- A��dele a la tabla provincias un campo capital de hasta 20 caracteres.
ALTER TABLE provincias ADD capital VARCHAR(20)
GO

SELECT * FROM provincias
GO

SELECT * FROM v_provincias
GO

-- Como podemos ver, al a�adir campos a la tabla si no actualizamos la vista, no
-- se ver�n las nuevas columnas


-- 13. Crea una vista con todas las Categorias. Visualiza el texto de la vista. Ejecuta la vista.
-- Modifica la vista a�adi�ndole with encryption, visualiza el texto de la vista, ejecuta la vista.

CREATE VIEW dbo.v_categorias AS
	SELECT * FROM dbo.categorias
GO

EXEC sp_helptext v_categorias
GO

SELECT * FROM v_categorias
GO

ALTER VIEW dbo.v_categorias
WITH ENCRYPTION
AS
	SELECT * FROM categorias
GO

EXEC sp_helptext v_categorias
GO
-- Al intentar mostrar el texto de la vista, �ste se encuentra cifrado luego no se puede mostrar

SELECT * FROM v_categorias
GO