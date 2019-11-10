-- César Ravelo Martínez


-- #######################################################

--				BD CONSTRUCCION MODIFICACIONES

-- #######################################################


USE construccion
GO

-- 1. Crea una tabla llamada asignacion_copia que tenga la estructura y los datos de la tabla asignacion
SELECT * INTO asignacion_copia FROM asignacion
SELECT * FROM asignacion_copia
GO

-- 2. Modifica los días trabajados a una determinada asignacion_copia
SELECT * FROM asignacion_copia WHERE id_asignacion = 8
UPDATE asignacion_copia SET num_dias = 2 WHERE id_asignacion = 8
SELECT * FROM asignacion_copia WHERE id_asignacion = 8
GO

-- 3. Modifica los dias trabajados a un determinado trabajador
SELECT * FROM asignacion_copia WHERE id_trabajador = 102
UPDATE asignacion_copia SET num_dias = 7 WHERE id_trabajador = 102
SELECT * FROM asignacion_copia WHERE id_trabajador = 102
GO

-- 4. Modifica a una determinada asignacion la fecha de inicio y el num_dias
SELECT * FROM asignacion_copia WHERE id_asignacion = 8
UPDATE asignacion_copia SET fecha_inicio = '2019-07-07', num_dias = 17 WHERE id_asignacion = 8
SELECT * FROM asignacion_copia WHERE id_asignacion = 8
GO

-- 5. Incrementale el numero de dias en 2 a las asignaciones del edificio x
SELECT * FROM asignacion_copia WHERE id_asignacion = 8
UPDATE asignacion_copia SET num_dias = num_dias + 2 WHERE id_asignacion = 8
SELECT * FROM asignacion_copia WHERE id_asignacion = 8
GO

-- 6. Incrementale el numerop de dias  a las asignaciones del dia x  o dia y
SELECT * FROM asignacion_copia WHERE fecha_inicio = '2019-11-08' OR fecha_inicio = '2019-11-11'
UPDATE asignacion_copia SET num_dias = num_dias + 2 WHERE fecha_inicio = '2019-11-08' OR fecha_inicio = '2019-11-11'
SELECT * FROM asignacion_copia WHERE fecha_inicio = '2019-11-08' OR fecha_inicio = '2019-11-11'
GO

-- 7. Incrementale el numero de días a las asignaciones del trabajados x y fecha y
SELECT * FROM asignacion_copia WHERE id_trabajador = 103 OR fecha_inicio = '2019-11-08'
UPDATE asignacion_copia SET num_dias = 77 WHERE id_trabajador = 103 OR fecha_inicio = '2019-11-08'
SELECT * FROM asignacion_copia WHERE id_trabajador = 103 OR fecha_inicio = '2019-11-08'
GO

-- 8. Elimina  la asignaciones x
SELECT * FROM asignacion_copia WHERE id_asignacion = 6
DELETE FROM asignacion_copia WHERE id_asignacion = 6
SELECT * FROM asignacion_copia WHERE id_asignacion = 6
GO

-- 9. Elimina las asignaciones del dia x o dia y
SELECT * FROM asignacion_copia WHERE fecha_inicio = '2019-11-08' OR fecha_inicio = '2019-11-11'
DELETE FROM asignacion_copia WHERE fecha_inicio = '2019-11-08' OR fecha_inicio = '2019-11-11'
SELECT * FROM asignacion_copia WHERE fecha_inicio = '2019-11-08' OR fecha_inicio = '2019-11-11'
GO

-- 10. Inserta una asignaciones y mira su codigo de asignaciones
INSERT asignacion_copia VALUES (777, 'ePRUE', '2019-11-08', 56)
SELECT * FROM asignacion_copia
GO
-- El id logrado será 9

-- 11. Elimina la asignacion que acabas de insertar . ¿ que pasa con el código ? 
SELECT * FROM asignacion_copia WHERE id_asignacion = 9
DELETE FROM asignacion_copia WHERE id_asignacion = 9
SELECT * FROM asignacion_copia WHERE id_asignacion = 9
GO
-- Al borrar ese registro, si fueramos a insertar uno nuevo su id_asignacion será mayor al anterior debido a la propiedad IDENTITY del atributo

-- 12. Elimina todas las asignaciones con delete
SELECT * FROM asignacion_copia
DELETE FROM asignacion_copia
SELECT * FROM asignacion_copia
GO

-- 13. Inserta una asignaccion. ¿Qué pasa con el codigo?
SELECT * FROM asignacion_copia
INSERT asignacion_copia VALUES (777, 'ePRUE', '2019-11-08', 56)
SELECT * FROM asignacion_copia
GO
-- El id_asignacion no se reinició al borrar los registros con DELETE en el apartado anterior y, por tanto, el nuevo registro continúa con el valor siguiente al anterior insertado

-- 14. Elimina todas las asignaciones con truncate 
SELECT * FROM asignacion_copia
TRUNCATE TABLE asignacion_copia
SELECT * FROM asignacion_copia
GO

-- 15. Inserta una asignaccion. ¿ Que pasa con el codigo ?
SELECT * FROM asignacion_copia
INSERT asignacion_copia VALUES (777, 'ePRUE', '2019-11-08', 56)
SELECT * FROM asignacion_copia
GO

-- En este caso como utilizamos en el apartado anterior TRUNCATE, el valor IDENTITY se reinicia al valor inicial siendo en este caso 1 y al insertar el registro se le asigna ese valor

-- 16. Inserta en asignaciones_copia todas las asignaciones del trabajador x y del trabajador y de la tabla asignacion
INSERT asignacion_copia SELECT id_trabajador, id_edificio, fecha_inicio, num_dias FROM asignacion WHERE id_trabajador = 103 OR id_trabajador = 101
SELECT * FROM asignacion_copia
GO

-- 17. Inserta en asignaciones copia la asignacion x de la tabla asignacion
SELECT * FROM asignacion WHERE id_asignacion = 4
INSERT asignacion_copia SELECT id_trabajador, id_edificio, fecha_inicio, num_dias FROM asignacion WHERE id_asignacion = 4
SELECT * FROM asignacion_copia WHERE id_asignacion = 4
GO

-- 18. Elimina un edificio que exista en asignacion ¿que ocurre?
DELETE FROM edificio WHERE id_edificio = 'eRAVA'
GO
-- No se puede borrar debido a la CONSTRAINT definida de clave foránea fk_id_edificio

-- 19. Inserta un edificio
SELECT * FROM edificio
INSERT edificio VALUES ('eNUEV', 'Edificio Nuevo', 'Comercio', 2, 'A')
SELECT * FROM edificio
GO

-- 20. Elimina el edificio que acabas de insertar
SELECT * FROM edificio
DELETE FROM edificio WHERE id_edificio = 'eNUEV'
SELECT * FROM edificio
GO

-- 21. Inserta un edificio con calidad 6 ¿que ocurre?
SELECT * FROM edificio
INSERT edificio VALUES ('eNUEV', 'Edificio Nuevo', 'Comercio', 6, 'A')
GO
-- No se puede insertar debido a la CONSTRAINT definida que impide valores mayores que 5 (ck_nivel_calidad)

-- 22. Modifica al edificio x  ponle la categoria D ¿Que ocurre?
SELECT * FROM edificio WHERE id_edificio = 'cGATO'
UPDATE edificio SET categoria = 'D' WHERE id_edificio = 'cGATO'
GO
-- No se puede actualizar la categoría debido a la CONSTRAINT ck_categoria la cual impide valores que no sean A, B y C

-- 23. Borra la tabla asignacion_copia
DROP TABLE asignacion_copia
GO