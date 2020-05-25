@echo off

rem Script asociado al ejercicio 5
rem Autor: César Ravelo Martínez
rem Fecha: 12/05/2020

:menu
cls
echo 1) Mostrar el arbol de directorios de c:\windows
echo 2) Reiniciar el equipo en 3 minutos
echo 3) Mostrar las variables de entorno
echo 4) Listar todos los ficheros de texto
echo 5) Modificar la variable de entorno TMP
echo 6) Salir
echo.

set /P opc="Elige una opcion: "
echo Has elegido la opcion %opc%
echo.

IF %opc% == 1 GOTO mostrarArbol
IF %opc% == 2 GOTO reiniciarEquipo
IF %opc% == 3 GOTO mostrarVariables
IF %opc% == 4 GOTO listarFicherosTexto
IF %opc% == 5 GOTO modificarTMP
IF %opc% == 6 GOTO fin
GOTO menu

:mostrarArbol
DIR c:\windows
PAUSE
GOTO menu

:reiniciarEquipo
SHUTDOWN /R /T 180
ECHO El ordenador se prepara para apagarse y reiniciarse en 3 minutos
PAUSE
GOTO menu

:mostrarVariables
SET | SORT /R
PAUSE
GOTO menu

:listarFicherosTexto
DIR /Q /S C:\*.txt
PAUSE
GOTO menu

:modificarTMP
ECHO Actualmente TMP contiene:
ECHO %TMP%
SET TMP=%TMP%;%HOMEDRIVE%%HOMEPATH%\Desktop
ECHO Ahora TMP contiene:
ECHO %TMP%
PAUSE
GOTO menu

:fin
