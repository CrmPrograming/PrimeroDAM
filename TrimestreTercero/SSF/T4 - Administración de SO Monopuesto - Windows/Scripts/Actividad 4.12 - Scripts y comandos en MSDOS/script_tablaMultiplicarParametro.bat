@echo off

rem Script asociado a mostrar las tablas de multiplicar del rango de números dado por parámetro
rem Autor: César Ravelo Martínez
rem Fecha: 05/05/2020

SET i=%1

:bucleNumeros

	SET x=0

	:bucleTabla
		SET /A result=%i% * %x%
		ECHO %i% x %x% = %result%
		SET /A x=%x% + 1
		IF %x% LEQ 10 GOTO bucleTabla

	ECHO.
	PAUSE
	ECHO.
	SET /A i=%i% + 1
	IF %i% LEQ %2 GOTO bucleNumeros