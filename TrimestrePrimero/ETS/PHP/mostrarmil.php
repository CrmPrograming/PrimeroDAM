<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicios PHP: Mostrar nº del 1 al 1000</title>
    <style type="text/css">
        /* Estilo General */
        body {
            background-color: #faece5;
        }
        
        h1 {
            text-decoration: underline;
        }
        
        /* Estilo de las cajas */
        .cajaGeneral {
            text-align: center;
        }
        .cajaNumero {            
            width: 30px;
            padding: 5px;
            margin: 2px;
            display: inline-block;
            color: white;
            font-weight: bold;
        }
        .cajaNumero:nth-child(even) { background-color: #ef9393;}
        .cajaNumero:nth-child(even):hover { background-color: #e11d1d;}
        .cajaNumero:nth-child(odd) { background-color: #94efbb;}
        .cajaNumero:nth-child(odd):hover { background-color: #1de172;}
    </style>
</head>
<body>
   <h1>Ejercicio 2: Mostrar nº del 1 al 1000</h1>
   
   <div class="cajaGeneral">
   
       <!-- CÓDIGO PHP -->
       <?php
            // Definición de variables inicial
            define("TOTAL_MOSTRAR", 1000);
            $i = 1;
        
            // Mostrar tantos valores desde 1 hasta TOTAL_MOSTRAR
            for ($i = 1; $i <= TOTAL_MOSTRAR; $i++) {
                if ($i == 113) {
                    echo $i;
                }
                echo "<div class='cajaNumero'>". $i ."</div>\n";                
            }
       ?>
    </div>
   
</body>
</html>