-- ######################################

--			CONSULTA BDRESIDENCIAS 3

-- ######################################

-- autor: César Ravelo Martínez
-- fecha: 19/11/2019

USE BDResidenciasEscolares 
GO

-- 1. Visualiza todas las residencias con comedor ordenas por nombre
SELECT * FROM residencias WHERE comedor = 1 ORDER BY nomResidencia ASC
GO

-- 2. Cuantas residencias tienen comedor
SELECT COUNT(*) AS 'Residencias con comedor' FROM residencias WHERE comedor = 1
GO

-- 3. De las residencias con comedor Cuantas pertenecen a la universidad x
SELECT COUNT(*) AS 'Residencias con comedor de ULagun' FROM residencias WHERE comedor = 1 AND codUniversidad = 'ULagun'
GO

-- 4. Cuantas residencias con comedor y pertenecen a la universidad x
SELECT COUNT(*) AS 'Residencias con comedor de ULagun' FROM residencias WHERE comedor = 1 AND codUniversidad = 'ULagun'
GO

-- 5. De las residencias con comedor , ¿ cual tiene más plazas ?
SELECT TOP 1 * FROM residencias WHERE comedor = 1 ORDER BY cantidadPlazas DESC
GO

-- 6. De las residencias con comedor , ¿ cuales son las 3 residencias que tienen más plazas ?
SELECT TOP 3 * FROM residencias WHERE comedor = 1 ORDER BY cantidadPlazas DESC
GO

-- 7. De las residencias con comedor, ¿cuales son las residencias quetienen másplazas, las 3 mayores cantidad de plazas?
SELECT TOP 3 WITH TIES * FROM residencias WHERE comedor = 1  ORDER BY cantidadPlazas DESC
GO

-- 8. De la universidad x cual es el total de plazas que hay , contando las de todas las residencias de dicha universidad 
SELECT SUM(cantidadPlazas) AS 'Total de plazas de la universidad ULoren' FROM residencias WHERE codUniversidad = 'ULoren' 
GO

-- 9. De las residencias mixtas y con comedor , cuanto es el total de plazas que hay
SELECT SUM(cantidadPlazas) AS 'Total de plazas' FROM residencias WHERE genero = 'mixto' AND comedor = 1
GO

-- 10. Que residencias contienen en su nombre ‘ca’ordenalas por nombre descendente
SELECT * FROM residencias WHERE nomResidencia LIKE '%ca%' ORDER BY nomResidencia DESC
GO

-- 11. Cuantas residencias hay que no son mixtas
SELECT COUNT(*)  AS 'Cantidad residencias no mixtas' FROM residencias WHERE genero = 'masculino' OR genero = 'femenino'
GO
-- NOTA: Sería equivalente, aunque más costoso, hacer:
-- SELECT COUNT(*)  AS 'Cantidad residencias no mixtas' FROM residencias WHERE genero != 'mixto'
-- SELECT COUNT(*)  AS 'Cantidad residencias no mixtas' FROM residencias WHERE genero <> 'mixto'
-- SELECT COUNT(*)  AS 'Cantidad residencias no mixtas' FROM residencias WHERE genero NOT LIKE 'mixto'
-- SELECT COUNT(*)  AS 'Cantidad residencias no mixtas' FROM residencias WHERE genero IN ('masculino', 'femenino')