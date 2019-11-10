-- César Ravelo Martínez


-- #######################################################

--				EJERCICIO 3: BD GIMNASIO

-- #######################################################

-- Crea una base de datos llamada Gimnasio
-- Crea la tabla Actividades
-- En sql el boolean ponlo tipo bit. A los días de la semana ponles a todos valor por defecto 0

-- Crea la tabla socios. Dni tendrá constraint Unica ( no se podrá repetir el valor)
-- En cuota valor por defecto 50 y además no permitir que la cuota sea inferior a 50
-- Actividad será clave foránea de la tabla Actividades
-- Permitirá valores null la dirección, horario, foto y Observaciones, el resto de campos no lo permitirá.

-- Una vez tengamos esta base de datos creada vamos a hacerle modificaciones con alter table
-- A la tabla socio añade un campo llamado fechaAlta de tipo date con valor por defecto el día actual, 
-- no se permitirán valores mayores al día actual. Añade a la tabla socios fechaBaja de tipo date permitirá valor null.
-- Nunca podrá ser menoral día de hoy
-- Modificar el nombre del campo dni por dniSocio
-- Elimina el campo direcciónde la tabla socioElimina el campo foto de la tabla socios

CREATE DATABASE Gimnasio
GO

USE Gimnasio
GO

-- TABLA ACTIVIDADES(id_actividad)
CREATE TABLE actividades (id_actividad CHAR(5) CONSTRAINT pk_idActividad PRIMARY KEY,
						  descripcion VARCHAR(50),
						  lunes BIT CONSTRAINT df_lunes DEFAULT(0),
						  martes BIT CONSTRAINT df_martes DEFAULT(0),
						  miercoles BIT CONSTRAINT df_miercoles DEFAULT(0),
						  jueves BIT CONSTRAINT df_jueves DEFAULT(0),
						  viernes BIT CONSTRAINT df_viernes DEFAULT(0),
						  sabado BIT CONSTRAINT df_sabado DEFAULT(0),
						  domingo BIT CONSTRAINT df_domingo DEFAULT(0))
GO

-- TABLA SOCIOS(id_socio) -> actividades(id_actividad)
CREATE TABLE socios (id_socio INT IDENTITY(1, 1) CONSTRAINT pk_idsocio PRIMARY KEY NOT NULL,
					 nombre VARCHAR(20) NOT NULL,
					 apellidos VARCHAR(50) NOT NULL,
					 dni CHAR(9) CONSTRAINT u_dni UNIQUE NONCLUSTERED NOT NULL,
					 telefono CHAR(9) NOT NULL,
					 direccion VARCHAR(60) NULL,
					 cuota DECIMAL(5, 2) CONSTRAINT ck_cuota CHECK (cuota >= 50) CONSTRAINT df_cuota DEFAULT(50) NOT NULL,
					 actividad CHAR(5) CONSTRAINT fk_actividad FOREIGN KEY REFERENCES actividades(id_actividad) NOT NULL,
					 horario TIME NULL,
					 foto VARBINARY NULL,
					 observaciones TEXT NULL)
GO

-- MODIFICACIONES A LAS TABLAS

ALTER TABLE socios ADD fechaAlta DATE CONSTRAINT df_fechaAlta DEFAULT(GETDATE()) CONSTRAINT ck_fechaAlta CHECK(fechaAlta <= GETDATE())
GO

ALTER TABLE socios ADD fechaBaja DATE CONSTRAINT ck_fechaBaja CHECK(fechaBaja >= GETDATE()) NULL
GO

EXEC sp_rename 'socios.dni', 'dniSocio', 'COLUMN'
GO

ALTER TABLE socios DROP COLUMN direccion
GO

ALTER TABLE socios DROP COLUMN foto
GO