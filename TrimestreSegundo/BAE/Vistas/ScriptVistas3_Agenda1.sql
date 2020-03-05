-- ###################################

--		  CREACI�N VISTAS 3

-- ###################################

-- autor: C�sar Ravelo Mart�nez
-- fecha: 05/03/2020

USE Agenda1
GO

-- 20. Sobre la vista anterior queremos conocer:
-- a) los datos del contacto con m�s edad
SELECT Nombre, Fechacumple FROM v_provincias19 ORDER BY Fechacumple
GO

-- b) Cual es el contacto o contactos que est�n m�s pr�ximos a cumplir a�os
SELECT Nombre, (MONTH(Fechacumple) * 30 + DAY(Fechacumple)) - (MONTH(GETDATE()) * 30 + DAY(GETDATE())) AS [D�as Pasados], Fechacumple FROM v_provincias19 
WHERE (MONTH(Fechacumple) * 30 + DAY(Fechacumple)) - (MONTH(GETDATE()) * 30 + DAY(GETDATE())) >= 0
ORDER BY [D�as Pasados]
GO

SELECT * FROM contactos

(MONTH(Fechacumple) * 30 + DAY(Fechacumple)) - (MONTH(GETDATE()) * 30 + DAY(GETDATE()))

SELECT Fechacumple, DAY(EOMONTH(Fechacumple)) FROM v_provincias19

