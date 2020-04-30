@echo  off
rem Script asociado a la tarea de bucles
rem Autor: César Ravelo Martínez
rem Fecha: 30/04/2020

cls
echo *****************************************
echo   Operaciones:
echo.
echo 1. Mostrar ficheros de escritorio.
echo 2. Mostrar tabla de multiplicar.
echo *****************************************

set /P opc="Elige una operacion: "
if %opc% == 1 goto mostrarEscritorio
if %opc% == 2 goto mostrarTabla

echo.
echo Opcion incorrecta!!!!
goto fin

rem Sección dedicada a mostrar los ficheros del escritorio
:mostrarEscritorio
for %%f in (%USERPROFILE%\Desktop\*.txt %USERPROFILE%\Desktop\*.bat) do (
	echo - Contenido del fichero %%f
	echo.
	type %%f
	echo.
	echo ---------------------------
	echo.
)
goto fin

rem Sección dedicada a mostrar la tabla de multiplicar
:mostrarTabla
echo Introduce el numero a mostrar su tabla:
set /P x=
set i=0
echo.

:bucle
if %i% GTR 10 goto fin
set /A result= x * i
echo %x% x %i% = %result%
set /A i=%i% + 1
goto bucle

:fin