-- ###################################

--		    DESENCADENADORES 2

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 22/05/2020

USE BDResidenciasEscolares_prueba
GO

-- 7. Hacer un Trigger que si en la tabla residencias al insertar o modificar ponemos la fecha
-- inicio posterior a la de fin que las intercambie

CREATE TRIGGER tr_insertUpdate_Residencias_FechaInicioPosterior
ON estancias
FOR INSERT, UPDATE
AS

	IF (SELECT COUNT(*) FROM inserted WHERE fechaInicio > fechaFin) > 0
		BEGIN
			DECLARE @fechaInicioBuena DATE, @fechaFinBuena DATE, @estudiante INT, @residencia INT

			-- A fin de evitar tener que hacer varias subconsultas a la hora de actualizar, 
			-- guardamos temporalmente los campos necesarios en variables reduciendo así el número de consultas
			-- requeridas para la operación

			SELECT @estudiante = codEstudiante, @residencia = codResidencia, @fechaInicioBuena = fechaFin, @fechaFinBuena = fechaInicio
			FROM inserted

			UPDATE estancias SET fechaInicio = @fechaInicioBuena, fechaFin = @fechaFinBuena
			WHERE codEstudiante = @estudiante AND codResidencia = @residencia AND fechaInicio = @fechaFinBuena
		END
GO

SELECT * FROM estancias
INSERT estancias VALUES (1, 4, '2057-03-28', GETDATE(), 100, NULL, NULL)
SELECT * FROM estancias
UPDATE estancias SET fechaInicio = '2057-03-28', fechaFin = GETDATE() WHERE codEstudiante = 1 AND codResidencia = 4 AND fechaInicio = GETDATE()
SELECT * FROM estancias
GO


-- 8. Hacer un Trigger que no permita eliminar ninguna Universidad.
CREATE TRIGGER tr_delete_universidad
ON Universidades
FOR DELETE
AS
	PRINT 'No se permite borrar ninguna universidad'
	ROLLBACK
GO

INSERT Universidades VALUES ('UFalsa', 'Universidad falsa de prueba', '922222222')
SELECT * FROM Universidades
DELETE FROM Universidades WHERE codUniversidad = 'UFalsa'
SELECT * FROM Universidades

-- Nota: En caso de necesitar desactivar el trigger, descomentar la siguiente línea:
-- ALTER TABLE Universidades DISABLE TRIGGER tr_delete_universidad
GO


-- 9. Realizar los dos triggers anteriores de modo instead off

-- 7.

ALTER TRIGGER tr_insertUpdate_Residencias_FechaInicioPosterior
ON estancias
INSTEAD OF UPDATE, INSERT
AS
	-- Update
	IF (EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted))
		BEGIN
			-- Guardamos datos originales para poder referirnos más cómodamente a ellos luego
			DECLARE @estudiante INT, @residencia INT, @inicio DATE
			SELECT @estudiante = codEstudiante, @residencia = codResidencia, @inicio = fechaInicio FROM deleted

			IF (SELECT COUNT(*) FROM inserted WHERE fechaInicio > fechaFin) > 0				
				UPDATE estancias SET estancias.codEstudiante = inserted.codEstudiante, estancias.codResidencia = inserted.codResidencia,
					estancias.fechaInicio = inserted.fechaFin, estancias.fechaFin = inserted.fechaInicio, estancias.preciopagado = inserted.preciopagado,
					estancias.observaciones = inserted.observaciones, estancias.numhabitacion = inserted.numhabitacion
				FROM inserted
				WHERE estancias.codEstudiante = @estudiante AND estancias.codResidencia = @residencia AND estancias.fechaInicio = @inicio
			ELSE				
				UPDATE estancias SET estancias.codEstudiante = inserted.codEstudiante, estancias.codResidencia = inserted.codResidencia,
					estancias.fechaInicio = inserted.fechaInicio, estancias.fechaFin = inserted.fechaFin, estancias.preciopagado = inserted.preciopagado,
					estancias.observaciones = inserted.observaciones, estancias.numhabitacion = inserted.numhabitacion
				FROM inserted
				WHERE estancias.codEstudiante = @estudiante AND estancias.codResidencia = @residencia AND estancias.fechaInicio = @inicio
		END
	-- Insert
	ELSE
		BEGIN
			IF (SELECT COUNT(*) FROM inserted WHERE fechaInicio > fechaFin) > 0
				INSERT estancias SELECT codEstudiante, codResidencia, fechaFin, fechaInicio, precioPagado, observaciones, numhabitacion
				FROM inserted
			ELSE
				INSERT estancias SELECT * FROM inserted
		END
GO

SELECT * FROM estancias
UPDATE estancias SET fechaInicio = '2087-09-08', fechaFin = GETDATE() WHERE codEstudiante = 777
SELECT * FROM estancias
GO

-- 8.

ALTER TRIGGER tr_delete_universidad
ON Universidades
INSTEAD OF DELETE
AS
	PRINT 'No se permite borrar ninguna universidad'
GO

INSERT Universidades VALUES('UFALS', 'Universidad Falsa', '922777777')
SELECT * FROM Universidades WHERE codUniversidad = 'UFALS'
DELETE FROM Universidades WHERE codUniversidad = 'UFALS'
SELECT * FROM Universidades WHERE codUniversidad = 'UFALS'
GO


-- 10. Hacer un Trigger que en la tabla ResidenciasEscolares al insertar o modificar el precioMensual, no permitirá que sea menor que 400.
-- Si queremos que un trigger se active con más de una operación deberemos separarlas por coma. Pero hay que asegurarse sobre que tabla hacemos
-- las comprobaciones. Pruebalo insertando o modificando un solo registro y también para varios registros.

CREATE TRIGGER tr_insertUpdate_residencias_precioMensual
ON residencias
FOR INSERT, UPDATE
AS	
	IF (EXISTS(SELECT * FROM inserted WHERE precioMensual < 400))
		BEGIN
			PRINT 'PrecioPagado no puede ser inferior a 400. Operación anulada'
			ROLLBACK
		END
GO

SELECT * FROM residencias
INSERT residencias VALUES ('Residencia Falsa', 'ull', 50, 1, 100, NULL, 'mixto')
INSERT residencias VALUES ('Residencia Buena', 'ull', 420, 1, 100, NULL, 'mixto'),
						  ('Residencia Mala', 'ull', 50, 1, 100, NULL, 'mixto')
SELECT * FROM residencias
UPDATE residencias SET precioMensual = 50 WHERE codResidencia > 10
SELECT * FROM residencias
GO