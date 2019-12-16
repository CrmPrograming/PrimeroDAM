 -- ######################################

--			CONSULTA BDRESIDENCIAS 6

-- ######################################

-- autor: César Ravelo Martínez
-- fecha: 29/11/2019

USE BDResidenciasEscolares
GO

-- 1. Visualiza los codigos de las universidades y el precio mensual medio de cada universidad
SELECT codUniversidad, AVG(precioMensual) AS 'Precio mensual medio'
FROM residencias
GROUP BY codUniversidad

-- 2. Visualiza los codigos de las universidades y el precio mensual medio de cada universidad,
-- pero no contabilizar aquellas residencias que no tienen director, ordenalo por la media del preciomensual
SELECT codUniversidad, AVG(precioMensual) AS 'Precio mensual medio'
FROM residencias
WHERE nombreDirector IS NOT NULL
GROUP BY codUniversidad
ORDER BY AVG(precioMensual)

-- 3. Visualiza los codigos de las universidades y el precio mensual medio de cada universidad pero solo aquellas
-- universidades que su precio mensual es menor de 500
SELECT codUniversidad, AVG(precioMensual) AS 'Precio mensual medio'
FROM residencias
WHERE precioMensual < 500
GROUP BY codUniversidad
ORDER BY AVG(precioMensual)

-- 4. Visualiza los codigos de las universidades y el precio mensual medio de cada universidad, pero no contabilizar
-- aquellas residencias que no tienen director ni tampoco cuando la media de su precio mensual sea menos de 500,
-- ordenalo por la media del preciomensual
SELECT codUniversidad, AVG(precioMensual) AS 'Precio mensual medio'
FROM residencias
WHERE precioMensual < 500 AND nombreDirector IS NOT NULL
GROUP BY codUniversidad
ORDER BY AVG(precioMensual)

-- 5. Cual es la universidad que su media de los preciomensual de sus residencias sea la mayor.
SELECT TOP 1 codUniversidad, AVG(precioMensual) AS 'Precio mensual medio'
FROM residencias
GROUP BY codUniversidad
ORDER BY AVG(precioMensual) DESC

-- 6. Cual es la universidad que su media de los preciomensual de sus residencias sea la mayor,
-- si hay varias con el mismo precio mayor también visualizarlas
SELECT TOP 1 WITH TIES codUniversidad, AVG(precioMensual) AS 'Precio mensual medio'
FROM residencias
GROUP BY codUniversidad
ORDER BY AVG(precioMensual) DESC

-- 7. Visualiza cuantos generos diferentes hay en las residencias
SELECT DISTINCT genero
FROM residencias

-- 8. Visualiza cuantas residencias hay con comedor, genero mixto y precio mensual mayor de 400
SELECT COUNT(nomResidencia) AS 'Residencias con comedor'
FROM residencias
WHERE comedor = 1 AND genero = 'mixto' AND precioMensual > 400

-- 9. Cuantas residencias su nombre comienza por R
SELECT COUNT(nomResidencia) AS 'Residencias que comienzan por R'
FROM residencias
WHERE nomResidencia LIKE 'R%'

-- 10. Cuantas estancias hay en el año actual. Utiliza la funcion getdate() para obtener el dia actual
-- y year() para obtener el año de una fecha determinada
SELECT COUNT(*) AS 'Estancias en este año'
FROM estancias
WHERE YEAR(GETDATE()) = YEAR(fechaInicio)

-- 11. cuantas residencias hay en cada universidad,  queremos saber la cantidad de residencias con comedor y sin comedor
SELECT COUNT(*) AS 'Residencias en cada universidad'
FROM residencias
WHERE comedor = 1 OR comedor = 0

-- 12. Cuantas residencias hay por universidades y genero
SELECT codUniversidad, genero, COUNT(*) AS 'Residencias por universidades y género'
FROM residencias
GROUP BY codUniversidad, genero

-- 13. Cuantas plazas hay por universidad y genero. Ordenado por cantidad de plazas
SELECT codUniversidad, genero, SUM(cantidadPlazas) AS 'Cantidad de plazas'
FROM residencias
GROUP BY codUniversidad, genero
ORDER BY SUM(cantidadPlazas)