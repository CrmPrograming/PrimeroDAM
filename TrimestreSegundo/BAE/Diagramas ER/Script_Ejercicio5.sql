/*
Created: 18/01/2020
Modified: 20/01/2020
Model: Microsoft SQL Server 2014
Database: MS SQL Server 2014
*/

CREATE DATABASE Startrek
GO
USE Startrek
GO

-- Create tables section -------------------------------------------------

-- Table Temporadas

CREATE TABLE [Temporadas]
(
 [codTemporada] Char(5) NOT NULL,
 [descripcion] Varchar(30) NOT NULL
)
go

-- Add keys for table Temporadas

ALTER TABLE [Temporadas] ADD CONSTRAINT [PK_Temporadas] PRIMARY KEY ([codTemporada])
go

-- Table Capitulos

CREATE TABLE [Capitulos]
(
 [codCap] Char(5) NOT NULL,
 [titulo] Varchar(30) NOT NULL,
 [orden] Int NOT NULL,
 [fechaPrimEm] Date NOT NULL,
 [codTemporada] Char(5) NOT NULL
)
go

-- Create indexes for table Capitulos

CREATE INDEX [IX_Relationship4] ON [Capitulos] ([codTemporada])
go

-- Add keys for table Capitulos

ALTER TABLE [Capitulos] ADD CONSTRAINT [PK_Capitulos] PRIMARY KEY ([codCap])
go

-- Table Planetas

CREATE TABLE [Planetas]
(
 [codPlaneta] Char(5) NOT NULL,
 [nombre] Varchar(30) NOT NULL,
 [problema] Varchar(255) NULL,
 [codGalaxia] Char(5) NOT NULL
)
go

-- Create indexes for table Planetas

CREATE INDEX [IX_Relationship1] ON [Planetas] ([codGalaxia])
go

-- Add keys for table Planetas

ALTER TABLE [Planetas] ADD CONSTRAINT [PK_Planetas] PRIMARY KEY ([codPlaneta])
go

-- Table Galaxias

CREATE TABLE [Galaxias]
(
 [codGalaxia] Char(5) NOT NULL,
 [nombre] Varchar(30) NOT NULL
)
go

-- Add keys for table Galaxias

ALTER TABLE [Galaxias] ADD CONSTRAINT [PK_Galaxias] PRIMARY KEY ([codGalaxia])
go

-- Table Naves

CREATE TABLE [Naves]
(
 [codNave] Char(5) NOT NULL,
 [nombre] Varchar(30) NOT NULL,
 [nTripulantes] Int NOT NULL
)
go

-- Add keys for table Naves

ALTER TABLE [Naves] ADD CONSTRAINT [PK_Naves] PRIMARY KEY ([codNave])
go

-- Table Directores

CREATE TABLE [Directores]
(
 [codDirector] Char(5) NOT NULL,
 [nombre] Varchar(30) NOT NULL
)
go

-- Add keys for table Directores

ALTER TABLE [Directores] ADD CONSTRAINT [PK_Directores] PRIMARY KEY ([codDirector])
go

-- Table Peliculas

CREATE TABLE [Peliculas]
(
 [codPelicula] Char(5) NOT NULL,
 [anoLanzamiento] Date NOT NULL,
 [titulo] Varchar(30) NOT NULL,
 [codDirector] Char(5) NOT NULL
)
go

-- Create indexes for table Peliculas

CREATE INDEX [IX_Relationship5] ON [Peliculas] ([codDirector])
go

-- Add keys for table Peliculas

ALTER TABLE [Peliculas] ADD CONSTRAINT [PK_Peliculas] PRIMARY KEY ([codPelicula])
go

-- Table Graduaciones Militares

CREATE TABLE [Graduaciones Militares]
(
 [codGM] Char(5) NOT NULL,
 [descripcion] Varchar(30) NOT NULL
)
go

-- Add keys for table Graduaciones Militares

ALTER TABLE [Graduaciones Militares] ADD CONSTRAINT [PK_Graduaciones Militares] PRIMARY KEY ([codGM])
go

-- Table Razas

CREATE TABLE [Razas]
(
 [codRaza] Char(5) NOT NULL,
 [descripcion] Varchar(30) NOT NULL
)
go

-- Add keys for table Razas

ALTER TABLE [Razas] ADD CONSTRAINT [PK_Razas] PRIMARY KEY ([codRaza])
go

-- Table Nacionalidades

CREATE TABLE [Nacionalidades]
(
 [codNacionalidad] Char(5) NOT NULL,
 [nombre] Varchar(30) NOT NULL
)
go

-- Add keys for table Nacionalidades

ALTER TABLE [Nacionalidades] ADD CONSTRAINT [PK_Nacionalidades] PRIMARY KEY ([codNacionalidad])
go

-- Table Actores

CREATE TABLE [Actores]
(
 [codActor] Char(5) NOT NULL,
 [nombre] Varchar(30) NOT NULL,
 [apellidos] Varchar(30) NOT NULL,
 [fechaNacimiento] Date NOT NULL,
 [codNacionalidad] Char(5) NOT NULL
)
go

-- Create indexes for table Actores

CREATE INDEX [IX_Relationship6] ON [Actores] ([codNacionalidad])
go

-- Add keys for table Actores

ALTER TABLE [Actores] ADD CONSTRAINT [PK_Actores] PRIMARY KEY ([codActor])
go

-- Table Personajes

CREATE TABLE [Personajes]
(
 [codPersonaje] Char(5) NOT NULL,
 [nombre] Varchar(30) NOT NULL,
 [codActor] Char(5) NULL,
 [codRaza] Char(5) NULL,
 [codGM] Char(5) NULL,
 [superior] Char(5) NULL
)
go

-- Create indexes for table Personajes

CREATE INDEX [IX_Relationship7] ON [Personajes] ([superior])
go

CREATE INDEX [IX_Relationship8] ON [Personajes] ([codActor])
go

CREATE INDEX [IX_Relationship9] ON [Personajes] ([codRaza])
go

CREATE INDEX [IX_Relationship10] ON [Personajes] ([codGM])
go

-- Add keys for table Personajes

ALTER TABLE [Personajes] ADD CONSTRAINT [PK_Personajes] PRIMARY KEY ([codPersonaje])
go

-- Table Viajado en

CREATE TABLE [Viajado en]
(
 [codPlaneta] Char(5) NOT NULL,
 [codNave] Char(5) NOT NULL
)
go

-- Add keys for table Viajado en

ALTER TABLE [Viajado en] ADD CONSTRAINT [PK_Viajado en] PRIMARY KEY ([codPlaneta],[codNave])
go

-- Table Visita

CREATE TABLE [Visita]
(
 [codPlaneta] Char(5) NOT NULL,
 [codCap] Char(5) NOT NULL
)
go

-- Add keys for table Visita

ALTER TABLE [Visita] ADD CONSTRAINT [PK_Visita] PRIMARY KEY ([codPlaneta],[codCap])
go

-- Table Aparece

CREATE TABLE [Aparece]
(
 [codCap] Char(5) NOT NULL,
 [codPersonaje] Char(5) NOT NULL
)
go

-- Add keys for table Aparece

ALTER TABLE [Aparece] ADD CONSTRAINT [PK_Aparece] PRIMARY KEY ([codCap],[codPersonaje])
go

-- Table Participa

CREATE TABLE [Participa]
(
 [codPersonaje] Char(5) NOT NULL,
 [codPelicula] Char(5) NOT NULL,
 [protagonista] Bit DEFAULT 0 NOT NULL
)
go

-- Add keys for table Participa

ALTER TABLE [Participa] ADD CONSTRAINT [PK_Participa] PRIMARY KEY ([codPersonaje],[codPelicula])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Planetas] ADD CONSTRAINT [Relationship1] FOREIGN KEY ([codGalaxia]) REFERENCES [Galaxias] ([codGalaxia]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Viajado en] ADD CONSTRAINT [Relationship2] FOREIGN KEY ([codPlaneta]) REFERENCES [Planetas] ([codPlaneta]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Viajado en] ADD CONSTRAINT [Relationship3] FOREIGN KEY ([codNave]) REFERENCES [Naves] ([codNave]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Capitulos] ADD CONSTRAINT [Relationship4] FOREIGN KEY ([codTemporada]) REFERENCES [Temporadas] ([codTemporada]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Peliculas] ADD CONSTRAINT [Relationship5] FOREIGN KEY ([codDirector]) REFERENCES [Directores] ([codDirector]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Actores] ADD CONSTRAINT [Relationship6] FOREIGN KEY ([codNacionalidad]) REFERENCES [Nacionalidades] ([codNacionalidad]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Personajes] ADD CONSTRAINT [Relationship7] FOREIGN KEY ([superior]) REFERENCES [Personajes] ([codPersonaje]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Personajes] ADD CONSTRAINT [Relationship8] FOREIGN KEY ([codActor]) REFERENCES [Actores] ([codActor]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Personajes] ADD CONSTRAINT [Relationship9] FOREIGN KEY ([codRaza]) REFERENCES [Razas] ([codRaza]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Personajes] ADD CONSTRAINT [Relationship10] FOREIGN KEY ([codGM]) REFERENCES [Graduaciones Militares] ([codGM]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Visita] ADD CONSTRAINT [Relationship11] FOREIGN KEY ([codPlaneta]) REFERENCES [Planetas] ([codPlaneta]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Visita] ADD CONSTRAINT [Relationship12] FOREIGN KEY ([codCap]) REFERENCES [Capitulos] ([codCap]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Aparece] ADD CONSTRAINT [Relationship13] FOREIGN KEY ([codCap]) REFERENCES [Capitulos] ([codCap]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Aparece] ADD CONSTRAINT [Relationship14] FOREIGN KEY ([codPersonaje]) REFERENCES [Personajes] ([codPersonaje]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Participa] ADD CONSTRAINT [Relationship15] FOREIGN KEY ([codPersonaje]) REFERENCES [Personajes] ([codPersonaje]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Participa] ADD CONSTRAINT [Relationship16] FOREIGN KEY ([codPelicula]) REFERENCES [Peliculas] ([codPelicula]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



-- Sentencias de inserción -------------------------------------------------

-- Nacionalidades
INSERT INTO Nacionalidades VALUES ('ESPAN', 'España');
INSERT INTO Nacionalidades VALUES ('PORTU', 'Portugal');
INSERT INTO Nacionalidades VALUES ('ALEMA', 'Alemania');
INSERT INTO Nacionalidades VALUES ('INGLA', 'Inglaterra');

-- Directores
INSERT INTO Directores VALUES ('RODPA', 'Rodolfo Pajaroenmano');
INSERT INTO Directores VALUES ('PERAV', 'Pedro Ravelo');
INSERT INTO Directores VALUES ('LAUMA', 'Laura Martín');

-- Graduaciones Militares
INSERT INTO [Graduaciones Militares] VALUES ('RECUL', 'Recluta');
INSERT INTO [Graduaciones Militares] VALUES ('SOLDA', 'Soldado');
INSERT INTO [Graduaciones Militares] VALUES ('SARGE', 'Sargento');
INSERT INTO [Graduaciones Militares] VALUES ('ALFER', 'Alférez');
INSERT INTO [Graduaciones Militares] VALUES ('TENIE', 'Teniente');
INSERT INTO [Graduaciones Militares] VALUES ('COMAN', 'Comandante');

-- Razas
INSERT INTO Razas VALUES ('HUMAN', 'Humano');
INSERT INTO Razas VALUES ('BORGS', 'Borg');
INSERT INTO Razas VALUES ('GORNS', 'Gorn');
INSERT INTO Razas VALUES ('KLING', 'Klingon');

-- Naves
INSERT INTO Naves VALUES ('ALBON', 'Albóndiga sideral', 5);
INSERT INTO Naves VALUES ('CROQT', 'Croqueta espacial', 20);
INSERT INTO Naves VALUES ('ESPAG', 'Espaguetti lácteo', 17);

-- Galaxias
INSERT INTO Galaxias VALUES ('GALPI', 'Galaxia PI');
INSERT INTO Galaxias VALUES ('GALOM', 'Galaxia Omega');
INSERT INTO Galaxias VALUES ('GALKA', 'Galaxia Kappa');
INSERT INTO Galaxias VALUES ('GALDE', 'Galaxia Delta');
INSERT INTO Galaxias VALUES ('GALTA', 'Galaxia Tango');

-- Temporadas
INSERT INTO Temporadas VALUES ('TEMP1', 'Temporada Uno');
INSERT INTO Temporadas VALUES ('TEMP2', 'Temporada Dos');
INSERT INTO Temporadas VALUES ('TEMP3', 'Temporada Tres');
INSERT INTO Temporadas VALUES ('TEMP4', 'Temporada Cuatro');

-- Películas
INSERT INTO Peliculas VALUES ('PELVP', '1987-11-23', 'La venganza patil', 'LAUMA');
INSERT INTO Peliculas VALUES ('PELLA', '2000-10-30', 'Lluvia de albóndigas', 'LAUMA');
INSERT INTO Peliculas VALUES ('PELVV', '1991-07-11', 'Viaje de vuelta', 'PERAV');
INSERT INTO Peliculas VALUES ('PELOF', '2010-05-11', 'Operación: Fracaso', 'PERAV');

-- Actores
INSERT INTO Actores VALUES ('MANFM', 'Manolo', 'Francisco Melendez', '1987-12-01', 'ESPAN');
INSERT INTO Actores VALUES ('MARAP', 'María', 'Arteaga Pereira', '1986-05-21', 'ESPAN');
INSERT INTO Actores VALUES ('JUAHE', 'Juana', 'Hernández', '1971-03-05', 'ESPAN');

INSERT INTO Actores VALUES ('PALFM', 'Paula', 'Francisco Melendez', '1969-04-12', 'ALEMA');
INSERT INTO Actores VALUES ('ISROM', 'Isaac', 'Romanov', '1974-08-18', 'ALEMA');
INSERT INTO Actores VALUES ('NATHE', 'Natacha', 'HET', '1986-12-01', 'ALEMA');

INSERT INTO Actores VALUES ('FERRM', 'Fernando', 'Rav Mar', '1987-12-01', 'INGLA');
INSERT INTO Actores VALUES ('SOBRI', 'Sofía', 'Brigitta', '1974-04-01', 'INGLA');

-- Planetas
INSERT INTO Planetas VALUES ('DELT1', 'Delta 1', 'Prepared is me marianne pleasure likewise debating. Wonder an unable except better stairs do ye admire.', 'GALDE');
INSERT INTO Planetas VALUES ('KAPP1', 'Kappa 1', 'Un muy mal día para nuestro increíble capitan tortugoso.', 'GALKA');
INSERT INTO Planetas VALUES ('PIPL1', 'PI 1', NULL, 'GALPI');
INSERT INTO Planetas VALUES ('TANG1', 'Tango 1', 'Projecting surrounded literature yet delightful alteration but bed men. Open are from long why cold. If must snug by upon sang loud left.', 'GALTA');

INSERT INTO Planetas VALUES ('DELT2', 'Delta 2', NULL, 'GALDE');
INSERT INTO Planetas VALUES ('KAPP2', 'Kappa 2', NULL, 'GALKA');
INSERT INTO Planetas VALUES ('PIPL2', 'PI 2', NULL, 'GALPI');

INSERT INTO Planetas VALUES ('DELT3', 'Delta 3', 'Tampoco es que fuera gran cosa', 'GALDE');
INSERT INTO Planetas VALUES ('KAPP3', 'Kappa 3', 'Rotura en el generador de fisión cuántico', 'GALKA');

INSERT INTO Planetas VALUES ('DELT4', 'Delta 4', 'Volver a buscar a chewie', 'GALDE');

-- Viajado en
INSERT INTO [Viajado en] VALUES ('DELT1', 'ALBON');
INSERT INTO [Viajado en] VALUES ('DELT2', 'ALBON');
INSERT INTO [Viajado en] VALUES ('DELT3', 'CROQT');
INSERT INTO [Viajado en] VALUES ('KAPP1', 'ESPAG');
INSERT INTO [Viajado en] VALUES ('KAPP2', 'CROQT');
INSERT INTO [Viajado en] VALUES ('PIPL1', 'ESPAG');
INSERT INTO [Viajado en] VALUES ('TANG1', 'ALBON');

-- Capítulos
INSERT INTO Capitulos VALUES ('CP1T1', 'La venganza del chocolate', 1, '1990-11-21', 'TEMP1');
INSERT INTO Capitulos VALUES ('CP2T1', 'La venganza del chocolate 2', 2, '1990-11-21', 'TEMP1');
INSERT INTO Capitulos VALUES ('CP1T2', 'Mariposas de caramelo', 3, '1991-07-21', 'TEMP2');
INSERT INTO Capitulos VALUES ('CP2T2', 'Mariposas de caramelo 2', 4, '1991-07-21', 'TEMP2');
INSERT INTO Capitulos VALUES ('CP1T3', 'Se acabó', 5, '1992-07-21', 'TEMP3');
INSERT INTO Capitulos VALUES ('CP2T3', 'Volverá', 6, '1992-07-25', 'TEMP3');

-- Visita
INSERT INTO Visita SELECT TOP 15 codPlaneta, codCap FROM Capitulos CROSS JOIN Planetas;

-- Personajes
INSERT INTO Personajes VALUES ('LIRST', 'Lilya Rihanna Stevens', 'ISROM', 'BORGS', 'COMAN', NULL);
INSERT INTO Personajes VALUES ('BERVA', 'Bernard Vincent Archer', 'NATHE', 'BORGS', 'ALFER', 'LIRST');
INSERT INTO Personajes VALUES ('DORSV', 'Dorothea Sigiheri Van Hassel', 'PALFM', 'HUMAN', 'SARGE', 'LIRST');
INSERT INTO Personajes VALUES ('FAUCK', 'Faustus Charalampos Kaufman', 'JUAHE', 'GORNS', 'SOLDA', 'BERVA');
INSERT INTO Personajes VALUES ('LAUNF', 'Lauri Nohemi Ferro', 'MANFM', 'HUMAN', 'ALFER', 'DORSV');
INSERT INTO Personajes VALUES ('TAGMW', 'Tagwanibisan Matheo Wahner', 'MARAP', 'GORNS', 'RECUL', 'LIRST');
INSERT INTO Personajes VALUES ('EJIIC', 'Ejiro Isabella Cervantes', 'FERRM', 'BORGS', 'SOLDA', 'LAUNF');
INSERT INTO Personajes VALUES ('MANLL', 'Manon Lucia Láník', 'SOBRI', 'KLING', 'RECUL', 'BERVA');
INSERT INTO Personajes VALUES ('SHECK', 'Sherlock Chiamaka Kopp', 'ISROM', 'KLING', 'SOLDA', 'TAGMW');
INSERT INTO Personajes VALUES ('SYLDH', 'Sylvester Deimos Harrison', 'PALFM', 'BORGS', 'TENIE', NULL);
INSERT INTO Personajes VALUES ('KUMWC', 'Kumar Wemba Cornett', 'MARAP', 'HUMAN', 'RECUL', 'SYLDH');
INSERT INTO Personajes VALUES ('PINSO', 'Pino Sven Orosz', 'SOBRI', 'HUMAN', 'SOLDA', 'DORSV');

-- Aparece
INSERT INTO Aparece SELECT TOP 30 codCap, codPersonaje FROM Capitulos CROSS JOIN Personajes

-- Participa
INSERT INTO Participa values ('BERVA', 'PELLA', 0);
INSERT INTO Participa values ('BERVA', 'PELVP', 1);

INSERT INTO Participa values ('LAUNF', 'PELVP', 0);
INSERT INTO Participa values ('LAUNF', 'PELOF', 1);

INSERT INTO Participa values ('LIRST', 'PELOF', 1);
INSERT INTO Participa values ('LIRST', 'PELVV', 0);

INSERT INTO Participa values ('KUMWC', 'PELVV', 1);
INSERT INTO Participa values ('KUMWC', 'PELLA', 0);
INSERT INTO Participa values ('KUMWC', 'PELOF', 0);

INSERT INTO Participa values ('MANLL', 'PELVP', 0);
INSERT INTO Participa values ('MANLL', 'PELVV', 0);
INSERT INTO Participa values ('MANLL', 'PELLA', 0);

INSERT INTO Participa values ('TAGMW', 'PELLA', 0);
INSERT INTO Participa values ('TAGMW', 'PELOF', 0);
INSERT INTO Participa values ('TAGMW', 'PELVV', 0);

-- Sentencias de consultas -------------------------------------------------

-- Visualiza los actores junto al nombre del personaje que interpreta y el nombre del personaje del que depende.
SELECT a.nombre AS 'Actor', p.nombre AS 'Personaje', s.nombre AS 'Superior'
FROM Actores AS a
	INNER JOIN Personajes AS p ON a.codActor = p.codActor
	INNER JOIN Personajes AS s ON s.codPersonaje = p.superior

-- Visualiza el nombre de las películas junto con el nombre del actor y el personaje que representa haciendo de protagonista.
SELECT pel.titulo AS 'Título', a.nombre AS 'Actor', p.nombre AS 'Personaje'
FROM Actores AS a
	INNER JOIN Personajes AS p ON p.codActor = a.codActor
	INNER JOIN Participa AS par ON p.codPersonaje = par.codPersonaje
	INNER JOIN Peliculas AS pel ON par.codPelicula = pel.codPelicula
WHERE par.protagonista = 1

-- Visualiza todos los capítulos emitidos antes de una determinada fecha junto con su titulo, los personajes que participan
-- en el mismo y la graduación que tiene cada uno.
SELECT c.codCap AS 'Capítulo', c.titulo AS 'Título Capítulo', p.nombre AS 'Personaje', gm.descripcion AS 'Graduación Militar'
FROM [Graduaciones Militares] AS gm
	INNER JOIN Personajes AS p ON p.codGM = gm.codGM
	INNER JOIN Aparece AS a ON p.codPersonaje = a.codPersonaje
	INNER JOIN Capitulos AS c ON a.codCap = c.codCap
WHERE c.fechaPrimEm < '1991-05-10'

-- Visualiza el titulo de los capítulos con el nombre del planeta que visitó y el nombre de la nave en la cual viajaban.
SELECT c.titulo AS 'Título', p.nombre AS 'Planeta', n.nombre AS 'Nave'
FROM Capitulos AS c
	INNER JOIN Visita ON c.codCap = Visita.codCap
	INNER JOIN Planetas AS p ON Visita.codPlaneta = p.codPlaneta
	INNER JOIN [Viajado en] ON p.codPlaneta = [Viajado en].codPlaneta
	INNER JOIN Naves AS n ON [Viajado en].codNave = n.codNave