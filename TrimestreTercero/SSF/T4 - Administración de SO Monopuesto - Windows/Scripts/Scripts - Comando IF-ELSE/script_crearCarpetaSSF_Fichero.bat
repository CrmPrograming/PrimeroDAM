@echo off
rem Script como prueba del bloque IF-ELSE creador de una carpeta y fichero.
rem En caso de existir la carpeta no hará nada y en caso de existir el fichero, lo borrará previamente.
rem Autor: César Ravelo Martínez
rem Fecha: 16/04/2020

cls
set DIRECTORIO=SSF
if exist %DIRECTORIO% (
	echo Ya existe una carpeta llamada "%DIRECTORIO%". No se intentará crear nuevamente
) else (
	mkdir %DIRECTORIO%
)
set /P fichero="Introduzca el nombre del fichero a crear: "
if exist %fichero% (
	echo Se ha encontrado un fichero con dicho nombre. Se borrara antes de volver a crearlo
 	del %fichero%
)
echo A continuacion se creara el fichero "%fichero%". Puede escribir su contenido:
echo. > %DIRECTORIO%\%fichero%