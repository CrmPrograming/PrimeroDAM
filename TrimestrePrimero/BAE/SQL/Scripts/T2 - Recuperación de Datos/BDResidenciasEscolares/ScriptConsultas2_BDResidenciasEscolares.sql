-- ######################################

--			CONSULTA BDRESIDENCIAS 2

-- ######################################

-- autor: César Ravelo Martínez
-- fecha: 18/11/2019

USE BDResidenciasEscolares 
GO

-- 1. Visualiza las 3 residencias con precios mas caros
SELECT TOP 3 * FROM residencias ORDER BY precioMensual DESC
GO

-- 2. Visualiza todas las residencias que estén entre los 3 precios más caros.
SELECT TOP 3 WITH TIES * FROM residencias ORDER BY precioMensual DESC
GO

-- 3. Visualiza la estancia que tiene un preciopagado menor
SELECT TOP 1 * FROM estancias ORDER BY preciopagado
GO

-- 4. Visualiza todas las estancias que se pague el menor precio
SELECT TOP 1 WITH TIES * FROM estancias ORDER BY preciopagado
GO

-- 5. Visualiza el 10% de las estancias que mas se ha pagado, visualiza todos los datos 
SELECT TOP 10 PERCENT * FROM estancias ORDER BY preciopagado DESC
GO

-- 6. visualiza cuantas residencias tenemos en total
SELECT COUNT(*) AS 'Total Residencias' FROM residencias
GO

-- 7. Visualiza cuantas residencias tenemos de la universidad con codigo X
SELECT COUNT(*) AS 'Total Residencias' FROM residencias WHERE codUniversidad = 'ULagun'
GO

-- 8. Visualiza el sumatorio de los precios pagados en las estancias de la residencia X
SELECT SUM(preciopagado) AS 'Total Precio Pagado' FROM estancias WHERE codResidencia = 1 
GO

-- 9. visualiza cuantas estancias tenemos de la residencia X
SELECT COUNT(*) AS 'Total Estancias' FROM estancias WHERE codResidencia = 3
GO

-- 10. cual es la estancia quemas se ha pagado
SELECT TOP 1 * FROM estancias ORDER BY preciopagado DESC
GO

-- 11. Y la que menos
SELECT TOP 1 * FROM estancias ORDER BY preciopagado ASC
GO

-- 12. cuantas estancias han habido en total
SELECT COUNT(*) AS 'Total Estancias' FROM estancias
GO

-- 13. Cuantas estancias de la residencia X han habido en total
SELECT COUNT(*) AS 'Estancias de la residencia 4' FROM estancias WHERE codResidencia = 4
GO

-- 14. cuantas residencias diferentes han tenido alguna estancias. Me refiero que cada residencia solo se cuente una vez.
SELECT COUNT(DISTINCT codResidencia) AS 'Estancias diferentes' FROM estancias
GO

-- 15. Cuantos alumnos diferentes han tenido estancias
SELECT COUNT(DISTINCT codEstudiante) AS 'Alumnos con estancias' FROM estancias
GO