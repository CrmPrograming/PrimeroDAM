@echo off
rem Script encargado de mostrar un menú con distintas operaciones.
rem Autor: César Ravelo Martínez
rem Fecha: 13/04/2020

:menu
cls
echo 1) Mostrar fecha
echo 2) Listar ficheros de c:\
echo 3) Mostrar informacion del sistema
echo 4) Abrir el panel de control
echo 5) Abrir la calculadora
echo 6) Salir
echo.

set /P opc="Elige una opcion: "
echo Has elegido la opcion %opc%
echo.

if %opc% == 1 goto mostrarFecha
if %opc% == 2 goto listarFicheros
if %opc% == 3 goto mostrarInfoSistema
if %opc% == 4 goto abrirPanelControl
if %opc% == 5 goto abrirCalculadora
goto fin

rem Nota: No preguntamos si opc == 6 ya que sea 6 o cualquier otra cosa, el programa saldrá por defecto

:mostrarFecha
echo # Mostrando la fecha actual
date /T
pause
goto menu

:listarFicheros
echo # Mostrando listado de ficheros en C:\
dir C:\
pause
goto menu

:mostrarInfoSistema
echo # Mostrando la informacion del sistema
ver
pause
goto menu

:abrirPanelControl
echo # Mostrando el panel de control
control
pause
goto menu

:abrirCalculadora
echo # Mostrando la calculadora
calc
pause
goto menu

:fin
echo.
echo Fin del script