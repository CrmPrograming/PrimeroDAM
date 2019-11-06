<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicios PHP: Mostrar números primos en un rango</title>
    <link rel="stylesheet" href="css/general.css">
</head>
<body>
   <h1>Ejercicio 4: Mostrar números primos en un rango</h1>
   
   <form action="numprimo.php" method="get">
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
            // Definición de variables inicial
            $a = (isset($_GET["a"]))?$_GET["a"]:1;
            $b = (isset($_GET["b"]))?$_GET["b"]:1000;            
            $numeros = [];
            $i = 0;
       
            // Generamos el vector con los datos almacenados       
            for ($i = $a; $i <= $b; $i++) 
                $numeros[] = $i;
       
            // Mostrar valores primos entre A y B
            echo "<h2>Valores primos entre ". $a ." y ". $b ."</h2>\n";
            foreach ($numeros as $i)
                if ($i == 1 || $i == 2)
                    echo "<div class='cajaNumero'>". $i ."</div>\n"; 
                else {
                    $j = 2;                    
                    while ($j <= sqrt($i) && ($i % $j != 0))
                        $j++;
                    if ($i % $j != 0)
                        echo "<div class='cajaNumero'>". $i ."</div>\n"; 
                }            
       
       ?>
    </div>
   
</body>
</html>