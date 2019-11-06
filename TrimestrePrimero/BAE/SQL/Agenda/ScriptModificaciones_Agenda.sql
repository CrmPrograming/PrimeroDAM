-- César Ravelo Martínez


-- #######################################################

--				   MODIFICACIÓN DATOS AGENDA

-- #######################################################

USE Agenda
GO

-- 1. A la tabla contactos añádele una restricción al código postal que todos los caracteres solo sean dígitos y siempre 5 dígitos
-- ALTER TABLE Contactos ADD CONSTRAINT c_codigopostal CHECK (CodigoPostal NOT LIKE '%[^0-9]%')
ALTER TABLE contactos ADD CONSTRAINT c_codigopostal CHECK (CodigoPostal LIKE '[0-9][0-9][0-9][0-9][0-9]')
GO

-- 2. Igual al teléfono pero 9 dígitos
ALTER TABLE contactos ALTER COLUMN Telefono CHAR(9)
GO
ALTER TABLE contactos ADD CONSTRAINT c_telefono CHECK (Telefono LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO

-- 3. Añade a contactos un campo llamado deuda que sea numérico entero con valor por defecto 0 y nunca podrá ser un número negativo
ALTER TABLE contactos ADD deuda INT CONSTRAINT c_deuda CHECK (deuda >= 0) CONSTRAINT d_deuda DEFAULT (0)
GO

-- 4. Inserta 5 registros en cada tabla
-- INSERTS CATEGORIAS
INSERT categorias VALUES ('SOCI', 'Social'),
						 ('CUMP', 'Cumpleaños'),
						 ('TENI', 'Clases de tenis'),
						 ('GIMN', 'Gimnasio'),
						 ('VIAJ', 'Viaje de negocio')
SELECT * FROM categorias
GO
-- INSERTS PROVINCIAS
INSERT provincias VALUES ('Santa Cruz de Tenerife'),
						 ('Las Palmas de Gran Canaria'),
						 ('Madrid'),
						 ('Barcelona'),
						 ('Valencia')
SELECT * FROM provincias
GO

-- INSERTS CONTACTOS
INSERT contactos VALUES ('Raul', 'Gonzales Blanco', '12121212W', '922121212', 'correo12@mail.com', '4/11/2009', NULL, NULL, 0, '12121', 'CUMP', 0),
						('Pedro', 'Martín', '23232323Z', '922232323', 'correo23@mail.com', '1/12/2009', 'Calle Oxígeno 23', NULL, 10, '23232', 'CUMP', 20),
						('María', 'Pérez', '34343434S', '922343434', 'correo34@mail.com', '21/07/2009', 'Calle Herradores', 'La Laguna', 0, '34343', 'TENI', 57),
						('Laura', 'Dolores', '45454545Y', '922454545', 'correo45@mail.com', '17/05/2002', NULL, 'La Guancha' , 0, DEFAULT, 'SOCI', 32),
						('Javier', 'Rodrigo', '56565656Z', '922565656', 'correo56@mail.com', '1/12/2009', 'Calle Alta 12', 'Tacoronte', 20, DEFAULT, 'SOCI', 11)
SELECT * FROM contactos
GO

-- 5. Inserta un contacto con código postal a1234
INSERT contactos VALUES ('ContCP', 'Contacto para CP a12345', '77777777H', '922777777', 'correo77@gmail.com', '17/7/2007', NULL, NULL, 15, 'a1234', 'VIAJ', 23)
SELECT * FROM contactos
GO
-- Al intentar crear el contacto con código postal a1234, se produce un error por la constraint c_codigopostal (sólo valores numéricos)

-- 6. Inserta un contacto con deuda -100
INSERT contactos VALUES ('ContCP', 'Contacto para CP a12345', '77777777H', '922777777', 'correo77@gmail.com', '17/7/2007', NULL, NULL, 15, '77777', 'VIAJ', -100)
SELECT * FROM contactos
GO
-- Al intentar crear el contacto con deuda -100, se produce un error por la constraint c_deuda (sólo deudas positivas)

-- 7. Inserta un contacto con el valor de deuda  el de por defecto
INSERT contactos VALUES ('Defusu', 'Usuario Default Deuda', '77777777D', '922777777', 'correo77def@mail.com', '4/11/2009', NULL, NULL, 0, '12121', 'CUMP', DEFAULT)
SELECT * FROM contactos
GO

-- 8. Asígnale al código postal un valor por defecto de 38000
-- Dado que el atributo CodigoPostal ya tiene una constraint de default (38700), 
-- tenemos primero que borrar la anterior constraint
ALTER TABLE contactos DROP CONSTRAINT d_codpostal
GO
ALTER TABLE contactos ADD CONSTRAINT df_codigopostal DEFAULT ('38000') FOR CodigoPostal
GO

-- 9. Inserta un contacto con fecha de cumple 10/10/2010 ( que ocurre)
INSERT contactos VALUES ('Error', 'Usuario Error Fecha', '77777777D', '922777777', 'correo77def@mail.com', '10/10/2010', NULL, NULL, 0, '12121', 'CUMP', DEFAULT)
GO
-- Se produce un error debido a la restricción de check c_fechacumple la cual impide que las fechas sean mayores al 1/1/2010

-- 10. Modifica al contacto x la fecha de cumple
SELECT * FROM contactos
UPDATE contactos SET Fechacumple = '1990-04-21' WHERE Id_contacto = 15
SELECT * FROM contactos
GO

-- 11. Modíficale al contacto x la provincia, la categoría y el código postal
SELECT * FROM contactos
SELECT * FROM categorias 
SELECT * FROM provincias
UPDATE contactos SET Provincia = 15, Categoria = 'SOCI', CodigoPostal = '38777' WHERE Id_contacto = 15
SELECT * FROM contactos
GO

-- 12. A todos los contactos de la categoría X descuéntales la deuda en un 20 %, pero solo a los que tengan alguna deuda, si la deuda es 0 a esos no le descuentes nada.
SELECT * FROM contactos
UPDATE contactos SET deuda = deuda - (deuda * 0.2) WHERE Categoria = 'CUMP' AND deuda > 0
SELECT * FROM contactos
GO

-- 13. Crea la tabla contactos_copia que tendrá la misma estructura que la tabla contactos y no tendrá ningun registro
-- Utilizamos SELECT * INTO para crear la tabla contactos_copia usando un criterio falso para que no incluya registros
SELECT * INTO contactos_copia FROM contactos WHERE 2 = 1
SELECT * FROM contactos_copia
GO

-- 14. Insertale los contactos que están en la tabla contactos los que no tengan deuda.
INSERT contactos_copia SELECT Nombre, Apellidos, DNI, Telefono, Ecorreo, Fechacumple, Direccion, Poblacion, Provincia, CodigoPostal, Categoria, deuda FROM contactos WHERE deuda = 0
SELECT * FROM contactos_copia
GO

-- 15. Visualiza de la tabla contactos_copia aquellos que  pertenezcan a la categoria x o y. Para ello usa la sentenciaselect * from tabla where ....
SELECT * FROM contactos_copia WHERE Categoria = 'CUMP' OR Categoria = 'GIMN'
GO

-- 16. Elimina de la tabla contactos _copia aquellos que  pertenezcan a la categoria x o y
SELECT * FROM contactos_copia
DELETE contactos_copia WHERE Categoria = 'GIMN' OR Categoria = 'CUMP'
SELECT * FROM contactos_copia
GO

-- 17. Visualiza de la tabla contactos_copia aquellos que  pertenezcan a la categoria x  e  y. Para ello usa la sentencia select * from tabla where ....
SELECT * FROM contactos_copia WHERE Categoria = 'CUMP' AND Categoria = 'GIMN'
GO

-- 18. Elimina de la tabla contactos _copia aquellos que  pertenezcan a la categoria x  e  y
SELECT * FROM contactos_copia
DELETE contactos_copia WHERE Categoria = 'GIMN' AND Categoria = 'CUMP'
SELECT * FROM contactos_copia
GO

-- 19. Visualiza de la tabla contactos_copia aquellos que  no pertenezcan a la categoria x. Para ello usa la sentencia select * from tabla where ....
SELECT * FROM contactos_copia WHERE Categoria <> 'GIMN'
GO

-- 20. Elimina de la tabla contactos _copia aquellos que  no pertenezcan a la categoria x
SELECT * FROM contactos_copia
DELETE FROM contactos_copia WHERE Categoria <> 'GIMN'
SELECT * FROM contactos_copia
GO

-- 21. Inserta un registro en la tabla contactos_copia
INSERT INTO contactos_copia VALUES ('Raul', 'Gonzales Blanco', '12121212W', '922121212', 'correo12@mail.com', '4/11/2009', NULL, NULL, 0, '12121', 'CUMP', 0)
SELECT * FROM contactos_copia
GO