@echo off
rem Script encargado de simular una calculadora básica
rem Autor: César Ravelo Martínez
rem Fecha: 16/04/2020

cls
:menu
echo *****************************************
echo   CALCULADORA - Operaciones:
echo.
echo A. Sumar.
echo B. Restar.
echo C. Multiplicar.
echo D. Dividir.
echo S. Salir.
echo *****************************************

set /P opc="Elige una operacion: "

if %opc% == A goto sumar
if %opc% == B goto restar
if %opc% == C goto multiplicar
if %opc% == D goto dividir
if %opc% == S goto fin

echo.
echo Opcion incorrecta!!!!
goto menu

:sumar
echo Introduce el primer numero:
set /P x=
echo Introduce el segundo numero:
set /P y=
set /A result=%x% + %y%
echo La suma es %result%
goto menu

:restar
echo Introduce el primer numero:
set /P x=
echo Introduce el segundo numero:
set /P y=
set /A result=%x% - %y%
echo La resta es %result%
goto menu

:multiplicar
echo Introduce el primer numero:
set /P x=
echo Introduce el segundo numero:
set /P y=
set /A result=%x% * %y%
echo La resta es %result%
goto menu

:dividir
echo Introduce el primer numero:
set /P x=
echo Introduce el segundo numero:
set /P y=
if %y% == 0 goto errorDividir
set /A result=%x% / %y%
echo La division es %result%
goto menu

:errorDividir
echo Imposible realizar division entre 0
goto menu
:fin