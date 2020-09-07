#! /bin/bash

# Autor: César Ravelo Martínez
# Actividad 5.8

read -p "Introduzca el primer número: " x
read -p "Introduzca el segundo número: " y

if [ $x -gt 0 ] && [ $y -gt 0 ]; then
	echo Ambos números son mayores a 0
elif [ $x -lt 0 ] && [ $x -lt 0 ]; then
	echo Ambos números son menores a 0
else
	echo Los números no son mayores o menores a 0 al mismo tiempo
fi
