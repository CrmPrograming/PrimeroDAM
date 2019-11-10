
-- #######################################################

--				EJERCICIO 2: ALTERAR TABLAS

-- #######################################################

USE  BDResidenciasEscolares
GO

-- TABLA UNIVERSIDADES

ALTER TABLE universidades ADD sede VARCHAR(60), telefono CHAR(9)
GO

ALTER TABLE universidades ADD CONSTRAINT ck_telefono CHECK(telefono NOT LIKE '%[^0-9]%')
GO 

-- TODO: CONSTRAINT CHECK Todos los caracteres sean dígitos

-- TABLA RESIDENCIAS

ALTER TABLE residencias ADD CONSTRAINT df_PrecioMensual DEFAULT(900) FOR precioMensual
GO

ALTER TABLE residencias ADD CONSTRAINT ck_PrecioMensual CHECK (precioMensual >= 50 AND precioMensual <= 2000)
GO

ALTER TABLE residencias ADD CONSTRAINT df_Comedor DEFAULT(0) FOR comedor
GO

ALTER TABLE residencias ADD cantidadPlazas INT NOT NULL CONSTRAINT ck_cantidadPlazas CHECK (cantidadPlazas >= 1 AND cantidadPlazas <= 1000)
GO

ALTER TABLE residencias ADD nombreDirector VARCHAR(40) NULL
GO

ALTER TABLE residencias ADD genero CHAR(9) CONSTRAINT ck_genero CHECK (genero IN ('mixto', 'masculino', 'femenino')), 
										   CONSTRAINT df_genero DEFAULT ('mixto') FOR genero
GO

-- TABLA ESTUDIANTES

ALTER TABLE estudiantes ADD CONSTRAINT u_dni UNIQUE NONCLUSTERED(dni)
GO

ALTER TABLE estudiantes ALTER COLUMN telefonoEstudiante CHAR(9) NOT NULL
GO

ALTER TABLE estudiantes ADD CONSTRAINT u_telefonoEstudiante UNIQUE NONCLUSTERED(telefonoEstudiante)
GO

ALTER TABLE estudiantes ADD CONSTRAINT c_telefonoEstudiante CHECK(telefonoEstudiante NOT LIKE '%[^0-9]%')
GO

ALTER TABLE estudiantes ADD correo VARCHAR(30)
GO

ALTER TABLE estudiantes ADD direccion VARCHAR(60) NULL
GO

ALTER TABLE estudiantes ADD sexo CHAR(1) CONSTRAINT ck_sexo CHECK (sexo IN ('M', 'F'))
GO


-- TABLA ESTANCIAS
ALTER TABLE estancias ADD observaciones TEXT NULL
GO

ALTER TABLE estancias ADD numhabitacion TINYINT CONSTRAINT df_numhabitacion DEFAULT(0)
GO


-- EJERCICIOS EXTRA

ALTER TABLE estudiantes DROP COLUMN direccion
GO 

EXEC sp_rename 'universidades.sede', 'direccion', 'COLUMN'
GO

ALTER TABLE universidades DROP COLUMN direccion
GO 

EXEC sp_rename 'estudiantes.correo', 'email', 'COLUMN'
GO

-- ESTABLECE TODAS LAS CLAVES FORANEAS (HECHO EN EL ANTERIOR SCRIPT)