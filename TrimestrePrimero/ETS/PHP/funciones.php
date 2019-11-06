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

?>
