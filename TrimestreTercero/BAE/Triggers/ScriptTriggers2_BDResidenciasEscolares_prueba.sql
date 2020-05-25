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
			ROLLBACK
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
			UPDATE e SET e.fechafin = i.fechaInicio, e.fechainicio = i.fechaFin
			FROM estancias e
			INNER JOIN inserted i ON i.codestudiante=e.codestudiante AND i.codresidencia=e.codresidencia AND e.fechainicio=i.fechainicio
			WHERE i.fechainicio >= i.fechaFin
		
			UPDATE e SET e.fechafin = i.fechaFin, e.fechaInicio = i.fechaInicio
			FROM estancias e
			INNER JOIN inserted i ON i.codestudiante=e.codestudiante and i.codresidencia=e.codresidencia and e.fechainicio=i.fechainicio
			WHERE i.fechainicio < i.fechaFin
		END
	-- Insert
	ELSE
		BEGIN			
			INSERT estancias SELECT * FROM inserted WHERE fechaInicio <= fechaFin
			INSERT estancias SELECT codEstudiante, codREsidencia, fechafin, fechainicio, preciopagado, observaciones, numhabitacion FROM inserted WHERE fechaInicio > fechaFin
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