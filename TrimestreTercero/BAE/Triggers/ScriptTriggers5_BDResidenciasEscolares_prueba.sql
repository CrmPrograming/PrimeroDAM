-- ###################################

--		    DESENCADENADORES 5

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 02/06/2020

USE BDResidenciasEscolares_prueba
GO

-- 19. Hacer un trigger de modo que cuando insertemos en la tabla residencias si se le ha asignado un valor al campo plazasocupadas
-- deshacer la inserción e indicar que ‘no esta permitido asignar plazas ocupadas’. Debe funcionar para uno y para varios registros.

CREATE TRIGGER tr_insert_residencias_plazasocupadas
ON residencias
INSTEAD OF INSERT
AS
	IF (EXISTS(SELECT * FROM inserted WHERE plazasOcupadas > 0))
		PRINT 'no esta permitido asignar plazas ocupadas'
	ELSE
		INSERT residencias SELECT nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero, plazasOcupadas FROM inserted
GO

SELECT * FROM residencias
INSERT residencias VALUES ('Residencia Falsa', 'ull', 777, 1, 30, NULL, 'femenino', 1)
INSERT residencias VALUES ('Residencia Falsa', 'ull', 777, 1, 30, NULL, 'femenino', 1),
							('Residencia Buena', 'ull', 777, 1, 30, NULL, 'femenino', 0)
SELECT * FROM residencias
GO


-- 20. Lo mismo para la modificación de la tabla residencias, no se puede cambiar las plazasOcupadas directamente.

CREATE TRIGGER tr_update_residencias_plazasocupadas
ON residencias
INSTEAD OF UPDATE
AS
	IF (EXISTS(SELECT * FROM inserted I INNER JOIN deleted D ON I.codResidencia = D.codResidencia WHERE I.plazasOcupadas <> D.plazasOcupadas))
		PRINT 'no está permitido cambiar plazasOcupadas directamente'
	ELSE
		UPDATE residencias SET residencias.nomResidencia = I.nomResidencia, residencias.codUniversidad = I.codUniversidad, residencias.precioMensual = I.precioMensual,
								residencias.comedor = I.comedor, residencias.cantidadPlazas = I.cantidadPlazas, residencias.nombreDirector = I.nombreDirector,
								residencias.genero = I.genero
		FROM inserted I
		WHERE residencias.codResidencia = I.codResidencia				   
GO

SELECT * FROM residencias
UPDATE residencias SET plazasOcupadas = 77 WHERE codResidencia > 8
SELECT * FROM residencias
GO


-- 21. Hacer un desencadenador o trigger que al borrar una estancia, visualice un mensaje que no está permitido borrar
-- y no realice el borrado. Hacerlo de dos modos, con for y con instead of. Acuerdate de deshabilitar uno antes de probar
-- el otro. Debe funcionar para uno y para varios registros.

CREATE TRIGGER tr_delete_estancias
ON estancias
FOR DELETE
AS
	PRINT 'Operación no permitida'
	ROLLBACK
GO

SELECT * FROM estancias
DELETE FROM estancias WHERE codEstudiante = 777
SELECT * FROM estancias
GO

ALTER TABLE estancias DISABLE TRIGGER tr_delete_estancias
GO

CREATE TRIGGER tr_delete_estancias2
ON estancias
INSTEAD OF DELETE
AS
	PRINT 'Operación no permitida'
GO

SELECT * FROM estancias
DELETE FROM estancias WHERE codEstudiante = 777
SELECT * FROM estancias
GO


-- 22. Desactivar el trigger anterior e intentar de nuevo el borrado sobre la tabla estancias.
ALTER TABLE estancias DISABLE TRIGGER tr_delete_estancias2
GO

SELECT * FROM estancias
DELETE FROM estancias WHERE codEstudiante = 777
SELECT * FROM estancias
GO