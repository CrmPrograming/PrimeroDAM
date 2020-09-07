#! /bin/bash

# Autor: César Ravelo Martínez
# Actividad 5.9

clear
opc=-1
while [ $opc -ne 0 ];
do
	# Menú principal de la aplicación
	echo "###########################################"
	echo "1) Ver la versión del sistema."
	echo "2) Ver el espacio libre en el sistema."
	echo "3) Ver los usuarios conectados."
	echo "4) Crear una carpeta llamada 'temporal' en el escritorio."
	echo "5) Guarda en un fichero en el escritorio las 5 últimas líneas del fichero de usuarios (passwd)"
	echo "6) Guarda en un fichero todos los números pares entre 0 y un número."
	echo "7) Añadir permiso de ejecución para el propietario a un fichero."
	echo "0) Salir."
	echo "##########################################"
	echo
	read -p "- Indique la opción a ejecutar: " opc
	echo

	case $opc in
		1) uname -mrs;;
		2) df;;
		3) who;;
		# Si la carpeta ya existe, se muestra un mensaje de aviso
		4) if [ -d $HOME/Escritorio/temporal ]; then
			echo "La carpeta ya existe"
		   else
			mkdir $HOME/Escritorio/temporal
		   fi
		   ;;
		5) tail -n 5 /etc/passwd > $HOME/Escritorio/filasPasswd.txt;;
		6) read -p "- Indique el valor límite: " num
		   for ((i=0; i <= num; i++))
			do
				actual=$(($i%2))
				if [ $actual -eq 0 ]; then
					echo $i >> $HOME/Escritorio/lista_pares_$num.txt
				fi
			done
		   ;;
		# Si el fichero no se encuentra, se muestra un mensaje de aviso
		7) read -p "- Indique el nombre del fichero  a modificar: " fich
		   if [ -e $fich ]; then
			chmod u+x $fich 
		   else
			echo "El fichero indicado no existe o no se encontró"
		   fi
		   ;;
		0) ;;
		*) echo "Operación no válida" ;;
	esac
	
	echo
done
