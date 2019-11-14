USE BDResidenciasEscolares
GO

-- 1. Visualiza todas las residencias que tengan mas de 100 plazas ordenado por numero de plazas descendente
SELECT * FROM residencias WHERE cantidadPlazas > 100 ORDER BY cantidadPlazas DESC
GO

-- 2. Visualiza el codigo y nombre de todas las residencias que tengan mas de 100 plazas y genero mixto ordenado por genero y numero de plazas ascendente
SELECT codResidencia AS Código, nomResidencia AS Nombre FROM residencias WHERE cantidadPlazas > 100 AND genero = 'mixto' ORDER BY genero, cantidadPlazas
GO

-- 3. Visualiza nombre, cantidad de plazas y precio de todas las residencias que tengan entre 100 y 200 plazas ordenado por precioMensual descendente
SELECT nomResidencia AS Nombre, cantidadPlazas AS 'Cantidad de plazas', precioMensual AS Precio 
	FROM residencias 
	WHERE cantidadPlazas BETWEEN 100 AND 200
	ORDER BY Precio DESC
GO

-- 4. Visualiza todas las residencias que admitan genero masculino ordenado por cantidad de plazas
SELECT * FROM residencias
	WHERE genero = 'masculino'
	ORDER BY cantidadPlazas
GO

-- 5. Visualiza nombre y director de todas las residencias que el director sea X
SELECT nomResidencia, nombreDirector FROM residencias
	WHERE nombreDirector = 'Rodolfo'
GO

-- 6. Visualiza nombre, genero, comedor y nombre de director de todas las residencias que admitan genero masculino y femenino ordenado por nombre residencias
SELECT nomResidencia, genero, comedor, nombreDirector FROM residencias
	WHERE genero = 'masculino' OR genero = 'femenino'
	ORDER BY nomResidencia
GO

-- 7. Visualiza codigo, nombre y universidad de todas las residencias de la universidad x , en la visualizacion deberán aparecer en la cabecera  codigo, nombre y universidad. Hacerlo con laasignacion de los alias.
SELECT codResidencia AS codigo, nomResidencia AS nombre, codUniversidad AS universidad FROM residencias
	WHERE codUniversidad = 'ULagun'
GO

-- 8. Visualiza todas las residencias con comedor y genero mixto ordenado por precio
SELECT * FROM residencias
	WHERE comedor = 1 AND genero = 'mixto'
	ORDER BY precioMensual
GO

-- 9. Visualiza codigo, nombre y universidad de todas las residencias de la universidad cuyo codigo comience en 1
SELECT codResidencia, nomResidencia, codUniversidad FROM residencias
	WHERE codUniversidad LIKE '1%'
GO

-- 10. Visualiza todas las residencias que su nombre finalice en A
SELECT * FROM residencias
	WHERE nomResidencia LIKE '%A'
GO

-- 11. Visualiza todas las residencias que su nombre comience en x y finalice en A
SELECT * FROM residencias 
	WHERE nomResidencia LIKE 'R%A'
GO

-- 12. Visualiza todas las residencias que su nombre contenga la letra A
SELECT * FROM residencias
	WHERE nomResidencia LIKE '%A%'
GO

-- 13. Visualiza todas las residencias que su nombre comience por A y contenga pepe
SELECT * FROM residencias
	WHERE nomResidencia LIKE 'A%pepe%'
GO

-- 14. Visualiza todas las residencias que su nombre comience en A y su tercera letra sea A tambien
SELECT * FROM residencias
	WHERE nomResidencia LIKE 'A_A%'
GO

-- 15. Visualiza todas las residencias que no pertenezcan a la universidad x
SELECT * FROM residencias
	WHERE codUniversidad <> 'ULoren'
GO