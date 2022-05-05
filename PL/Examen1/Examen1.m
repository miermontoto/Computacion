Nombre='Juan Francisco Mier Montoto';

disp(['Practica entregada por ',Nombre])
%% Ejercicio 1
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 1    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format
sumapotalternada(82,4) % Se utiliza la función sumapotalternada.m

disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format
Log(9.4, 1e-6) % Se utiliza la función Log.m

disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format
% Se definen las variables.
alpha = pi/6; % alpha = 30º
r1 = 9.92; r2 = 6.03; r3 = 8.01; r4 = 4; % longitud de las barras.
R1 = r1 / r2; R2 = r1 / r4; R3 = (r1^2 + r2^2 - r3^2 + r4^2)/(2*r2*r4);
% 15º = pi/12, 30º = pi/6
f=@(x) R1*cos(alpha)-R2*cos(x)+R3-cos(alpha-x); % Se define la función anónima.
r=biseccion(f,pi/12,pi/6,1e-8); % Se calcula la raíz de la función entre 15º y 30º.
disp(rad2deg(r)) % ¡IMPORTANTE! Se da la solución en grados.

disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format long % Se utiliza el formato estipulado en el enunciado.

eD = 0.001; Re = 20330; % Se declaran las variables.
%disp(0.16*Re.^-0.16) % Aproximación del resultado. 
% NO UTILIZAS LA APROXIMACIÓN DEL ENUNCIADO
f=@(x) (-2*log10(eD./3.7 + 2.51./(Re*sqrt(x)))).^-2; % Se declara la función.
% LA REPRESENTACIÓN GRÁFICA ES INNECESARIA. 
fplot(f,[-5 5])
hold on, fplot(@(x) x, [-5 5]) % Se visualiza la función para ver el intervalo de la raíz.
% FALTA -> hold off 
ptofijo(f,0.5,1e-6,500) % Se calcula mediante el método de punto fijo.
% NO SE VE POR QUÉ TOMAS COMO ITERACIÓN INICIAL -> 0.5
% NOTA -> -0,5 
disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format
syms p % Se declaran las matrices con p como incógnita.
A = [ p 2.55 0.01 1 ; 2.55 p 0.01 1 ; 0.01 0.01 p 1 ; 1 1 1 p ];
b = [ 1 ; 1 ; 1 ; 1 ];
% Para que se pueda resolver aplicando el Algoritmo de Cholesky, la matriz
% debe de ser simétrica y definida positiva. Siempre es simétrica,
% independientemente del valor de p, por lo que se está preguntando en
% realidad es cuál es el valor mínimo que hace que todos los menores de A 
% sean positivos.

% Para que los menores sean positivos:
%%% Menor 1: p > 0
%%% Menor 2: p^2 - 2.55^2 > 0 -> p^2 > 2.55^2 -> p > 2.55
%%% Menor 3: p^3 + 0.01^2*2.55*2 - 0.01^2*p*2 - 2.55^2*p > 0 -> 
%%%%% p^3  - 6.5027p + 5.1e-4 > 0
f=@(x) x^3 - 6.5027*x + 5.1e-4;
%fplot(f,[0 5])
%hold on, grid
biseccion(f, 2, 3, 1e-8); %%% p > 2.55

%%% Para el determinante, se evalúa directamente el determinante de A como
%%% función numérica, entre un rango.
%fplot(det(A),[0 5])
%hold on, grid 
% Se escoge la raíz mayor que 2.55, puesto que ya sabemos que p tiene que
% ser mayor que dicho valor.
biseccion(matlabFunction(det(A)), 2, 3, 1e-8); %%% p > 2.55
% Todos los menores de A son positivos para p > 2.55

c = 2.55 + 1; % Se escoge 2.55 + 1
Adef = [ c 2.55 0.01 1 ; 2.55 c 0.01 1 ; 0.01 0.01 c 1 ; 1 1 1 c ];
% NO ES NECESARIO RESOLVER EL SISTEMA POR CHOLESKI
U = chol(Adef); % Se calcula la matriz de Cholesky de A.
y = sustitucion_progresiva(U.', b);
x = sustitucion_regresiva(U, y); % Se aplican las sustituciones correspondientes.

sum(x) % Resultado

disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%

% NOTA -> 10 - 0,5 