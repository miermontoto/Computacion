Nombre='Juan Francisco Mier Montoto';

disp(['Practica entregada por ',Nombre])
%% Ejercicio 1
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 1    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format
A = [ 1.4 -0.2 -2.8 ; 0.7 -0.1 -1.6 ; 1.9 -0.3 -4.4 ];
b = [ 1.6 ; 0.88 ; 2.4 ]; % se declaran las variables

condA = cond(A); % se calcula el número de condición de A
x = A\b; % solución original
A(3,1) = A(3,1) + 0.01; % se le suma una centésima al primer elemento de la tercera columna.
x1 = A\b; % solución modificada
errorPorcentual = norm(x1 - x) / norm(x) * 100; % se calcula el error relativo en porcentaje.
display(errorPorcentual + condA) % se muestra el resultado requerido.

disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format
A = [ -0.18 0.0324 0.0126 ; 0.0175 -0.07 0.0175 ; 0.0049 0.0126 -0.07 ];
b = [ -0.028836 ; -0.0126 ; 0.01575 ]; % se declaran las variables.
T = 1e-8; N = 500; % parámetros que se le pasan a la función de Jacobi.

%%% ¿Es aplicable el método?
% A simple vista se comprueba que en la diagonal principal de A no hay
% elementos nulos.
D = diag(diag(A)); % se calcula la matriz diagonal de A.
B = -inv(D) * (A-D); % se calculan la matriz de autovalores de A.

radioEspectral = max(abs(eig(B))); % se calcula el radio espectral de A.
% Se comprueba que el radio espectral de A sea menor que uno.
if(radioEspectral < 1), disp("El radio espectral de la matriz es menor que uno, se puede resolver por Jacobi.")
else, disp("No se puede aplicar el método a esta matriz."), exit, end

%%% Se aplica el método de Jacobi una vez confirmado.
x = jacobi(A, b, T, N);
display(sum(x) + radioEspectral)

disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format
% Se declaran las variables.
A0 = 7.11; B0 = 6; C0 = 1.5; % Datos iniciales.
t1 = 0; t2 = 0.5; t3 = 1;
y1 = 6.61 ; y2 = -6.61 ; y3 = 6.61;
T = 1e-6; N = 100; % parámetros que se le pasan a la función newton_n

% Se declaran las variables y las funciones simbólicas.
syms A B C
f1(A,B,C) = A*sin(t1*B+C) - y1; 
f2(A,B,C) = A*sin(t2*B+C) - y2; 
f3(A,B,C) = A*sin(t3*B+C) - y3;
f(A,B,C) = [ f1(A,B,C) ; f2(A,B,C) ; f3(A,B,C) ]; % Se declara la función f como un vector de ecuaciones (no lineales).
df = jacobian(f); % Se halla su matriz jacobiana.

% Se convierten ambas funciones a numéricas vectoriales.
fNum = matlabFunction(f);
dfNum = matlabFunction(df);

fVect = @(z) fNum(z(1), z(2), z(3));
dfVect = @(z) dfNum(z(1), z(2), z(3));

res = newton_n(fVect, dfVect, [A0;B0;C0], T, N); % Se usa newton con los valores iniciales propuestos.
sum(res) % Se calcula la suma de los tres valores del vector resultado.


disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format short e
x0 = 0.097; y0 = 0.1455; % Se declaran las variables.

% Se declaran las funciones anónimas.
a1 = @(x,y) -exp(x*x) + 8*x*sin(y-30); % FALTAN -> .'s
a2 = @(x,y) x*x + y*y + 2.582*y + 0.666681; % FALTAN -> .'s

% Se representan ambas funciones en el intervalo estipulado.
fimplicit(a1, [-3, 3]);
hold on, fimplicit(a2, [-3 3]);
% FALTA -> hold off 
% Se iguala z(1) a x y z(2) a y.
f1 = @(z) -exp(z(1).^2) + 8*z(1)*sin(z(2) - 30);
f2 = @(z) z(1)^2 + z(2)^2 + 2.582*z(2) + 0.666681;
f = @(z) [ f1(z) ; f2(z) ];

res = fsolve(f, [x0 y0]); % se resuelve mediante fsolve
sum(res) % Se devuelve la suma del vector resultado.

disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format
A = [ 5 0 0 ; 0 3 0.5 ; 0 0.5 3 ]; b = [ 4 ; 4 ; 0 ]; x0 = [ 1 ; 1 ; 1 ]; % se declaran variables.
T = 1e-7; N = 500; % parámetros de la función iterar.
res = iterar(A, b, x0, T, N); % Se calcula el resultado mediante la función iterar.m
sum(res) % Se calcula la suma de los componentes del vector resultado.

disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%

% NOTA -> 10,0