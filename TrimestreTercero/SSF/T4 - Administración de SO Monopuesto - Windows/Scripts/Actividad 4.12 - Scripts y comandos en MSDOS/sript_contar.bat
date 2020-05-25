@echo off

rem Script asociado al conteo de números de 0 a 10000
rem Autor: César Ravelo Martínez
rem Fecha: 05/05/2020

echo Contar los num usando for
echo #########################
echo.
PAUSE

FOR /L %%i IN (0 3 10000) DO ECHO %%i
PAUSE

echo.
echo Contar los num usando goto
echo #########################
echo.
PAUSE

SET i=0
SET total=10000

:loop
echo %i%
SET /A i=%i%+3
IF %i% LSS %total% GOTO loop

PAUSE