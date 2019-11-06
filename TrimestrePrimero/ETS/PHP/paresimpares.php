<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicios PHP: Mostrar pares e impares entre un rango</title>
    <link rel="stylesheet" href="css/general.css">
</head>
<body>
   <h1>Ejercicio 3: Mostrar pares e impares entre un rango</h1>
   
   <form action="paresimpares.php" method="get">
       <div class="formulario">
            <p>
                Inserte los extremos del rango para mostrar los resultados
            </p>
            <ul>
                <li>Valor a: <input type="text" name="a" value="25" placeholder="25"/></li>
                <li>Valor b: <input type="text" name="b" value="2583" placeholder="2583"/></li>
                <li><input type="submit" value="Mostrar Resultados" /></li>
            </ul>
       </div>
   </form>   
   
   <div class="cajaGeneral">
   
       <!-- CÓDIGO PHP -->
       <?php
            // Definición de variables inicial
            $a = (isset($_GET["a"]))?$_GET["a"]:25;
            $b = (isset($_GET["b"]))?$_GET["b"]:2583;
            $i = 1;           
       
            // Mostrar valores pares entre A y B
            echo "<h2>Valores pares entre ". $a ." y ". $b ."</h2>\n";
            for ($i = $a; $i <= $b; $i++) {
                if ($i % 2 == 0)
                    echo "<div class='cajaNumero'>". $i ."</div>\n";
            }
       
            // Mostrar valores impares entre A y B
            echo "<hr>\n<h2>Valores impares entre ". $a ." y ". $b ."</h2>\n";
            for ($i = $a; $i <= $b; $i++) {
                if ($i % 2 == 1)
                    echo "<div class='cajaNumero'>". $i ."</div>\n";
            }
       ?>
    </div>
   
</body>
</html>