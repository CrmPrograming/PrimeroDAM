
-- César Ravelo Martínez


-- #######################################################

--		   EJERCICIO 5: BD GIMNASIO MODIFICACIÓN DATOS

-- #######################################################

USE Gimnasio
GO

-- 1) Inserta 5 registros en cada una de las tablas 
-- Inserciones en actividades
INSERT INTO actividades VALUES ('natac', 'Actividad de Natación', 0, 0, 1, 0, 1, 1, 0),
							   ('cicli', 'Actividad de Ciclismo', 1, 1, 0, 0, 0, 0, 1),
							   ('tenis', 'Actividad de Tenis', 1, 1, 1, 0, 0, 0, 0),
							   ('cinta', 'Actividad de Cinta', 0, 0, 0, 1, 1, 0, 0),
							   ('aerob', 'Actividad de Aerobic', 1, 0, 0, 0, 0, 1, 1)
GO

SELECT * FROM actividades
GO

-- Inserciones en socios
INSERT INTO socios VALUES ('Pedro', 'Pedrin Apellin', '12121212Q', '922111111', 50, 'natac', '08:20', NULL, GETDATE(), '2020-12-10'),
						  ('Raul', 'Segundo Raul', '23232323W', '922222222', DEFAULT, 'natac', '09:20', 'Tiene que irse pronto', GETDATE(), '2020-05-10'),
						  ('Laura', 'Romero Blanco', '34343434E', '922333333', 80, 'cicli', '14:31', NULL, GETDATE(), '2020-03-08'),
						  ('María', 'Fuentes', '45454545R', '922444444', 77, 'tenis', '10:10', NULL, GETDATE(), '2020-11-07'),
						  ('Juan', 'Arvelo Pérez', '56565656J', '922555555', 62, 'aerob', '12:35', NULL, GETDATE(), '2020-04-21')
GO

SELECT * FROM socios 
GO

-- 2) Inserta un socio con la cuota por defecto.
INSERT INTO socios VALUES ('Socio', 'Cuota por Defecto', '67676767P', '922888888', DEFAULT, 'aerob', '14:37', NULL, GETDATE(), '2020-03-07')
GO 
SELECT * FROM socios 
GO

-- 3) Intenta Insertar un socio con la cuota a valor 10 
INSERT INTO socios VALUES ('sError', 'Socio Error', '67676767P', '922888888', 10, 'aerob', '14:37', NULL, GETDATE(), '2020-03-07')
GO
-- No se puede insertar por la constraint u_dni

-- 4) Inserta  un socio que en los campos que lo permita tenga el valor null

INSERT INTO socios VALUES ('uNull', 'Socio de Null', '78787878P', '922999999', DEFAULT, 'natac', NULL, NULL, NULL, NULL)
GO
SELECT * FROM socios 
GO

-- 5) Inserta una actividad con los días de la semana con el valor por defecto. 
INSERT INTO actividades (id_actividad, descripcion) VALUES ('pesas', 'Actividad de Pesas')
GO
-- Equivale a poner:
-- INSERT INTO actividades VALUES ('pesas', 'Actividad de Pesas', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SELECT * FROM actividades
GO

-- 6) Modifica a la actividad con Id_actividad ponle el lunes y miércoles a 1 
-- Modificamos la actividad de Pesas añadida anteriormente
UPDATE actividades SET lunes = 1, miercoles = 1 WHERE id_actividad = 'pesas'
GO
SELECT * FROM actividades
GO

-- 7) Modifica la descripción de la actividad  con id_actividad a x 
UPDATE actividades SET descripcion = 'Descripción modificada' WHERE id_actividad = 'pesas'
GO
SELECT * FROM actividades
GO

-- 8) Intenta Eliminar la actividad con id_actividad x (asegurate que esa actividad tenga algún socio)
DELETE FROM actividades WHERE id_actividad = 'aerob'
GO
-- No se puede borrar por la constraint fk_actividad

-- 9) Inserta dos actividades que se impartan en domingo y viernes
INSERT INTO actividades VALUES ('kapoe', 'Actividad de Kapoeira', 0, 0, 0, 0, 1, 0, 1),
							   ('kunfu', 'Actividad de Kung-Fu', 0, 0, 0, 0, 1, 0, 1)
GO
SELECT * FROM actividades
GO

-- 10) Elimina todas las actividades que se impartan los domingos o los miércoles
-- Comprobación para ver cuáles no tienen socios asociados
-- SELECT * FROM actividades WHERE id_actividad NOT IN (SELECT actividad FROM socios)
-- GO
DELETE FROM actividades WHERE domingo = 1 OR miercoles = 1
GO
SELECT * FROM actividades
GO
-- No se pueden borrar debido a la constraint fk_actividad
-- 11) Elimina todas las actividades que se impartan los lunes y miércoles 
DELETE FROM actividades WHERE lunes = 1 AND miercoles = 1
GO
SELECT * FROM actividades
GO
-- No se pueden borrar debido a la constraint fk_actividad

-- 12) Modificale al socio con Id x la actividad que realiza 
SELECT * FROM socios WHERE id_socio = 6
GO
UPDATE socios SET actividad = 'kunfu' WHERE id_socio = 6
GO
SELECT * FROM socios WHERE id_socio = 6
GO

-- 13) Modifica la cuota de la actividad con Id_actividad x, ponle el valor 60
SELECT * FROM socios WHERE actividad = 'kunfu'
GO
UPDATE socios SET cuota = 60 WHERE actividad = 'kunfu'
GO
SELECT * FROM socios WHERE actividad = 'kunfu'
GO

-- 14) Intenta Modifica la cuota de la actividad con Id_actividad x, ponle el valor 20
SELECT * FROM socios WHERE actividad = 'natac'
GO
UPDATE socios SET cuota = 20 WHERE actividad = 'natac'
GO
SELECT * FROM socios WHERE actividad = 'natac'
GO
-- No se puede actualizar por la restricción de CHECK ck_cuota

-- 15) Incrementa en 3 € la cuota a todos los socios que hagan la actividad con id_actividad x
SELECT * FROM socios WHERE actividad = 'natac'
GO
UPDATE socios SET cuota = cuota + 3 WHERE actividad = 'natac'
GO
SELECT * FROM socios WHERE actividad = 'natac'
GO

-- 16) Incrementa en 10% cuota a todos los socios que hagan la actividad con id_actividad x 
SELECT * FROM socios WHERE actividad = 'natac'
GO
UPDATE socios SET cuota = cuota + (cuota * 0.1) WHERE actividad = 'natac'
GO
SELECT * FROM socios WHERE actividad = 'natac'
GO

-- 17) Decrementa la cuota del socio con id x en 2 €
SELECT * FROM socios WHERE id_socio = 6
GO
UPDATE socios SET cuota = cuota - 2 WHERE id_socio = 6
GO
SELECT * FROM socios WHERE id_socio = 6
GO

-- 18) Crea una tabla llamada socios_copia que será una copia de la tabla socios (incluyendo los registros), con una sola instrucción .Los siguientes ejercicios hazlos sobre esta tabla 
SELECT * INTO socios_copia FROM socios
GO

-- 19) Visualiza los registros de la tabla socios y fijate en el valor del último socio creado 
SELECT * FROM socios_copia
GO
-- El último id_socio es 8

-- 20) Elimina ese ultimo socio creado
DELETE FROM socios_copia WHERE id_socio = 8
GO
SELECT * FROM socios_copia
GO

-- 21) Inserta un nuevo socio (que ha ocurrido con el Id_socio)
INSERT INTO socios_copia VALUES ('UsuNuevo', 'Apellido Nuev', '66666666L', '922123456', 63.2, 'kunfu', NULL, NULL, NULL, NULL)
GO
SELECT * FROM socios_copia
GO
-- Se ha creado un nuevo socio con un Id_socio mayor que el anterior debido a la propiedad IDENTITY

-- 22) Elimina todos los registros de la tabla con delete 
DELETE FROM socios_copia
GO
SELECT * FROM socios_copia
GO

-- 23) Inserta un nuevo socio (que ha ocurrido con el Id_socio)
INSERT INTO socios_copia VALUES ('NuevUsu', 'Nuevo Ape', '12121212W', '922456789', 71, 'kunfu', NULL, NULL, NULL, NULL)
GO
SELECT * FROM socios_copia
GO
-- Se conserva el último valor de IDENTITY y, al añadir un nuevo registro, se le asigna el id_socio siguiente

-- 24) Elimina todos los registros con trúncate table
TRUNCATE TABLE socios_copia
GO
SELECT * FROM socios_copia
GO

-- 25) Inserta un nuevo socio (que ha ocurrido con el Id_socio)
INSERT INTO socios_copia VALUES ('NuevUsu', 'Nuevo Ape', '12121212W', '922456789', 71, 'kunfu', NULL, NULL, NULL, NULL)
GO
SELECT * FROM socios_copia
GO
-- El Id_socio se ha establecido en 1 debido a que TRUNCATE reinicia el valor de IDENTITY al primero

-- 26) Explica la diferencias entre delete y truncate
-- DELETE permite borrar campos individuales o la tabla completa. Cuando borra una tabla, no reinicia IDENTITY.
-- TRUNCATE vacía por completo una tabla y reiniciando IDENTITY a su primer valor

-- 27) Ponle al socio con id X la fecha de baja como el día actual y la de alta el 1/10/2019
SELECT * FROM socios_copia
GO
UPDATE socios_copia SET fechaBaja = GETDATE(), fechaAlta = '2019/10/1' WHERE id_socio = 1
GO
SELECT * FROM socios_copia
GO

-- 28) Inserta en socios_copia los socios de la tabla socios que tengan la actividad x
-- Usaremos la actividad natac
SELECT * FROM socios_copia
GO
INSERT socios_copia
	SELECT nombre, apellidos, dniSocio, telefono, cuota, actividad, horario, observaciones, fechaAlta, fechaBaja
	FROM socios WHERE actividad = 'natac'
GO
SELECT * FROM socios_copia
GO