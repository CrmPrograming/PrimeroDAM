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

-- CONSULTAS
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
