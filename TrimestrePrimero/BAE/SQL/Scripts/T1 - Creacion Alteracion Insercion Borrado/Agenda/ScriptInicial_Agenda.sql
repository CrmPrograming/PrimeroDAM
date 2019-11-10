CREATE DATABASE Agenda
GO

USE Agenda
GO

-- Creación de la tabla CONTACTOS
CREATE TABLE contactos (Id_contacto INTEGER IDENTITY(1, 2) CONSTRAINT pk_idcontacto PRIMARY KEY,
						Nombre VARCHAR(25),
						Apellidos VARCHAR(50),
						DNI VARCHAR(10),
						Telefono VARCHAR(12),
						Ecorreo VARCHAR(50),
						Fechacumple DATE NULL CONSTRAINT c_fechacumple CHECK (Fechacumple < '1/1/2010'),
						Direccion VARCHAR(50),
						Poblacion VARCHAR(50),
						Provincia INTEGER,
						Codpostal CHAR(5) CONSTRAINT d_codpostal DEFAULT('38700'),
						Categoria CHAR(4))

GO

-- Alters de la tabla CONTACTOS
-- Cambiar DNI a char de 10
ALTER TABLE contactos ALTER COLUMN DNI CHAR(10)
GO

-- Cambiar teléfono a char de 12
ALTER TABLE contactos ALTER COLUMN Telefono CHAR(12)
GO
-- Cambiar el nombre de codPostal a CodigoPostal
EXEC sp_rename 'contactos.Codpostal', 'CodigoPostal', 'COLUMN'
GO


-- Creación de la tabla CATEGOŔS

CREATE TABLE categorias(Categoria CHAR(4) CONSTRAINT pk_categoria PRIMARY KEY,
						Descripcion VARCHAR(50))
GO
 

 -- Creación de la tabla PROVINCIAS
 CREATE TABLE provincias(Provincia INTEGER IDENTITY(0, 5) CONSTRAINT pk_provincia PRIMARY KEY,
						 NombreProvincia VARCHAR(40)) 
 GO


 -- Establecer propiedades de los campos
 -- TABLA CONTACTOS

 ALTER TABLE contactos ALTER COLUMN Nombre VARCHAR(25) NOT NULL
 GO
 ALTER TABLE contactos ALTER COLUMN Apellidos VARCHAR(50) NOT NULL
 GO
 ALTER TABLE contactos ALTER COLUMN Categoria CHAR(4) NOT NULL
 GO

 -- Establecer las claves foráneas
 -- Las claves foráneas son
 -- Contactos.Provincia (Provincia)
 -- Contactos.Categoria (Categoria)

ALTER TABLE contactos ADD CONSTRAINT fk_provincia FOREIGN KEY (Provincia) REFERENCES provincias(Provincia)
 GO

ALTER TABLE contactos ADD CONSTRAINT fk_categoria FOREIGN KEY (Categoria) REFERENCES categorias(Categoria)
 GO

-- MODIFICACIONES EXTRA
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