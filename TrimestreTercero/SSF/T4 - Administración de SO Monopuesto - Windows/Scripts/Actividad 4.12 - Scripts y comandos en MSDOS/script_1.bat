@echo off

CLS
SET /P nombre="Introduzca el nombre de las carpetas a crear: "
SET /P total="Introduzca la cantidad de carpetas a crear: 

CD > temporal.txt
SET /P ruta= < temporal.txt
DEL temporal.txt

SET i=0


:loop
SET ruta=%ruta%\%nombre%
mkdir %ruta%
SET /A i=%i% + 1
IF %i% LSS %total% GOTO loop

TREE > %ruta%\listado.txt
ATTRIB %ruta%\listado.txt +h +r

REM Podemos borrar todo el directorio con el comando "rd /S"