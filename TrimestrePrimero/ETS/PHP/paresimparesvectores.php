<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicios PHP: Mostrar pares e impares entre un rango con vectores</title>
    <link rel="stylesheet" href="css/general.css">
</head>
<body>
   <h1>Ejercicio 4: Mostrar pares e impares entre un rango con vectores</h1>
   
   <form action="paresimparesvectores.php" method="get">
       <div class="formulario">
            <p>
                Inserte los extremos del rango para mostrar los resultados
            </p>
            <ul>
                <li>Valor a: <input type="text" name="a" value="1" placeholder="1"/></li>
                <li>Valor b: <input type="text" name="b" value="1000" placeholder="1000"/></li>
                <li><input type="submit" value="Mostrar Resultados" /></li>
            </ul>
       </div>
   </form>   
   
   <div class="cajaGeneral">
   
       <!-- CÓDIGO PHP -->
       <?php
            include('funciones.php');
            // Definición de variables inicial
            // Petición de datos por teclado
            $a = (isset($_GET["a"]))?$_GET["a"]:1;
            $b = (isset($_GET["b"]))?$_GET["b"]:1000;
            
            // Obtenemos el listado de pares e impares por separado
            //  $lista[0] <- pares
            //  $lista[1] <- impares
            $lista = paresImpares($a, $b);
       
            // Mostramos los pares entre A y B
            echo "<h2>Valores pares entre ". $a ." y ". $b ."</h2>\n";
            foreach ($lista[0] as $i)
                echo "<div class='cajaNumero'>". $i ."</div>\n";
                
            // Mostrar valores impares entre A y B
            echo "<hr>\n<h2>Valores impares entre ". $a ." y ". $b ."</h2>\n";
            foreach ($lista[1] as $i)
                echo "<div class='cajaNumero'>". $i ."</div>\n";
            
       ?>
    </div>
   
</body>
</html>