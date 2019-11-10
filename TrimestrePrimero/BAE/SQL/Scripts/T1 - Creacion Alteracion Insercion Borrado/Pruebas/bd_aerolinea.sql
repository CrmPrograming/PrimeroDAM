CREATE DATABASE pruebas
GO
USE pruebas
GO

/* ##############################

		EJEMPLO BD AEROLÍNEA
	
	############################
*/

-- CREACIÓN TABLA CLIENTE
CREATE TABLE cliente (idcliente INT IDENTITY(1, 1) CONSTRAINT pk_idcliente PRIMARY KEY,
					  nombre VARCHAR(20) NOT NULL,
					  apellidos VARCHAR(30) NOT NULL,
					  dni CHAR(9) NOT NULL,
					  tlf CHAR(9) NOT NULL,
					  CONSTRAINT c_tlf CHECK (tlf NOT LIKE '%[^0-9]%'))
GO

-- CREACIÓN TABLA AEROLÍNEA
CREATE TABLE aerolinea (idaero CHAR(5) CONSTRAINT pk_aero PRIMARY KEY,
						nombre VARCHAR(30))
GO

-- CREACIÓN TABLA AVIONES
CREATE TABLE aviones (idaero CHAR(5),
					  idavion INT IDENTITY(1, 1),
					  numero_plazas INT NOT NULL,
					  buisness BIT CONSTRAINT d_buisness DEFAULT(0),
					  CONSTRAINT pk_aviones PRIMARY KEY (idaero, idavion),
					  CONSTRAINT fk_idaero FOREIGN KEY (idaero) REFERENCES aerolinea(idaero),
					  CONSTRAINT ck_numero_plazas CHECK (numero_plazas > 0)) 
GO

-- CREACIÓN TABLA VUELO
CREATE TABLE vuelo (idvuelo INT IDENTITY(1, 1) CONSTRAINT pk_idvuelo PRIMARY KEY,
					idaero CHAR(5),
					idavion INT,
					destino CHAR(5) NOT NULL,
					fecha DATE NOT NULL CONSTRAINT d_fecha DEFAULT (GETDATE()),
					CONSTRAINT c_fecha CHECK (fecha >= GETDATE()),
					CONSTRAINT fk_avion FOREIGN KEY (idaero, idavion) REFERENCES aviones(idaero, idavion),
					CONSTRAINT u_vuelo UNIQUE (idaero, idavion, destino, fecha))
GO

-- CREACIÓN TABLA PASAJE
CREATE TABLE pasaje (idcliente INT,
					 idvuelo INT,
					 CONSTRAINT fk_cliente FOREIGN KEY (idcliente) REFERENCES cliente(idcliente),
					 CONSTRAINT fk_vuelo FOREIGN KEY (idvuelo) REFERENCES vuelo(idvuelo),
					 CONSTRAINT pk_pasaje PRIMARY KEY (idcliente, idvuelo))
GO

-- ALTERACIONES

-- Añadir a la tabla aerolinea el nombre del director
ALTER TABLE aerolinea ADD director VARCHAR(30)
GO
