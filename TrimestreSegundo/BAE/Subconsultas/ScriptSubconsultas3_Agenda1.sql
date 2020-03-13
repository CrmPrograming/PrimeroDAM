-- ###################################

--		     SUBCONSULTAS 3

-- ###################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 13/03/2020

USE Agenda1
GO

-- 17. Cuales son las categorias con m�s contactos que la media de categorias por poblaci�n
SELECT Categoria
FROM contactos AS c
GROUP BY Categoria
HAVING COUNT(id_contacto) > (
		 SELECT AVG(Total)
		 FROM (
				SELECT COUNT(Categoria) AS Total
			    FROM contactos GROUP BY Poblacion
		 ) AS [Cantidad contactos por poblacion]
)
GO

-- 18. Crea una consulta utilizando subconsultas con los nombres de las categor�as en las que no tengo ning�n contacto.
-- Hay varias formas de plantear esta consulta.
-- 1) Utilizando un LEFT JOIN en la subconsulta
SELECT Categoria
FROM (
	 SELECT categorias.Categoria, id_contacto
	 FROM categorias
		LEFT JOIN contactos ON categorias.Categoria = contactos.Categoria
) AS [Categorias Totales]
WHERE id_contacto IS NULL
GO
-- 2) No utilizando JOINS
SELECT Categoria
FROM categorias
WHERE Categoria NOT IN (
	SELECT contactos.Categoria
	FROM contactos, categorias
	WHERE categorias.Categoria = contactos.Categoria
)
GO

-- NOTA: Esta segunda opci�n no es recomendable ya que ralentiza la operaci�n de b�squeda al utilizar NOT IN

-- 19. Crea una consulta utilizando subconsultas con los nombres de las categor�as y la cantidad de contactos en cada una de las categor�as
-- NOTA: Entendemos que se pretende contabilizar tambi�n aquellas categor�as que no tengan contactos (por tanto tendr�n 0 contactos)
SELECT T.Categoria, COUNT(T.id_contacto) AS [Total]
FROM (
	SELECT categorias.Categoria, id_contacto
	FROM categorias
		LEFT JOIN contactos ON categorias.Categoria = contactos.Categoria
) AS T
GROUP BY T.Categoria
GO

-- 20. Crea una consulta utilizando subconsultas que visualice los nombres de todas aquellas categor�as que tengan m�s de 1 contacto.
SELECT T.Categoria, COUNT(T.id_contacto) AS [Total]
FROM (
	SELECT categorias.Categoria, id_contacto
	FROM categorias
		LEFT JOIN contactos ON categorias.Categoria = contactos.Categoria
) AS T
GROUP BY T.Categoria
HAVING COUNT(T.id_contacto) > 1
GO

-- 21. Crea una consulta utilizando subconsultas que visualice los nombres de todas aquellas categor�as que tengan m�s de 1 contacto y que los contactos pertenezcan a la provincia con nombre X
SELECT T.Categoria, COUNT(T.id_contacto) AS [Total]
FROM (
	 SELECT categorias.Categoria, id_contacto 
	 FROM categorias
		LEFT JOIN contactos ON categorias.Categoria = contactos.Categoria
	 WHERE Provincia = (
						SELECT Provincia
						FROM provincias
						WHERE NombreProvincia = 'Santa Cruz de Tenerife'
						)
) AS T
GROUP BY T.Categoria
HAVING COUNT(T.id_contacto) > 1
GO

-- EXPLICACI�N:
/*
	Nos piden visualizar los nombres de todas aquellas categor�as que tengan m�s de 1 contacto de la provincia X.
	Para ello, primero necesitamos saber el identificador de la Provincia X, en nuestro caso X ser� 'Santa Cruz de Tenerife':

	SELECT Provincia FROM provincias WHERE NombreProvincia = 'Santa Cruz de Tenerife'

	Una vez tenemos ese identificador, buscamos todas las categorias y contactos asignadas a ellas que tengan a los
	contactos en la provincia X. Teniendo en cuenta este �ltimo criterio, no tiene sentido utilizar LEFT JOIN ya que
	las categor�as sin contacto en la provincia X no aparecer�n. Se podr�a utilizar simplemente el INNER JOIN y ahorrar trabajo,
	pero por conservar la din�mica de los ejercicios anteriores dejamos el LEFT JOIN:

	SELECT categorias.Categoria, id_contacto 
		FROM categorias LEFT JOIN contactos ON categorias.Categoria = contactos.Categoria
		WHERE Provincia =
			(SELECT Provincia FROM provincias WHERE NombreProvincia = 'Santa Cruz de Tenerife')

	Una vez ya tenemos esa subconsulta compuesta, simplemente agrupamos y filtramos con HAVING y obtendremos la visualizaci�n
	solicitada. En este caso, ninguna categor�a cumple el criterio solicitado y por tanto, no hay valores resultantes.
*/

-- 22. Crea una consulta utilizando subconsultas con los nombres provincia con m�s contactos de la categor�a X
SELECT NombreProvincia
FROM provincias
WHERE Provincia = ANY (
	SELECT TOP 1 WITH TIES Provincia
	FROM contactos
	WHERE Categoria = (
		SELECT Categoria
		FROM categorias
		WHERE Descripcion = 'Cumplea�os'
	)
	GROUP BY Provincia
	ORDER BY COUNT(id_contacto) DESC
)
GO

-- 23. Crea una consulta utilizando subconsultas con los nombres de  provincias con contactos de la categor�a X y m�s de 1 contacto
SELECT NombreProvincia
FROM provincias
WHERE Provincia = ANY (
	SELECT TOP 1 WITH TIES Provincia
	FROM contactos
	WHERE Categoria = (
		SELECT Categoria
		FROM categorias
		WHERE Descripcion = 'Cumplea�os'
	)
	GROUP BY Provincia
	HAVING COUNT(id_contacto) > 1
	ORDER BY COUNT(id_contacto) DESC
)
GO

-- 24. Crea una consulta utilizando subconsultas con las  descripciones de las categor�as de m�s de 1 contacto que todos sean mayores de edad.
SELECT Descripcion
FROM categorias
WHERE Categoria IN (
	SELECT Categoria FROM contactos
	WHERE YEAR(GETDATE()) - YEAR(Fechacumple) >= 19 OR 
		(YEAR(GETDATE()) - YEAR(Fechacumple) = 18 AND (MONTH(Fechacumple) * DAY(EOMONTH(Fechacumple)) + DAY(Fechacumple)) - (MONTH(GETDATE()) * DAY(EOMONTH(GETDATE())) + DAY(GETDATE())) <= 0)
	GROUP BY Categoria
	HAVING COUNT(id_contacto) > 1
)
GO

-- 25. Cual es el nombre de la provincia con m�s contactos mayores de edad
SELECT NombreProvincia
FROM provincias
WHERE Provincia = (
	SELECT TOP 1 Provincia FROM contactos
	WHERE YEAR(GETDATE()) - YEAR(Fechacumple) >= 19 OR 
		(YEAR(GETDATE()) - YEAR(Fechacumple) = 18 AND (MONTH(Fechacumple) * DAY(EOMONTH(Fechacumple)) + DAY(Fechacumple)) - (MONTH(GETDATE()) * DAY(EOMONTH(GETDATE())) + DAY(GETDATE())) <= 0)
	GROUP BY Provincia
	ORDER BY COUNT(id_contacto) DESC
)
GO

-- 26. Cual es la descripci�n de categor�a con m�s contactos mayores de edad
SELECT Categoria
FROM categorias
WHERE Categoria = (
	SELECT TOP 1 Categoria FROM contactos
	WHERE YEAR(GETDATE()) - YEAR(Fechacumple) >= 19 OR 
		(YEAR(GETDATE()) - YEAR(Fechacumple) = 18 AND (MONTH(Fechacumple) * DAY(EOMONTH(Fechacumple)) + DAY(Fechacumple)) - (MONTH(GETDATE()) * DAY(EOMONTH(GETDATE())) + DAY(GETDATE())) <= 0)
	GROUP BY Categoria
	ORDER BY COUNT(id_contacto) DESC
)
GO