@echo  off
rem Script asociado al juego de adivinar un número aleatorio
rem Autor: César Ravelo Martínez
rem Fecha: 01/05/2020

cls
:inicio
echo.
SET /A num=(%RANDOM%*100/32768)
SET intentos=0

:loopPregunta
SET /P numIntento="- Indique un numero entre 0 y 100: "
SET /A intentos=%intentos% + 1

IF %numIntento% LSS %num% GOTO menor
IF %numIntento% GTR %num% GOTO mayor

echo.
echo ##################################
echo.
echo Has acertado! El numero era %num%
echo Tras %intentos% intentos has acertado
echo.
echo ##################################
echo.
SET /P seguir="Quieres volver a probar? (S/N): "
IF %seguir% == S GOTO inicio
IF %seguir% == s GOTO inicio
GOTO fin

:mayor
ECHO El numero es menor
GOTO loopPregunta

:menor
ECHO El numero es mayor
GOTO loopPregunta

:fin
echo.
ECHO Hasta la proxima!
