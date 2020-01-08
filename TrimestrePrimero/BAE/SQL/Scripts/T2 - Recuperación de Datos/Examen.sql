-- César Ravelo Martínez
USE Direcciondetrafico
GO
-- 1.
SELECT TOP 1 WITH TIES m.modelo
FROM modelos AS m
	INNER JOIN vehiculos AS v ON m.idModelo = v.modelo
	INNER JOIN sanciones AS s ON v.matricula = s.matricula
WHERE s.tipo = 'Grave'
GROUP BY m.modelo
ORDER BY COUNT(s.id) ASC

-- 2. 
-- Nota: Usaremos el código de modelo 'vwpo'
SELECT v.matricula, v.modelo, v.observaciones
FROM vehiculos AS v
	INNER JOIN sanciones AS s ON v.matricula = s.matricula
WHERE v.modelo = 'vwpo' AND s.tipo = 'Leve'
GROUP BY v.matricula, v.modelo, v.observaciones
HAVING COUNT(s.id) > 1

-- 3. 
SELECT m.modelo, COUNT(v.matricula) AS 'Cantidad de vehículos'
FROM modelos AS m
	LEFT JOIN vehiculos AS v ON m.idModelo = v.modelo
GROUP BY m.modelo

-- 4. 
SELECT COUNT(DISTINCT v.matricula) AS 'Cantidad de vehículos distintos'
FROM vehiculos AS v
	INNER JOIN sanciones AS s ON v.matricula = s.matricula
WHERE sancion LIKE '%paso%' AND v.modelo LIKE 'vw%'
	
-- 5.
SELECT tipo, pago, SUM(importe) AS 'Total de importe en las multas'
FROM sanciones
GROUP BY tipo, pago
	
-- 6. 
SELECT TOP 1 matricula
FROM sanciones
GROUP BY matricula
ORDER BY SUM(importe) DESC

-- 7. 
SELECT TOP 1 matricula
FROM sanciones 
WHERE pago = 1
GROUP BY matricula
ORDER BY SUM(importe) ASC

-- 8. 
-- Nota: Podría haberse hecho mediante m.* para seleccionar todos
-- los campos, pero por comodidad se prefirío hacerlo especificando
-- cada uno de ellos
SELECT m.idModelo, m.modelo
FROM modelos AS m
	LEFT JOIN vehiculos AS v ON m.idModelo = v.modelo
WHERE v.matricula IS NULL