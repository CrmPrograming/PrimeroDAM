
-- César Ravelo Martínez


-- #######################################################

--		   EJERCICIO 4: BD GIMNASIO UPDATES/DELETES

-- #######################################################

USE BDResidenciasEscolares 
GO

-- 1) Inserta un registro en residencias con cantidad de plazas y genero sus valores por defecto
INSERT INTO residencias VALUES ('Residencia Default', 'UToled', 231, 1, 23, 'Almeida', DEFAULT)
GO

-- 2) Inserta un estudiante con sexo por defecto
INSERT INTO estudiantes VALUES (8, 'alumna default', '77777777Y', '922363636', 'alumnodefault@mail.com', DEFAULT)
GO

-- 3) Haz una copia de la tabla residencias con select into en una nueva tabla llamada residencias_copia
SELECT * INTO residencias_copia FROM residencias
GO

-- 4) Haz una copia de la tabla estancias con select into en una nueva tabla llamada estancias_copia
SELECT * INTO estancias_copia FROM estancias 
GO

-- 5) En la tabla residencias_copia elimina la ultima residencia insertada
-- NOTA: En mi caso, codResidencia = 11 es el último valor insertado
DELETE FROM residencias_copia WHERE codResidencia = 11
GO

-- 6) Enlaza con claves foraneas estas dos tablas creadas
-- 1) Creamos las claves primarias
ALTER TABLE residencias_copia ADD CONSTRAINT pk_codResidencia PRIMARY KEY(codResidencia)
GO
ALTER TABLE estancias_copia ADD CONSTRAINT pk_estancias_copia PRIMARY KEY(codEstudiante, codResidencia, fechaInicio)
GO
-- 2) Creamos las claves foraneas
ALTER TABLE estancias_copia ADD CONSTRAINT fk_codResidencia FOREIGN KEY(codResidencia) REFERENCES residencias_copia
GO

-- 7) En la tabla residencias_copia intenta eliminar una residencia que esté en estancias
DELETE FROM residencias_copia WHERE codResidencia = 6
GO
-- Al intentarlo da error por la clave foranea declarada en el paso anterior

-- 8) Elimina de estancias_copia todos los registros, hazlo de dos modos
TRUNCATE TABLE estancias_copia
GO

DELETE FROM estancias_copia
GO

-- 9) Inserta a la tabla estancias_copia todos los registros que están en la tabla estancias
INSERT INTO estancias_copia SELECT * FROM estancias
GO
SELECT * FROM estancias_copia 
GO

-- 10) Modifica el nombre residencia a la residencia con codigo X en la tabla residencias_copia
-- NOTA: En este caso, vamos a usar el código de residencia 7 según los valores almacenados
UPDATE residencias_copia SET nomResidencia = 'Residencia Cambiada' WHERE codResidencia = 7
GO
SELECT * FROM residencias_copia
GO

-- 11) En la tabla residencias_copia incrementa en 10 el precio a todas las residencias 
UPDATE residencias_copia SET precioMensual = (precioMensual + 10)
GO
SELECT * FROM residencias_copia
GO

-- 12) En la tabla residencias_copia incrementa el precio a todas las residencias en un 10%
UPDATE residencias_copia SET precioMensual = (precioMensual + (precioMensual * 0.1))
GO
SELECT * FROM residencias_copia
GO

-- 13) En la tabla residencias_copia incrementa el precio en 15 a todas las residencias de genero masculino
UPDATE residencias_copia SET precioMensual = (precioMensual + 15) WHERE genero = 'masculino'
GO
SELECT * FROM residencias_copia
GO

-- 14) Modifica el precio a la residencia con codigo x en residencias_copia
-- NOTA: En este caso, vamos a usar el código de residencia 7 según los valores almacenados
UPDATE residencias_copia SET precioMensual = 777 WHERE codResidencia = 7
GO
SELECT * FROM residencias_copia
GO

-- 15) Modifica el precio en la tabla estancias_copia a la residencia x , estudiante X y fecha de inicio X
UPDATE estancias_copia SET preciopagado = 777 WHERE codResidencia = 4 AND codEstudiante = 1 AND fechaInicio = '2009-08-04'
GO
SELECT * FROM estancias_copia 
GO

-- 16) Incrementa el precio en 5 a todas las estancias de la residencia x
UPDATE estancias_copia SET preciopagado = (preciopagado + 5) WHERE codResidencia = 6
GO
SELECT * FROM estancias_copia 

-- 17) Decrementa el precio en 10 a todas las estancias del estudiante x
UPDATE estancias_copia SET preciopagado = (preciopagado - 10) WHERE codEstudiante = 1
GO
SELECT * FROM estancias_copia
GO