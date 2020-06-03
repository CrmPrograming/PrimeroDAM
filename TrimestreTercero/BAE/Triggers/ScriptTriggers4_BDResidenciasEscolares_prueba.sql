-- ###################################

--		    DESENCADENADORES 4

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 28/05/2020

USE BDResidenciasEscolares_prueba
GO

-- 15. Hacer un Trigger que en la tabla ResidenciasEscolares modificar el precioMensual, no permitirá que sea menor
-- que el valor que tenia antes. Debe funcionar para uno y para varios registros.

CREATE TRIGGER tr_update_precioMensual_superior_precioAnterior
ON residencias
FOR UPDATE
AS
	IF (UPDATE(precioMensual) AND EXISTS(SELECT * FROM inserted INNER JOIN deleted ON inserted.codResidencia = deleted.codResidencia WHERE inserted.precioMensual < deleted.precioMensual))
		BEGIN
			PRINT 'No se permiten precios menores a los actuales'
			ROLLBACK
		END
GO

SELECT * FROM residencias
UPDATE residencias SET precioMensual = precioMensual - 10 WHERE codResidencia = 15
SELECT * FROM residencias
GO


-- 16. Crear 2 tablas que tengan la misma estructura que la tabla de residencias, a una la llamamos
-- residenciasConcomedor y la otra REsidenciasSincomedor

CREATE TABLE residenciasConcomedor (
	codResidencia INT NOT NULL CONSTRAINT pk_codResidencia_residenciasConcomedor PRIMARY KEY,
	nomResidencia VARCHAR(30) NOT NULL,
	codUniversidad CHAR(6) NULL,
	precioMensual INT NULL,
	cantidadPlazas INT NOT NULL,
	nombreDirector VARCHAR(40) NULL,
	genero CHAR(9) NULL,
	plazasOcupadas INT NULL
)

CREATE TABLE residenciasConcomedor (
	codResidencia INT NOT NULL CONSTRAINT pk_codResidencia_residenciasConcomedor PRIMARY KEY,
	nomResidencia VARCHAR(30) NOT NULL,
	codUniversidad CHAR(6) NULL,
	precioMensual INT NULL,
	cantidadPlazas INT NOT NULL,
	nombreDirector VARCHAR(40) NULL,
	genero CHAR(9) NULL,
	plazasOcupadas INT NULL
)
GO

CREATE TABLE residenciasSincomedor (
	codResidencia INT NOT NULL CONSTRAINT pk_codResidencia_residenciasSincomedor PRIMARY KEY,
	nomResidencia VARCHAR(30) NOT NULL,
	codUniversidad CHAR(6) NULL,
	precioMensual INT NULL,
	cantidadPlazas INT NOT NULL,
	nombreDirector VARCHAR(40) NULL,
	genero CHAR(9) NULL,
	plazasOcupadas INT NULL
)
GO


-- 17. Hacer un desencadenador de modo que cada vez que insertamos en la tabla residencias también inserte la misma residencia
-- en la tabla que corresponda de las creadas en el ejercicio anterior según sea con comedor o no.

CREATE TRIGGER tr_residenciasComedor
ON residencias
FOR INSERT
AS
	INSERT residenciasConcomedor SELECT codResidencia, nomResidencia, codUniversidad, precioMensual, cantidadPlazas, nombreDirector, genero, plazasOcupadas
	FROM inserted
	WHERE comedor = 1

	INSERT residenciasSincomedor SELECT codResidencia, nomResidencia, codUniversidad, precioMensual, cantidadPlazas, nombreDirector, genero, plazasOcupadas
	FROM inserted
	WHERE comedor = 0
GO

SELECT * FROM residencias
SELECT * FROM residenciasConcomedor
SELECT * FROM residenciasSincomedor
INSERT residencias VALUES ('Residencia Falsa1', 'uLagun', 777, 1, 77, NULL, 'mixto', 0),
							('Residencia Falsa2', 'uLagun', 777, 0, 77, NULL, 'mixto', 0)
SELECT * FROM residencias
SELECT * FROM residenciasConcomedor
SELECT * FROM residenciasSincomedor
GO


-- 18. Lo mismo al anterior para el borrado y para la modificacion. Funcione para uno y varios registros.

CREATE TRIGGER tr_update_delete_residenciasComedor
ON residencias
FOR UPDATE, DELETE
AS
	-- Update
	IF (EXISTS(SELECT * FROM inserted))
		BEGIN
			-- Eliminamos lo previo
		
			DELETE FROM residenciasConcomedor WHERE codResidencia IN (SELECT deleted.codResidencia FROM deleted)
			DELETE FROM residenciasSincomedor WHERE codResidencia IN (SELECT deleted.codResidencia FROM deleted)
			
			-- Insertamos los nuevos valores
			
			INSERT residenciasConcomedor SELECT codResidencia, nomResidencia, codUniversidad, precioMensual, cantidadPlazas, nombreDirector, genero, plazasOcupadas
			FROM inserted WHERE comedor = 1

			INSERT residenciasSincomedor SELECT codResidencia, nomResidencia, codUniversidad, precioMensual, cantidadPlazas, nombreDirector, genero, plazasOcupadas
			FROM inserted	WHERE comedor = 0
		END
	ELSE
		BEGIN
			DELETE FROM residenciasConcomedor WHERE codResidencia IN (SELECT deleted.codResidencia FROM deleted)
			DELETE FROM residenciasSincomedor WHERE codResidencia IN (SELECT deleted.codResidencia FROM deleted)
		END
GO

SELECT * FROM residencias WHERE nomResidencia LIKE 'Residencia Falsa%'
SELECT * FROM residenciasConcomedor
SELECT * FROM residenciasSincomedor

UPDATE residencias SET comedor = 1 WHERE codResidencia = 25

SELECT * FROM residencias WHERE nomResidencia LIKE 'Residencia Falsa%'
SELECT * FROM residenciasConcomedor
SELECT * FROM residenciasSincomedor

DELETE FROM residencias WHERE nomResidencia LIKE 'Residencia Falsa%'

SELECT * FROM residencias WHERE nomResidencia LIKE 'Residencia Falsa%'
SELECT * FROM residenciasConcomedor
SELECT * FROM residenciasSincomedor
GO