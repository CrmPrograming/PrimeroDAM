/*
Created: 13/01/2020
Modified: 13/01/2020
Model: Microsoft SQL Server 2014
Database: MS SQL Server 2014
*/


-- Create tables section -------------------------------------------------

-- Table Eventos

CREATE TABLE [Eventos]
(
 [codEvento] Char(5) NOT NULL,
 [nombre] Varchar(30) NOT NULL,
 [direccion] Varchar(50) NOT NULL,
 [codPoblacion] Char(5) NULL
)
go

-- Create indexes for table Eventos

CREATE INDEX [IX_Relationship1] ON [Eventos] ([codPoblacion])
go

-- Add keys for table Eventos

ALTER TABLE [Eventos] ADD CONSTRAINT [PK_Eventos] PRIMARY KEY ([codEvento])
go

-- Table Companias

CREATE TABLE [Companias]
(
 [codCompania] Char(5) NOT NULL,
 [nombre] Varchar(30) NOT NULL,
 [nombreContacto] Varchar(30) NOT NULL,
 [tlf] Char(9) NOT NULL
)
go

-- Add keys for table Companias

ALTER TABLE [Companias] ADD CONSTRAINT [PK_Companias] PRIMARY KEY ([codCompania])
go

-- Table Poblacion

CREATE TABLE [Poblacion]
(
 [codPoblacion] Char(5) NOT NULL,
 [nombre] Varchar(30) NOT NULL
)
go

-- Add keys for table Poblacion

ALTER TABLE [Poblacion] ADD CONSTRAINT [PK_Poblacion] PRIMARY KEY ([codPoblacion])
go

-- Table Persona

CREATE TABLE [Persona]
(
 [codPersona] Char(5) NOT NULL,
 [nombre] Varchar(30) NOT NULL
)
go

-- Add keys for table Persona

ALTER TABLE [Persona] ADD CONSTRAINT [PK_Persona] PRIMARY KEY ([codPersona])
go

-- Table Asisten

CREATE TABLE [Asisten]
(
 [codPersona] Char(5) NOT NULL,
 [codEvento] Char(5) NOT NULL
)
go

-- Add keys for table Asisten

ALTER TABLE [Asisten] ADD CONSTRAINT [PK_Asisten] PRIMARY KEY ([codPersona],[codEvento])
go

-- Table Contrata

CREATE TABLE [Contrata]
(
 [codCompania] Char(5) NOT NULL,
 [codEvento] Char(5) NOT NULL,
 [numPlazas] Int NOT NULL,
 [plazasAsignadas] Int NOT NULL,
 [costoPersona] Numeric(5,3) NOT NULL,
 [costoCompania] Numeric(5,3) NOT NULL,
 [horaSalida] Time NOT NULL,
 [horaLlegada] Time NOT NULL
)
go

-- Add keys for table Contrata

ALTER TABLE [Contrata] ADD CONSTRAINT [PK_Contrata] PRIMARY KEY ([codCompania],[codEvento])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Eventos] ADD CONSTRAINT [Relationship1] FOREIGN KEY ([codPoblacion]) REFERENCES [Poblacion] ([codPoblacion]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Asisten] ADD CONSTRAINT [Relationship2] FOREIGN KEY ([codPersona]) REFERENCES [Persona] ([codPersona]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Asisten] ADD CONSTRAINT [Relationship3] FOREIGN KEY ([codEvento]) REFERENCES [Eventos] ([codEvento]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Contrata] ADD CONSTRAINT [Relationship4] FOREIGN KEY ([codCompania]) REFERENCES [Companias] ([codCompania]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Contrata] ADD CONSTRAINT [Relationship5] FOREIGN KEY ([codEvento]) REFERENCES [Eventos] ([codEvento]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




