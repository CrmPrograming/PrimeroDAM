-- César Ravelo Martínez


-- #######################################################

--						BD CONSTRUCCION

-- #######################################################

IF DB_ID('construccion') IS NOT NULL
	BEGIN
		DROP DATABASE construccion
	END
GO

CREATE DATABASE construccion
GO

USE construccion
GO

-- CREACIÓN DE LA TABLA TRABAJADOR
-- Clave primaria id_trabajador
-- id_supervisor es el id del trabajador que lo supervisa
CREATE TABLE trabajador (
			   id_trabajador INT IDENTITY(100, 1) CONSTRAINT pk_idtrabajador PRIMARY KEY,
			   nombre VARCHAR(50),
			   tarifa_hora NUMERIC(6, 2) CONSTRAINT ck_tarifahora CHECK ((tarifa_hora >= 0) AND (tarifa_hora < 1000)),
			   oficio CHAR(15) CONSTRAINT ck_oficio CHECK (oficio IN ('carpintero', 'electricista', 'fontanero', 'albañil')),
			   id_supervisor INT CONSTRAINT fk_idsupervisor FOREIGN KEY REFERENCES trabajador(id_trabajador))
GO

-- CREACIÓN DE LA TABLA EDIFICIO
CREATE TABLE edificio (
				id_edificio CHAR(5) CONSTRAINT pk_id_edificio PRIMARY KEY,
				direccion VARCHAR(60),
				tipo CHAR(10) CONSTRAINT ck_tipo CHECK (tipo IN ('Oficina', 'Residencia', 'Comercio', 'Almacen')),
				nivel_calidad INT CONSTRAINT ck_nivel_calidad CHECK (nivel_calidad BETWEEN 1 AND 5),
				categoria CHAR CONSTRAINT ck_categoria CHECK (categoria IN ('A', 'B', 'C')))
GO

-- CREACIÓN DE LA TABLA ASIGNACION
CREATE TABLE asignacion (
				id_asignacion INT IDENTITY(1, 1) CONSTRAINT pk_id_asignacion PRIMARY KEY,
				id_trabajador INT CONSTRAINT fk_id_trabajador FOREIGN KEY REFERENCES trabajador(id_trabajador),
				id_edificio CHAR(5) CONSTRAINT fk_id_edificio FOREIGN KEY REFERENCES edificio(id_edificio),
				fecha_inicio DATE,
				num_dias INT) 
GO

-- Inserción de 5 valores en la tabla trabajador
INSERT trabajador(nombre, tarifa_hora, oficio) VALUES ('Paco', 23.8, 'carpintero')
INSERT trabajador(nombre, tarifa_hora, oficio) VALUES ('Juan', 75, 'fontanero')
INSERT INTO trabajador VALUES ('Luis', 50.0, 'carpintero', 100),
							  ('Carlos', 41.5, 'electricista', 100),
							  ('Juan', 17.43, 'fontanero', 101)
SELECT * FROM trabajador
GO

-- Inserción de 5 valores en la tabla edificio
INSERT edificio  VALUES ('eRAVA', 'Calle Ravarada', 'Oficina', 4, 'A'),
						('ePERE', 'Avenida Pérez', 'Residencia', 2, 'C'),
						('cMALV', 'Casa Malva nº 2', 'Residencia', 3, 'B'),
						('eALTA', 'Edificio Peralta', 'Oficina', 3, 'A'),
						('cGATO', 'Casa Gato Goloso', 'Comercio', 1, 'C')
SELECT * FROM edificio
GO

-- Inserción de 8 valores en la tabla asignacion
INSERT asignacion VALUES (102, 'cGato', GETDATE(), 20)
INSERT asignacion VALUES (102, 'cMALV', '2019/11/27', 5)
INSERT asignacion VALUES (103, 'eRAVA', '2019/11/07', 2)
INSERT asignacion VALUES (103, 'eRAVA', '2019/11/11', 2)
INSERT asignacion VALUES (104, 'eRAVA', '2019/11/11', 8)
INSERT asignacion VALUES (104, 'eALTA', '2019/12/01', 14)
INSERT asignacion VALUES (100, 'eALTA', '2019/12/01', 14)
INSERT asignacion VALUES (101, 'eRAVA', '2019/11/20', 1)
SELECT * FROM asignacion
GO