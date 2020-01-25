/*
Created: 18/01/2020
Modified: 25/01/2020
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
 [codGM] Char(5) NULL,
 [superior] Char(5) NULL
)
go

-- Create indexes for table Personajes

CREATE INDEX [IX_Relationship7] ON [Personajes] ([superior])
go

CREATE INDEX [IX_Relationship8] ON [Personajes] ([codActor])
go

CREATE INDEX [IX_Relationship10] ON [Personajes] ([codGM])
go

-- Add keys for table Personajes

ALTER TABLE [Personajes] ADD CONSTRAINT [PK_Personajes] PRIMARY KEY ([codPersonaje])
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

-- Table Vulcanos

CREATE TABLE [Vulcanos]
(
 [fechaGraduacion] Date NOT NULL,
 [mentor] Char(5) NULL,
 [codPersonaje] Char(5) NOT NULL
)
go

-- Create indexes for table Vulcanos

CREATE INDEX [IX_Relationship18] ON [Vulcanos] ([mentor])
go

-- Add keys for table Vulcanos

ALTER TABLE [Vulcanos] ADD CONSTRAINT [PK_Vulcanos] PRIMARY KEY ([codPersonaje])
go

-- Table Humanos

CREATE TABLE [Humanos]
(
 [anoNacimiento] Int NOT NULL,
 [codPersonaje] Char(5) NOT NULL
)
go

-- Add keys for table Humanos

ALTER TABLE [Humanos] ADD CONSTRAINT [PK_Humanos] PRIMARY KEY ([codPersonaje])
go

-- Table Klingons

CREATE TABLE [Klingons]
(
 [fechaUltimoCombate] Date NOT NULL,
 [codPersonaje] Char(5) NOT NULL,
 [codPlaneta] Char(5) NULL
)
go

-- Create indexes for table Klingons

CREATE INDEX [IX_Relationship25] ON [Klingons] ([codPlaneta])
go

-- Add keys for table Klingons

ALTER TABLE [Klingons] ADD CONSTRAINT [PK_Klingons] PRIMARY KEY ([codPersonaje])
go

-- Table Viajan

CREATE TABLE [Viajan]
(
 [codCap] Char(5) NOT NULL,
 [codPlaneta] Char(5) NOT NULL,
 [problema] Varchar(255) NULL
)
go

-- Add keys for table Viajan

ALTER TABLE [Viajan] ADD CONSTRAINT [PK_Viajan] PRIMARY KEY ([codCap],[codPlaneta])
go

-- Table Viajado en

CREATE TABLE [Viajado en]
(
 [codCap] Char(5) NOT NULL,
 [codPlaneta] Char(5) NOT NULL,
 [codNave] Char(5) NOT NULL
)
go

-- Add keys for table Viajado en

ALTER TABLE [Viajado en] ADD CONSTRAINT [PK_Viajado en] PRIMARY KEY ([codCap],[codPlaneta],[codNave])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Planetas] ADD CONSTRAINT [Relationship1] FOREIGN KEY ([codGalaxia]) REFERENCES [Galaxias] ([codGalaxia]) ON UPDATE NO ACTION ON DELETE NO ACTION
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



ALTER TABLE [Personajes] ADD CONSTRAINT [Relationship10] FOREIGN KEY ([codGM]) REFERENCES [Graduaciones Militares] ([codGM]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Aparece] ADD CONSTRAINT [Relationship13] FOREIGN KEY ([codCap]) REFERENCES [Capitulos] ([codCap]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Aparece] ADD CONSTRAINT [Relationship14] FOREIGN KEY ([codPersonaje]) REFERENCES [Personajes] ([codPersonaje]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Participa] ADD CONSTRAINT [Relationship15] FOREIGN KEY ([codPersonaje]) REFERENCES [Personajes] ([codPersonaje]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Participa] ADD CONSTRAINT [Relationship16] FOREIGN KEY ([codPelicula]) REFERENCES [Peliculas] ([codPelicula]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Vulcanos] ADD CONSTRAINT [Relationship18] FOREIGN KEY ([mentor]) REFERENCES [Personajes] ([codPersonaje]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Humanos] ADD CONSTRAINT [Relationship22] FOREIGN KEY ([codPersonaje]) REFERENCES [Personajes] ([codPersonaje]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Vulcanos] ADD CONSTRAINT [Relationship23] FOREIGN KEY ([codPersonaje]) REFERENCES [Personajes] ([codPersonaje]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Klingons] ADD CONSTRAINT [Relationship24] FOREIGN KEY ([codPersonaje]) REFERENCES [Personajes] ([codPersonaje]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Klingons] ADD CONSTRAINT [Relationship25] FOREIGN KEY ([codPlaneta]) REFERENCES [Planetas] ([codPlaneta]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Viajan] ADD CONSTRAINT [Relationship26] FOREIGN KEY ([codCap]) REFERENCES [Capitulos] ([codCap]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Viajan] ADD CONSTRAINT [Relationship27] FOREIGN KEY ([codPlaneta]) REFERENCES [Planetas] ([codPlaneta]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Viajado en] ADD CONSTRAINT [Relationship28] FOREIGN KEY ([codCap], [codPlaneta]) REFERENCES [Viajan] ([codCap], [codPlaneta]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Viajado en] ADD CONSTRAINT [Relationship29] FOREIGN KEY ([codNave]) REFERENCES [Naves] ([codNave]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




