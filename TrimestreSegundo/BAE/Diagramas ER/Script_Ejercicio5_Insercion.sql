-- Script de inserción de datos

USE Startrek
GO

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

select * from Peliculas

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
INSERT INTO Planetas VALUES ('DELT1', 'Delta 1', NULL, 'GALDE');
INSERT INTO Planetas VALUES ('KAPP1', 'Kappa 1', NULL, 'GALKA');
INSERT INTO Planetas VALUES ('PIPL1', 'PI 1', NULL, 'GALPI');
INSERT INTO Planetas VALUES ('TANG1', 'Tango 1', NULL, 'GALTA');

INSERT INTO Planetas VALUES ('DELT2', 'Delta 2', NULL, 'GALDE');
INSERT INTO Planetas VALUES ('KAPP2', 'Kappa 2', NULL, 'GALKA');
INSERT INTO Planetas VALUES ('PIPL2', 'PI 2', NULL, 'GALPI');

INSERT INTO Planetas VALUES ('DELT3', 'Delta 3', NULL, 'GALDE');
INSERT INTO Planetas VALUES ('KAPP3', 'Kappa 3', NULL, 'GALKA');

INSERT INTO Planetas VALUES ('DELT4', 'Delta 4', NULL, 'GALDE');

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
INSERT INTO Visita SELECT TOP 15 codCap, codPlaneta FROM Capitulos CROSS JOIN Planetas;

select * from Visita
