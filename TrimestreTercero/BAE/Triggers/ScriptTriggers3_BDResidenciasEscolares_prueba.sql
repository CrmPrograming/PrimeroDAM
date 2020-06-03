-- ###################################

--		    DESENCADENADORES 3

-- ###################################

-- autor: César Ravelo Martínez
-- fecha: 26/05/2020

USE BDResidenciasEscolares_prueba
GO

-- 11. Crea una tabla llamada universidadesBorradas, con los mismos campos que la tabla universidades. Cuando eliminemos una
-- universidad deberemos copiar todos sus datos a la tabla universidadesborradas. Debe funcionar para eliminar un solo registro o varios.

CREATE TABLE universidadesBorradas (
	codUniversidad CHAR(6) NOT NULL,
	nomUniversidad VARCHAR(30) NULL,
	telefono CHAR(9) NULL
)
GO

-- NOTA: A la tabla universidadesBorradas no le asignamos ninguna clave primaria para que permita que se puedan borrar
-- universidades de la tabla original y no de problemas si se solapan codUniversidad en la tabla universidadesBorradas.
-- Otra manera de gestionar esto podría ser crear una clave formada por el codUniversidad y el tiempo en el cual
-- se insertó un nuevo registro en la tabla, permitiendo así dos registros que tuvieran mismo codUniversidad

ALTER TABLE Universidades DISABLE TRIGGER ALL
GO

CREATE TRIGGER tr_delete_universidades_backup
ON Universidades
FOR DELETE
AS
	INSERT universidadesBorradas SELECT * FROM deleted
GO

INSERT Universidades VALUES ('ufal', 'Universidad Falsa', NULL)
SELECT * FROM Universidades
SELECT * FROM universidadesBorradas
DELETE FROM Universidades WHERE codUniversidad = 'ufal'
SELECT * FROM Universidades
SELECT * FROM universidadesBorradas

INSERT Universidades VALUES ('ufal1', 'Universidad Falsa', NULL), ('ufal2', 'Universidad Falsa', NULL)
SELECT * FROM Universidades
SELECT * FROM universidadesBorradas
DELETE FROM Universidades WHERE codUniversidad LIKE 'ufal%'
SELECT * FROM Universidades
SELECT * FROM universidadesBorradas
GO


-- 12. Modificar la tabla residencias de modo que le añadimos un campo que es plazas ocupadas en año actual.

ALTER TABLE residencias ADD plazasOcupadas INT NULL
GO


-- 13. Hacer una función que calcule las plazas ocupadas en el año actual en cada residencia. (Mirando las estancias)
-- Actualizar ese campo creado de las plazas ocupadas.

CREATE FUNCTION dbo.fn_calcularPlazasOcupadas()
RETURNS TABLE
AS
	RETURN (SELECT residencias.codResidencia, COUNT(estancias.codResidencia) [Total]
			FROM residencias 
				LEFT JOIN estancias ON residencias.codResidencia = estancias.codResidencia
			WHERE YEAR(estancias.fechaInicio) = YEAR(GETDATE())
			GROUP BY residencias.codResidencia)
GO

-- NOTA: Desactivamos el trigger de precioPagado inferior a 400 para que no dé problemas en este ejercicio
ALTER TABLE residencias DISABLE TRIGGER tr_insertUpdate_residencias_precioMensual
GO

SELECT * FROM residencias
UPDATE residencias SET plazasOcupadas = P.Total FROM dbo.fn_calcularPlazasOcupadas() AS P WHERE residencias.codResidencia = P.codResidencia
SELECT * FROM residencias
GO


-- 14. Realizar trigger de modo que si insertas, borras o actualizas en la tabla estancias se deberá actualizar la cantidad
-- de plazas totales de la residencia en cuestión. (solo actualizarla residencia en cuestión y no toda la tabla)

CREATE TRIGGER tr_modificar_estancias_actualizar_plazasTotales
ON estancias
FOR INSERT, UPDATE, DELETE
AS
	-- delete
	IF (NOT EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted))
		UPDATE residencias SET residencias.plazasOcupadas = p.Total
		FROM dbo.fn_calcularPlazasOcupadas() AS p, deleted
		WHERE residencias.codResidencia = p.codResidencia AND residencias.codResidencia = deleted.codResidencia
	ELSE
		UPDATE residencias SET residencias.plazasOcupadas = p.Total
		FROM dbo.fn_calcularPlazasOcupadas() AS p, inserted
		WHERE residencias.codResidencia = p.codResidencia AND residencias.codResidencia = inserted.codResidencia		
GO

SELECT codResidencia, plazasOcupadas FROM residencias
INSERT estancias VALUES (777, 4, GETDATE(), '2077-01-01', 100, NULL, NULL)
SELECT codResidencia, plazasOcupadas FROM residencias

DELETE FROM estancias WHERE codEstudiante = 777
SELECT codResidencia, plazasOcupadas FROM residencias

INSERT estancias VALUES (777, 4, GETDATE(), '2020-12-12', 100, NULL, NULL),
						(777, 6, '2020-12-12', '2022-12-12', 100, NULL, NULL)
SELECT codResidencia, plazasOcupadas FROM residencias

UPDATE estancias SET fechaInicio = '2077-07-07', fechaFin = '2087-07-07' WHERE codEstudiante = 777
SELECT codResidencia, plazasOcupadas FROM residencias
GO