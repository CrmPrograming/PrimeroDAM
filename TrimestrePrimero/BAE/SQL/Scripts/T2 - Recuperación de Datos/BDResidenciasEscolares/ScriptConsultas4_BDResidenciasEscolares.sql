-- ######################################

--			CONSULTA BDRESIDENCIAS 4

-- ######################################

-- autor: César Ravelo Martínez
-- fecha: 22/11/2019

USE BDResidenciasEscolares 
GO

-- 1. Visualiza todos los estudiantes de sexo M
SELECT * FROM estudiantes WHERE sexo = 'M'
GO

-- 2. Visualiza cuantos estudiantes hay de sexo M
SELECT COUNT(*) AS 'Total estudiantes de sexo M' FROM estudiantes WHERE sexo = 'M'
GO

-- 3. Visualiza todos los sexos y las cantidades de estudiantes que hay de cada sexo.
SELECT sexo, count(sexo) AS 'Total estudiantes' FROM estudiantes WHERE sexo IS NOT NULL
	GROUP BY sexo
GO

-- 4. Visualiza todos los sexos y las cantidades de estudiantes que hay de cada sexo, 
-- de aquellos estudiantes que su dni comienza por 4
SELECT sexo, count(sexo) AS 'Total estudiantes' FROM estudiantes
	WHERE sexo IS NOT NULL AND dni LIKE '4%'
	GROUP BY sexo
GO

-- 5. Visualiza los codigos de las universidades y la cantidad de residencias que tiene
-- cada universidad ordenado por la cantidades
SELECT codUniversidad, COUNT(*) AS 'Total residencias' FROM residencias
	GROUP BY codUniversidad
	ORDER BY 'Total residencias' ASC
GO

-- 6. Visualiza los codigos de las universidades y la cantidad de residencias de la universidad
-- que tenga una menor cantidad de residencias, si hay varias universidades con la misma cantidad
-- de residencias también se deberán visualizar.

SELECT TOP 1 WITH TIES codUniversidad, COUNT(*) AS 'Total residencias' FROM residencias
	GROUP BY codUniversidad
	ORDER BY 'Total Residencias' ASC
GO

-- 7. Visualiza el 10 porciento de las universidades ( sus codigos) con la cantidad de residencias
-- que tiene cada uno pero aquellas que mas residencias tengan
SELECT TOP 10 PERCENT codUniversidad, COUNT(*) AS 'Total Residencias' FROM residencias
	GROUP BY codUniversidad
	ORDER BY 'Total Residencias' DESC
GO

-- 8. Visualiza las universidades (codigo) y la cantidad de residencias de cada una pero solo de aquellas
-- que tengan mas de 1 residencia
SELECT codUniversidad, COUNT(*) AS 'Total Residencias' FROM residencias
	GROUP BY codUniversidad
	HAVING COUNT(*) > 1
GO

-- 9. Visualiza las universidades (codigo) y la cantidad de residencias de cada una pero solo de aquellas
-- que tengan comedor y que tengan mas de 1 residencia  ordenado por  cantidad de plazas
SELECT codUniversidad, COUNT(*) AS 'Total Residencias' FROM residencias
	WHERE comedor = 1
	GROUP BY codUniversidad
	HAVING COUNT(*) > 1
	ORDER BY 'Total Residencias'
GO

-- 10. Visualiza las universidades (codigo) y la cantidad de residencias de cada una pero solo de aquellas
-- que tengan comedor , su precio sea menor o igual a 900 y que tengan mas de 1 residencia  ordenado por  precio
SELECT codUniversidad, COUNT(*) AS 'Total Residencias' FROM residencias
	WHERE comedor = 1 AND precioMensual <= 900
	GROUP BY codUniversidad
	HAVING COUNT(*) > 1
GO