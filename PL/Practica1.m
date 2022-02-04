% Zona para rellenar el nombre y los apellidos
% Por ejemplo:
% Nombre='Juan Luis Gonz�lez-Santander';
Nombre='Juan Francisco Mier Montoto';

disp(['Practica entregada por ',Nombre])
%% Ejercicio 1
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 1    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aqu� la soluci�n del Ejercicio 1
% Para ejecutar este ejercicio, pon el cursor aqu� y pincha en "Run Section"
x = linspace(-5,5,1000);
y = x.^2; % se iguala el vector y al vector x con cada una de sus componentes al cuadrado
y = y+73; % se le suma a cada componente el valor 73
y = 100 ./ y; % se divide 100 por cada componente
max(y) % valor m�ximo del vector 'y'

disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aqu� la soluci�n del Ejercicio 2
% Para ejecutar este ejercicio, pon el cursor aqu� y pincha en "Run Section"

% se crea la matriz A como estipulado en el enunciado
% la cuarta fila se manipula posteriormente
A = [(20:20:400);(0.1:0.1:2).*20;linspace(200,2000,20);(0.1:0.1:2).*20];
A(4,8) = [0]; % se iguala a cero la octava columna de la cuarta fila
B = A([1,3,4],2:2:20); % se crea B a partir de A
C = B * (1:1:10)'; % se multiplica B por un vector de n�m. nat. de 1 a 10.
C = sum(C) % se suma el vector vertical C

disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aqu� la soluci�n del Ejercicio 3
% Para ejecutar este ejercicio, pon el cursor aqu� y pincha en "Run Section"
syms x y % se crean las variables simb�licas
f(x,y) = 126*x^2 + 43*exp(1)^(-2*x^2) + 39*x*y + cos(y) + y*y; % se escribe la funci�n simb�lica
dfy=diff(f,y); % se calcula la derivada parcial de f respecto de y
double(dfy(1/42,85*pi)) % se calcula y se convierte a n�mero real

disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aqu� la soluci�n del Ejercicio 4
% Para ejecutar este ejercicio, pon el cursor aqu� y pincha en "Run Section"
syms x % se crea la variable simb�lica
f=@(x) ((x-1).*14.^x.*cos(x))./x; % se crea la funci�n an�nima
A = [35 pi/2 ; 3*pi/2 1]; % se crea la matriz A
B = f(A); % se eval�a la funci�n en A y se almacena en B
B = sum(sum(B)) % se suman todos los valores de B

disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aqu� la soluci�n del Ejercicio 5
% Para ejecutar este ejercicio, pon el cursor aqu� y pincha en "Run Section"
syms x % se crea la variable simb�lica

% se crean las funciones f1-f9 (solo f8 es necesaria)
f1(x) = log(x+4);
f2(x) = exp(x);
f3(x) = sin(x);
f4(x) = cos(5*x/4);
f5(x) = x*x;
f6(x) = 1 - f5(x);
f7(x) = f2(-x*x/2);
f8(x) = f3(3*x)/x;
f9(x) = tan(x/3);

fplot(f8, [-3.8 3.8]) % se representa gr�ficamente f8 entre -3.8 y 3.8

disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%
