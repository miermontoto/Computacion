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
x = linspace(-5,5,1000);
y = x.^2; % se iguala el vector y al vector x con cada una de sus componentes al cuadrado
y = y+73; % se le suma a cada componente el valor 73
y = 100 ./ y; % se divide 100 por cada componente
max(y) % valor máximo del vector 'y'

disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 2
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"

% se crea la matriz A como estipulado en el enunciado
% la cuarta fila se manipula posteriormente
A = [(20:20:400);(0.1:0.1:2).*20;linspace(200,2000,20);(0.1:0.1:2).*20];
A(4,8) = [0]; % se iguala a cero la octava columna de la cuarta fila
B = A([1,3,4],2:2:20); % se crea B a partir de A
C = B * (1:1:10)'; % se multiplica B por un vector de núm. nat. de 1 a 10.
C = sum(C) % se suma el vector vertical C

disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 3
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"
syms x y % se crean las funciones variables simbólicas
f(x,y) = 126*x^2 + 43*exp(1)^(-2*x^2) + 39*x*y + cos(y) + y*y;
dfy=diff(f,y);
double(dfy(1/42,85*pi))

disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 4
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"

disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 5
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"

disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%
