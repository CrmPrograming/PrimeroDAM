-- ###################################

--		    DESENCADENADORES 1

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 18/05/2020

USE BDResidenciasEscolares_prueba
GO

-- 1. Hacer un trigger que cuando insertemos en la tabla universidades, si el nombre ya existe visualice
--  "ese nombre  de universidad ya está en la tabla" y no se realice la  inserción, en  caso  contrario
-- que  visualice  ‘Nombre  correcto’  y  se inserte.

CREATE TRIGGER tr_insertUniversidadesNombreExistente
ON Universidades
INSTEAD OF INSERT
AS	
	IF (SELECT COUNT(*) FROM Universidades WHERE nomUniversidad = (SELECT nomUniversidad FROM inserted)) = 1
		PRINT 'Ese nombre o nombres de universidad ya están en la tabla'
	ELSE
		BEGIN			
			INSERT Universidades SELECT * FROM inserted
			PRINT 'Nombre(s) correcto(s)'
		END
GO

SELECT * FROM Universidades
INSERT Universidades VALUES ('ull2', 'La Laguna', '922334455')
SELECT * FROM Universidades
INSERT Universidades VALUES ('ull3', 'Universidad de LL', '922334455')
SELECT * FROM Universidades

GO


-- 2. Haz un trigger sobre la tabla estudiantes en el borrado. De modo que si intentas borrar más de un registro
-- a la vez te visualiza un aviso y no realiza el borrado.

CREATE TRIGGER tr_deleteEstudiantes
ON estudiantes
AFTER DELETE
AS
	IF (SELECT COUNT(*) FROM deleted) > 1
		BEGIN
			ROLLBACK
			PRINT 'Operación denegada: No se permite borrar más de un registro'
		END
GO

SELECT * FROM estudiantes
DELETE FROM estudiantes WHERE codEstudiante = 2 OR codEstudiante = 6
SELECT * FROM estudiantes
GO


-- 3. Añade al  ejercicio anterior Y Si el sexo es F muestre un mensaje y no permita el borrado.

ALTER TRIGGER tr_deleteEstudiantes
ON estudiantes
AFTER DELETE
AS
	IF (SELECT COUNT(*) FROM deleted) > 1
		BEGIN
			ROLLBACK
			PRINT 'Operación denegada: No se permite borrar más de un registro'
		END
	ELSE IF (SELECT COUNT(*) FROM deleted WHERE sexo = 'F') > 0
		BEGIN
			ROLLBACK
			PRINT 'Operación denegada: No se permite borrar registros con sexo F'
		END
GO

SELECT * FROM estudiantes
DELETE FROM estudiantes WHERE codEstudiante = 2 OR codEstudiante = 6
SELECT * FROM estudiantes
DELETE FROM estudiantes WHERE codEstudiante = 7
SELECT * FROM estudiantes
GO


-- 4. Hacer un Trigger que en la tabla Residencias Escolares al insertar el precio Mensual,
-- no permitirá que sea menor que 400.

CREATE TRIGGER tr_insertResidenciasPrecio
ON residencias
INSTEAD OF INSERT
AS
	IF (SELECT COUNT(*) FROM inserted WHERE precioMensual < 400) >= 1
		PRINT 'No se permiten residencias con un precio mensual inferior a 400'
	ELSE
		INSERT residencias SELECT nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero FROM inserted
GO

SELECT * FROM residencias
INSERT residencias VALUES('ResidenciaNoValida', 'ull', 222, 1, 100, 'Juan', 'mixto')
SELECT * FROM residencias
GO

-- 5. Deshabilta  el trigger anterior.  Deshabilita todos los trigger de la tabla universidades.

-- Deshabilita el trigger anterior
ALTER TABLE residencias DISABLE TRIGGER tr_insertResidenciasPrecio
GO

-- Deshabilita todos los trigger de la tabla universidades
ALTER TABLE Universidades DISABLE TRIGGER ALL
GO

-- 6. Escribe las siguientes sentencias y explica para que sirve cada una.

-- sp_helptext
	/*
		Muestra el texto al completo de elementos creados por el usuario tales como vistas,
		triggers, procedimientos y similares
	*/

-- sp_depends
	/*
		Muestra las dependencias entre distintos objetos de la base de datos como vistas, procedimientos
		que dependen de la tabla o vista indicada.
	*/

-- sp_helptrigger
	/*
		Muestra los trigger asociados a una tabla junto con información asociada
		a cada uno de ellos.
	*/