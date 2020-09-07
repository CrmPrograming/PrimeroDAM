#! /bin/bash

# Autor: César Ravelo Martínez
# Actividad 5.8

read -p "Introduzca el primer número: " x
read -p "Introduzca el segundo número: " y

echo ¿Qué operación quiere realizar?
echo "1) Sumar"
echo "2) Restar"
echo "3) Multiplicar"
echo "4) Dividir"

read -p "Indique el número de la operación: " opc

case $opc in
	1) let result=$x+$y;;
	2) let result=$x-$y;;
	3) let result=$x\*$y;;
	4) result=$(echo "scale=2;$x/$y" | bc -l);;
	*) result="ERROR" ;;
esac

if [ $result = "ERROR" ]; then
	echo "Operación fallida; Opción indicada no válida"
else
	echo El resultado es: $result
fi
