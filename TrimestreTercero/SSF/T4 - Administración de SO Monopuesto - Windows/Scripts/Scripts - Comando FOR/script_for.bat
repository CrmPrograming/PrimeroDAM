@echo  off

set /P total="Indique el limite del bucle: "
for /L %%v in (1 1 %total%) do echo %%v