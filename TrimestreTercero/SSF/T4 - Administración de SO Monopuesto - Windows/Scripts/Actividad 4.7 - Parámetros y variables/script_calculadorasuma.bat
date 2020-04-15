@echo off
set /P var1=- Introduzca el primer num: 
set /P var2=- Introduzca el segundo num: 
set /A result=%var1%+%var2%
echo - El resultado de la suma es: %result%