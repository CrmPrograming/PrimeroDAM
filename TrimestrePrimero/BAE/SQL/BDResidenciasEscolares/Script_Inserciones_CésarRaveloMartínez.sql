-- César Ravelo Martínez


-- #######################################################

--				EJERCICIO 4: BD GIMNASIO INSERCIONES

-- #######################################################

USE BDResidenciasEscolares 
GO

-- Tabla Estudiantes
INSERT INTO estudiantes VALUES (1, 'betty', '11111111P', '666666666', 'betty@gmail.com', 'F')
INSERT INTO estudiantes VALUES (2, 'raul', '22222222Z', '474747474', 'raul_listoy@gmail.com', 'M')
INSERT INTO estudiantes VALUES (3, 'pedro', '33333333T', '232323232', 'pedro98@gmail.com', NULL)
INSERT INTO estudiantes VALUES (4, 'laura', '44444444W', '131313131', 'peliroja_2@gmail.com', 'F')
INSERT INTO estudiantes VALUES (5, 'carlos alberto', '78346279Q', '211313131', 'calberto@gmail.com', 'M')
INSERT INTO estudiantes VALUES (6, 'manuel ravelo', '12457881P', '453467122', 'mravelo@telefonica.net', 'M')
INSERT INTO estudiantes VALUES (7, 'elena prieto', '89734174H', '424267193', 'priet@yahoo.es', 'F')
GO

SELECT * FROM estudiantes
GO

-- Tabla Universidades
INSERT INTO universidades VALUES ('ULoren', 'Universidad de Lorenzo', '922232323')
INSERT INTO universidades VALUES ('ULagun', 'Universidad de La Laguna', '922454545')
INSERT INTO universidades VALUES ('UMadri', 'Universidad de Madrid', '938215673')
INSERT INTO universidades VALUES ('UGranc', 'Universidad de Gran Canaria', '928345871')
INSERT INTO universidades VALUES ('UToled', 'Universidad de Toledo', '941874532')
INSERT INTO universidades VALUES ('UGrana', 'Universidad de Granada', '918236591')
GO

SELECT * FROM universidades
GO

-- Tabla Residencias
INSERT INTO residencias VALUES ('Residencia Pepe', 'ULoren', 587, NULL, 80, 'Rodolfo', 'masculino')
INSERT INTO residencias VALUES ('Hermana Mayor', 'ULoren', 300, 1, 45, 'María', 'femenino')
INSERT INTO residencias VALUES ('Los castigados', 'ULagun', 423, 0, 74, 'Rodolfo', 'masculino')
INSERT INTO residencias VALUES ('Guachinche', 'ULagun', 227, 1, 23 , 'Alberto', 'masculino')
INSERT INTO residencias VALUES ('Familia Feliz', 'ULagun', 364, 0, 23 , 'Xin Lu', 'masculino')
INSERT INTO residencias VALUES ('Capitan Primero', 'UMadri', 466, 0, 120, 'Estefanía', 'femenino')
INSERT INTO residencias VALUES ('Todo Rico', 'UGranc', 331, 1, 222, 'Xin Ga', 'masculino')
INSERT INTO residencias VALUES ('Casa Hogar', 'UToled', 127, 1, 20, 'Felipa', 'femenino')
GO

SELECT * FROM residencias 
GO

-- Tabla Estancias
INSERT INTO estancias VALUES (1, 1, GETDATE(), '23/12/2020', 45, NULL, DEFAULT)
INSERT INTO estancias VALUES (2, 1, GETDATE(), '12/12/2020', 33, 'Pago pendiente', 12)
INSERT INTO estancias VALUES (1, 4, '26/05/2017', '08/09/2029', 54, 'massa quis augue luctus tincidunt nulla mollis', 10)
INSERT INTO estancias VALUES (4, 5, '05/12/2011', '17/02/2024', 63, 'enim lorem ipsum dolor sit amet', 17)
INSERT INTO estancias VALUES (3, 3, '15/06/2009', '16/02/2026', 83, 'aenean sit amet justo morbi', 3)
INSERT INTO estancias VALUES (5, 6, '20/03/2013', '07/08/2027', 61, 'magnis', 16)
INSERT INTO estancias VALUES (5, 6, '28/03/2017', '11/02/2025', 65, 'sit amet erat nulla tempus vivamus in felis', 15)
INSERT INTO estancias VALUES (3, 3, '09/07/2012', '01/11/2028', 68, 'odio justo sollicitudin ut', 8)
INSERT INTO estancias VALUES (1, 4, '04/08/2009', '25/08/2020', 87, 'enim in tempor turpis', 9)
INSERT INTO estancias VALUES (4, 1, '18/05/2018', '13/07/2023', 75, 'interdum mauris ullamcorper purus sit', 4)
GO

INSERT INTO estancias DEFAULT VALUES

SELECT * FROM residencias 
GO