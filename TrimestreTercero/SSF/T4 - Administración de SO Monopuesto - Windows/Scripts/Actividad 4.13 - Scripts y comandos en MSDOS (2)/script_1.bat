@echo off

rem Script asociado al ejercicio 1
rem Autor: César Ravelo Martínez
rem Fecha: 12/05/2020

PROMPT $P[$T]$G
COLOR 74
SET fichero=C:\variables.txt
SET > %fichero%

FOR /F "delims=" %%F IN ('DIR /S /B C:\users\public') DO (
	ECHO. >> %fichero%
	ECHO %%F >> %fichero%
)

FOR /F "delims=," %%T IN ('TASKLIST /NH /FO CSV') DO (
	ECHO. >> %fichero%
	ECHO %%T >> %fichero%
)