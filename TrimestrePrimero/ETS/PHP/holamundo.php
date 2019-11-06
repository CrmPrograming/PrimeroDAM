<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicios PHP: Hola Mundo</title>
    <style type="text/css">
        /* Estilo General */
        body {
            background-color: #faece5;
        }
        
        h1 {
            text-decoration: underline;
        }
        
        /* Estilo personalizado de las cadenas */
        .cadena1 {
            color: #d60e0e;
            font-weight: bold;
        }
        
        .cadena2 {
            color: #0dd70d;
            font-weight: bold;
        }
    </style>
</head>
<body>
   <h1>Ejercicio 1: Hola Mundo y concatenar cadenas</h1>
   
   <!-- CÓDIGO PHP -->
   <?php
        // Definición de variables inicial
        $cadena1 = "Hola";
        $cadena2 = "Mundo";
        $cadenaResultado = "";
        
        // Concatenación de las cadenas
        // además de etiquetas HTML para su formateo
        $cadenaResultado = "<span class='cadena1'>". $cadena1 ." </span><span class='cadena2'>". $cadena2 ."!</span>"; 
        
        // Mostrar el resultado de la operación
        echo "<p>". $cadenaResultado . "</p>";
   ?>
   
</body>
</html>