Nombre='Juan Francisco Mier Montoto';

disp(['Practica entregada por ',Nombre])
%% Ejercicio 1
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 1    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, clc, format long
% Se definen las variables.
f = @(x) 7.6.*x.^2 - exp(x./7.6) .* cos(pi.*x./7.6);
% MEJOR -> f = @(x) 7.6*x.^2 - exp(x/7.6).*cos(pi*x/7.6);
numNodos = 16; % Como el numero de subintervalos es 15, el de nodos es 15+1
intervalo = [0 7.6];
integralTrapecio = trapecio_compuesta(f, intervalo(1), intervalo(2), 15); % Se aplica trapecio compuesta con 15 subintervalos.

% Se calcula el error cometido.
syms x, f_sim(x) =  f(x); % Se convierte la función a simbólica.
integralExacta = double(int(f_sim, intervalo(1), intervalo(2))); % Se obtiene la integral exacta.
a = abs(integralExacta - integralTrapecio); % Se calcula el error cometido.

% Para la cota del error:
epsilon = 1e-4;
f2 = diff(f_sim, 2); % Se obtiene la derivada segunda.
fplot(matlabFunction(f2), intervalo) % Se representa la segunda derivada.
x0 = fzero(matlabFunction(diff(f2)), 2); % Se obtiene el punto máximo a partir de la representación.
M = max(double(abs(f2([intervalo(1), x0, intervalo(2)])))); % Se obtiene M incluyendo los extremos del intervalo.
n = ceil(sqrt((intervalo(2) - intervalo(1))^3 * M / 12 / epsilon)); % Se calcula la cantidad de nodos mínimos para superar la cota del error.

disp(n)
% FALTA VOLVER AL FORMATO POR DEFECTO -> format 
disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, clc, format long
% Se definen las variables.
f = @(x) 58.*x.^2 - exp(x./262).*cos(pi.*x./169);
% MEJOR -> f = @(x) 58*x.^2 - exp(x/262).*cos(pi*x/169);
intervalo = [0 86];
integralSimpson = simpson_compuesta(f, intervalo(1), intervalo(2), 8); % Se aplica simpson compuesta con 8 subintervalos.

% Se calcula el error cometido.
syms x, f_sim(x) =  f(x); % Se convierte la función a simbólica.
integralExacta = double(int(f_sim, intervalo(1), intervalo(2))); % Se obtiene la integral exacta.
a = abs(integralExacta - integralSimpson); % Se calcula el error cometido.
disp(a) % Se muestra el error absoluto.
% FALTA VOLVER AL FORMATO POR DEFECTO -> format 
disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, clc, format long
f = @(x) exp(-x);
disp(intGauss5(f, -2, 14.5))
% FALTA VOLVER AL FORMATO POR DEFECTO -> format
disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, clc, format long
% Se declara las variables.
f = @(x) 17956 .* x.^2 - exp(x./201).*cos(5.*pi.*x./67);
% MEJOR -> f = @(x) 17956*x.^2 - exp(x/201).*cos(5*pi*x/67);
intervalo = [0 67];
n = 17; % Número de subintervalos.
xx = linspace(intervalo(1), intervalo(2), n+1);
integralTrapz = trapz(xx, f(xx));

% Se calcula el error cometido.
syms x, f_sim(x) =  f(x); % Se convierte la función a simbólica.
integralExacta = double(int(f_sim, intervalo(1), intervalo(2))); % Se obtiene la integral exacta.
a = abs(integralExacta - integralTrapz); % Se calcula el error cometido.
disp(a) % Se muestra el error absoluto.
% FALTA VOLVER AL FORMATO POR DEFECTO -> format 
disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, clc, format long
% Se declara las variables.
f = @(x) 1156.*x.^2 - (exp(x./51) .* cos(5.*pi.*x./17))./(x+2);
% MEJOR -> f = @(x) 1156*x.^2 - (exp(x/51).*cos(5*pi*x/17))./(x+2);
intervalo = [0 17];
disp(integral(f, intervalo(1), intervalo(2)))
% FALTA VOLVER AL FORMATO POR DEFECTO -> format 
disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%
% NOTA -> 10,0