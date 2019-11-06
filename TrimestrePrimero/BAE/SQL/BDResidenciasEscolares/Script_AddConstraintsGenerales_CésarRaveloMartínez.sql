USE BDResidenciasEscolares
GO

-- devuelve el listado de CONSTRAINTS definidas
-- EXEC sp_helpconstraint residencias
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
		ALTER TABLE residencias ADD CONSTRAINT fk_Residencias FOREIGN KEY REFERENCES universidades(codUniversidad)		
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
	END
GO