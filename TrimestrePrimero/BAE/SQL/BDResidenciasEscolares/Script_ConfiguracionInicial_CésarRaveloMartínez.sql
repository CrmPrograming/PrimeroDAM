-- César Ravelo Martínez

CREATE DATABASE BDResidenciasEscolares
GO
USE BDResidenciasEscolares
GO

-- TABLA UNIVERSIDADES (PRIMARY KEY(codUniversidad))
IF OBJECT_ID ('dbo.universidades') IS NOT NULL
	BEGIN
		DROP TABLE dbo.universidades
	END
GO
CREATE TABLE universidades (codUniversidad CHAR(6) CONSTRAINT pk_Universidades PRIMARY KEY,
							nomUniversidad VARCHAR(30) NOT NULL)
GO

-- Equivalente a hacerlo así:
-- CREATE TABLE universidades (codUniversidad CHAR(6),
--							nomUniversidad VARCHAR(30) NOT NULL,
--							CONSTRAINT pk_Universidades PRIMARY KEY(codUniversidad))
-- O
--
-- ALTER TABLE universidades ADD CONSTRAINT pk_Universidades PRIMARY KEY (codUniversidad)

-- TABLA RESIDENCIAS (REFERENCES universidades(codUniversidad))
IF OBJECT_ID ('dbo.residencias') IS NOT NULL
	BEGIN
		DROP TABLE dbo.residencias
	END
GO
CREATE TABLE residencias (codResidencia INT IDENTITY(1, 1), 
						  nomResidencia VARCHAR(30) NOT NULL,
						  codUniversidad CHAR(6) CONSTRAINT fk_Residencias FOREIGN KEY REFERENCES universidades(codUniversidad),
						  precioMensual INT NULL,
						  comedor BIT,
						  CONSTRAINT pk_Residencias PRIMARY KEY(codResidencia))
GO

-- TABLA ESTUDIANTES (PRIMARY KEY(codEstudiante))
IF OBJECT_ID ('dbo.estudiantes') IS NOT NULL
	BEGIN
		DROP TABLE dbo.estudiantes
	END
GO
CREATE TABLE estudiantes (codEstudiante INT,
						  nomEstudiante VARCHAR(50) NOT NULL,
						  dni CHAR(9),
						  telefonoEstudiante CHAR(9),
						  CONSTRAINT pk_Estudiantes PRIMARY KEY(codEstudiante))
GO

-- TABLA ESTANCIAS (PRIMARY KEY (codEstudiante, codResidencia, fechaInicio))
IF OBJECT_ID ('dbo.estancias') IS NOT NULL
	BEGIN
		DROP TABLE dbo.estancias
	END
GO
CREATE TABLE estancias (codEstudiante INT,
						codResidencia INT,
						fechaInicio DATE,
						fechaFin DATE,
						preciopagado INT,
						CONSTRAINT pk_Estancias PRIMARY KEY(codEstudiante, codResidencia, fechaInicio),
						CONSTRAINT fk_Estancias_Estudiante FOREIGN KEY(codEstudiante) REFERENCES estudiantes,
						CONSTRAINT fk_Estancias_Residencia FOREIGN KEY(codResidencia) REFERENCES residencias)
GO

-- #######################################################

--		DECLARACIÓN DE CONSTRAINTS CON ALTER TABLE

-- #######################################################

-- devuelve el listado de CONSTRAINTS definidas
-- EXEC sp_helpconstraint estancias
-- GO

-- Borrar constraint
-- ALTER TABLE universidades DROP CONSTRAINT pk_Universidades

IF OBJECT_ID ('dbo.[pc_Universidades]', 'C') IS NULL
	BEGIN
		ALTER TABLE universidades ADD CONSTRAINT pk_Universidades PRIMARY KEY (codUniversidad)
	END
GO

IF (OBJECT_ID ('dbo.[fk_Residencias]', 'C') IS NULL) AND (OBJECT_ID ('dbo.[pk_Residencias]', 'C') IS NULL)
	BEGIN
		ALTER TABLE residencias ADD CONSTRAINT fk_Residencias FOREIGN KEY(codUniversidad) REFERENCES universidades(codUniversidad)		
		ALTER TABLE residencias ADD CONSTRAINT pk_Residencias PRIMARY KEY(codResidencia)
	END
GO

IF OBJECT_ID ('dbo.[pk_Estudiantes]', 'C') IS NULL
	BEGIN
		ALTER TABLE estudiantes ADD CONSTRAINT pk_Estudiantes PRIMARY KEY(codEstudiante)
	END
GO

IF OBJECT_ID ('dbo.[pk_Estancias]', 'C') IS NULL
	BEGIN
		ALTER TABLE estancias ADD CONSTRAINT pk_Estancias PRIMARY KEY(codEstudiante, codResidencia, fechaInicio)
		ALTER TABLE estancias ADD CONSTRAINT fk_Estancias_Estudiante FOREIGN KEY(codEstudiante) REFERENCES estudiantes(codEstudiante)
		ALTER TABLE estancias ADD CONSTRAINT fk_Estancias_Residencia FOREIGN KEY(codResidencia) REFERENCES residencias(codResidencia)
	END
GO