USE BDResidenciasEscolares
GO

-- 1. Visualiza todas las residencias que tengan mas de 100 plazas ordenado por numero de plazas descendente
SELECT * FROM residencias WHERE cantidadPlazas > 100 ORDER BY cantidadPlazas DESC
GO

-- 2. Visualiza el codigo y nombre de todas las residencias que tengan mas de 100 plazas y genero mixto ordenado por genero y numero de plazas ascendente
SELECT codResidencia AS Código, nomResidencia AS Nombre FROM residencias WHERE cantidadPlazas > 100 AND genero = 'mixto' ORDER BY genero, cantidadPlazas ASC
GO

-- 3. Visualiza nombre, cantidad de plazas y precio de todas las residencias que tengan entre 100 y 200 plazas ordenado por precioMensual descendente
SELECT nomResidencia AS Nombre, cantidadPlazas AS 'Cantidad de plazas', precioMensual AS Precio 
	FROM residencias 
	WHERE cantidadPlazas BETWEEN 100 AND 200
	ORDER BY Precio DESC
GO