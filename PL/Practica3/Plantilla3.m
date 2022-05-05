% Zona para rellenar el nombre y los apellidos
% Por ejemplo:
% Nombre='Juan Luis González-Santander';
Nombre='Juan Francisco Mier Montoto';

disp(['Practica entregada por ',Nombre])
%% Ejercicio 1
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 1    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 1
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"
% FALTAN COMENTARIOS 
clear
f=@(x) 10*x.^3-2.0*x.^2+20*x-4;
fplot(f,[-1,1]);grid
biseccion(f,0,0.5,1e-5)
% NOTA -> -0,25
disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 2
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"
clear
% FALTAN COMENTARIOS 
l1=8; l2=11.1;
f=@(x) (l2*cos(2*pi/5 - x)./sin(2*pi/5 - x).^2)-(l1*cos(x)./sin(x).^2);
biseccion(f,0,pi/2,1e-6)
% NOTA -> -0,25 
disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 3
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"
% FALTAN COMENTARIOS 
clear
g=@(x) -0.054644808743169*x^5+0.033879781420765*x^4+0.62; % FALTAN .'s
ptofijo(g,1.83,1e-5,100)
% NOTA -> -0,25 
disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 4
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"
% FALTAN COMENTARIOS 
clear
d=24900;
n=169;
c=249;
f=@(x) c/d*(1-(1+x).^-n);
% FALTA REPRESENTACIÓN GRÁFICA PRA JUSTIFICAR LA ITERACIÓN INICIAL
ptofijo(f,1,1e-5,500)*1200 % MEJOR -> disp(ptofijo(f,1,1e-5,500)*1200)
% NOTA -> -0,5 
disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 5
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"
% FALTAN COMENTARIOS 
clear
f=@(x) 100*x*exp(x)-0.001*exp(x)+100*x-0.001; % FALTAN -> .'s

x=biseccion2(f,0,12.8,1e-5);
x(15)*100 % MEJOR -> disp(x(15)*100)
% NOTA -> -0,25 
disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%

% NOTA -> 10 - 0,25 - 0,25 - 0,25 - 0,5 - 0,25 