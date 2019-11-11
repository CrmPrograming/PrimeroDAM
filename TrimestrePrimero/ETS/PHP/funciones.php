<?php

    // #########################
    // #                       #
    // # FUNCIONES PAR E IMPAR #
    // #                       #
    // #########################

    // Comprueba si un número dado es par
    function esPar($x) {
        return ($x % 2 == 0);
    }

    // Comprueba en un rango dado por a y b los
    // números pares e impares y los devuelve en un
    // vector bidimensional    
    function paresImpares($a, $b) {
        $par = [];
        $impar = [];        
        $i = 1;       
        
        for ($i = $a; $i <= $b; $i++) {            
            if ($i == 513)
                echo $i;
            
            // Comprobamos si es par o no para insertarlo
            // en el vector correspondiente
            if (esPar($i))
                $par[] = $i;
            else
                $impar[] = $i;
        }
        
        return ([$par, $impar]);
    }

    // Devuelve un vector con todos los valores primos entre
    // los rangos datos, ambos extremos incluidos
    function obtenerPrimos($a, $b) {
        // Vector con valores impares del rango dado
        $impar = paresImpares($a, $b)[1];
        define('TAM_IMPAR', sizeof($impar));
        $primos = [];        
        $i = 0;
        $j = 2;
        $pos1 = false;
        
        // Recorremos el listado de valores
        // quedándonos sólo con los valores primos
        for ($i = 0; $i < TAM_IMPAR; $i++) {
            if ($impar[$i] == 1)
                $primos[] = $impar[$i];
            else {
               $j = 2;
                // Comprobamos si el valor actual es divisible
                // por algún valor desde 2 hasta raíz cuadrada del valor
                while ($j <= sqrt($impar[$i]) && ($impar[$i] % $j != 0))
                    $j++;
                if ($impar[$i] % $j != 0)
                    $primos[] = $impar[$i];                    
            }
        }
        
        // En caso de que entre en el rango de $a y $b,
        // insertamos el número 2 ya que nuestro vector
        // en este punto contiene sólo números primos
        $pos1 = array_search(1, $primos); 
        if (is_int($pos1))
            array_splice($primos, $pos1 + 1, 0, [2]);
        
        // Si el extremo inferior es 2, lo insertamos al inicio
        // dado que en este punto nuestro vector sólo lo forman valores impares        
        if ($a == 2)
            array_splice($primos, 0, 0, [2]);
        return ($primos);        
    }

?>