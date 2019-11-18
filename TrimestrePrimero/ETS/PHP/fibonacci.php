<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicios PHP: Serie de Fibonacci</title>
    <link rel="stylesheet" href="css/general.css">
</head>
<body>
   <h1>Ejercicio 6: Mostrar la Serie de Fibonacci</h1>
   
   <form action="fibonacci.php" method="get">
       <div class="formulario">
            <p>
                Inserte el valor a buscar en la Serie de Fibonacci
            </p>
            <ul>
                <li>Valor a: <input type="text" name="a" value="15" placeholder="15"/></li>                
                <li><input type="submit" value="Mostrar Resultados" /></li>
            </ul>
       </div>
   </form>   
   
   <div class="cajaGeneral">
   
       <!-- CÓDIGO PHP -->
       <?php
            include('funciones.php');
            // Definición de variables inicial
            $a = (isset($_GET["a"]))?$_GET["a"]:15;
                      
            $serie = [];
       
            // Generamos la lista de los valores de la serie
            $serie = fibonacci($a);
       
            // Mostrar valores de la serie
            echo "<h2>Serie de Fibonacci para ". $a ."</h2>\n";
            foreach ($serie as $i)
                echo "<div class='cajaNumero'>". $i ."</div>\n";
       
       ?>
    </div>
   
</body>
</html>