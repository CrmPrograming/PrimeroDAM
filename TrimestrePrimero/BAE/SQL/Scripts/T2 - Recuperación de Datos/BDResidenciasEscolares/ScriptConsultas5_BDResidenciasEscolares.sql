-- ######################################

--			CONSULTA BDRESIDENCIAS 5

-- ######################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 28/11/2019

USE BDResidenciasEscolares
GO

-- 1. Visualiza de cada universidad (codigo universidad )el total de plazas que oferta en sus residencias.
SELECT codUniversidad, SUM(cantidadPlazas) AS 'Total de plazas' 
	FROM residencias
	GROUP BY codUniversidad 
GO

-- 2. Cual es la universidad o universidades que m�s plazas ofertan 
SELECT TOP 1 WITH TIES codUniversidad, SUM(cantidadPlazas) AS 'Total de plazas'
	FROM residencias
	GROUP BY codUniversidad
	ORDER BY 'Total de plazas' DESC
GO

-- 3. Cual es la universidad o universidades que ofertan en total tienen mas de 100 plazas
SELECT codUniversidad, SUM(cantidadPlazas) AS 'Total de plazas'
	FROM residencias
	GROUP BY codUniversidad
	HAVING SUM(cantidadPlazas) > 100
GO

-- 4. Cual es la universidad o universidades que ofertan m�s plazas  de genero mixto
SELECT TOP 1 WITH TIES codUniversidad, SUM(cantidadPlazas) AS 'Total de plazas'
	FROM residencias
	WHERE genero = 'mixto'
	GROUP BY codUniversidad
	ORDER BY 'Total de plazas' DESC
GO

-- 5. Cual es la universidad o universidades que ofertan m�s plazas  de genero mixto  y en total tienen mas de 100 plazas
SELECT TOP 1 WITH TIES codUniversidad, SUM(cantidadPlazas) AS 'Total de plazas'
	FROM residencias
	WHERE genero = 'mixto'
	GROUP BY codUniversidad
	HAVING SUM(cantidadPlazas) > 100
	ORDER BY 'Total de plazas' DESC
GO

-- 6. Visualiza las residencias ( su c�digo) y la cantidad de estancias que han tienen 
SELECT codResidencia, COUNT(*) AS 'Cantidad de estancias' 
	FROM estancias
	GROUP BY codResidencia
GO

-- 7. Visualiza de las estancias el c�digo de la residencia y cuantos estudiantes diferentes ha tenido cada una. 
SELECT codResidencia, COUNT(DISTINCT codEstudiante) AS 'Total estudiantes'
	FROM estancias
	GROUP BY codResidencia
GO

-- 8. Visualiza todas las estancias , todos sus datos y adem�s la cantidad de d�as de cada una de las estancias. Para ello utiliza el comando datediff 
SELECT *, DATEDIFF(day, fechaInicio, fechaFin) AS 'Cantidad d�as'
	FROM estancias	
GO

-- 9. Visualiza el c�digo de los estudiantes y la cantidad de residencias por las que ha pasado cada uno.
SELECT codEstudiante, COUNT(codResidencia) AS 'Cantidad de residencias'
	FROM estancias
	GROUP BY codEstudiante
GO

-- 10. Visualiza el c�digo de los estudiantes y la cantidad de residencias diferentes por las que ha pasado cada uno
SELECT codEstudiante, COUNT(DISTINCT codResidencia) AS 'Cantidad de residencias'
	FROM estancias
	GROUP BY codEstudiante
GO

-- 11. Visualiza el c�digo de los estudiantes y la cantidad de residencias diferentes por las que ha pasado cada uno. Pero solo visualiza aquellos que han pasado por mas de 2 residencias
SELECT codEstudiante, COUNT(DISTINCT codResidencia) AS 'Cantidad de residencias'
	FROM estancias
	GROUP BY codEstudiante
	HAVING COUNT(DISTINCT codResidencia) > 2
GO

-- 12. Visualiza el c�digo de los estudiantes y la cantidad de residencias diferentes por las que ha pasado cada uno. Pero solo las estancias del curso X. Ordenado por c�digo de estudiante.
SELECT codEstudiante, COUNT(DISTINCT codResidencia) AS 'Cantidad de residencias'
	FROM estancias
	WHERE YEAR(fechaInicio) = 2019 AND YEAR(fechaFin) = 2020
	GROUP BY codEstudiante
	ORDER BY codEstudiante
GO