-- ###################################

--		    DESENCADENADORES 6

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 06/06/2020

USE BDResidenciasEscolares_prueba
GO

-- 23. Hacer un registro de log, Cada vez que insertemos, eliminemos o actualicemos algún estudiante en otra tabla llamada estudiantesLog
-- que tiene todos los mismos registros de profesor y además el dia y hora de inserción, borrado o actualización y otro campo donde se
-- indica la operación realizada y otro mas indicando el usuario que lo ha realizado, el del sistema. Deberá funcionar para uno y para varios registros.

CREATE TABLE estudiantesLog(
	codEstudiante INT NOT NULL,
	nomEstudiante varchar(50) NOT NULL,
	dni CHAR(9) NULL,
	telefonoEstudiante CHAR(9) NULL,
	email VARCHAR(30) NULL,
	sexo CHAR(1) NULL,
	fechaOperacion DATETIME NOT NULL,
	operacion CHAR(1),
	usuario VARCHAR(30),
	CONSTRAINT pk_estudiantesLog PRIMARY KEY(codEstudiante, fechaOperacion)
)
GO

CREATE TRIGGER tr_logEstudiantes
ON estudiantes
FOR INSERT, UPDATE, DELETE
AS
	-- Delete
	IF (EXISTS(SELECT * FROM deleted) AND NOT EXISTS(SELECT * FROM inserted))
		INSERT estudiantesLog SELECT codEstudiante, nomEstudiante, dni, telefonoEstudiante, email, sexo, GETDATE(), 'D', user FROM deleted
	-- Update
	ELSE IF (EXISTS(SELECT * FROM deleted) AND EXISTS(SELECT * FROM inserted))
		INSERT estudiantesLog SELECT codEstudiante, nomEstudiante, dni, telefonoEstudiante, email, sexo, GETDATE(), 'U', user FROM inserted
	-- Insert
	ELSE
		INSERT estudiantesLog SELECT codEstudiante, nomEstudiante, dni, telefonoEstudiante, email, sexo, GETDATE(), 'I', user FROM inserted
GO

SELECT * FROM estudiantes
SELECT * FROM estudiantesLog
INSERT estudiantes VALUES (78, 'Estudiante Falso', '1234567-T', '777777777', NULL, 'F')
SELECT * FROM estudiantes
SELECT * FROM estudiantesLog
UPDATE estudiantes SET email = NULL WHERE codEstudiante > 10
SELECT * FROM estudiantes
SELECT * FROM estudiantesLog
DELETE FROM estudiantes WHERE codEstudiante > 10
SELECT * FROM estudiantes
SELECT * FROM estudiantesLog
GO


-- 24. Al insertar o modificar en residencias no permitir que el mismo director dirija más de dos residencias.
-- Deberá funcionar para uno y para varios registros.

CREATE TRIGGER tr_insertUpdate_residencias
ON residencias
FOR INSERT, UPDATE
AS
	IF (EXISTS(SELECT COUNT(*) FROM residencias GROUP BY nombreDirector HAVING COUNT(*) > 2))
		BEGIN
			PRINT 'No se permiten más de 2 residencias por director'
			ROLLBACK
		END
GO

SELECT * FROM residencias
INSERT residencias VALUES ('NombreResidencia', 'ULagun', 400, 1, 100, 'pepepe', 'mixto', 0)
INSERT residencias VALUES ('NombreResidencia2', 'ULagun', 400, 1, 100, 'pepepe', 'mixto', 0)
SELECT * FROM residencias
UPDATE residencias SET nombreDirector = 'direc' WHERE codResidencia > 6
GO