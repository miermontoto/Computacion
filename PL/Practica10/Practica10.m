Nombre='Juan Francisco Mier Montoto';

disp(['Practica entregada por ',Nombre])
%% Ejercicio 1
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 1    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
% Se declaran las variables.
f = @(x) x.^3 - 26.16.*x.^2 + 22.44.*x + 4.4;
p = [1 -26.16 22.44 4.4];
raices = roots(p); % Se obtienen las ra�ces de la funci�n.
intervalo = [min(raices) max(raices)]; % Se obtiene el intervalo.

% Se obtiene la funci�n opuesta a f para calcular el punto m�ximo.
g = @(x) -f(x);

% Se representa la funci�n.
fplot(f, intervalo)

% Se calculan los extremos.
m = fminbnd(f, intervalo(1), intervalo(2)); % m�nimo
M = fminbnd(g, intervalo(1), intervalo(2)); % m�ximo

disp(f(M) - f(m)) % Se muestra el resultado requerido.

disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
% Se declaran las variables
F = @(x, y) y.^2 + 42.01.*x.^2 - 10.2.*x.*y + 13.6.*x + 8.49;
N = 500; % n�mero de iteraciones.
T = 1e-5; % tolerancia.
R = [-2 2 -3 3]; % regi�n.

% Se representa la funci�n
subplot(121), fsurf(F, R), subplot(122), fcontour(F, R) % BASTA CON -> fcontour(F, R)

f = @(x) F(x(1), x(2)); % Se define la funci�n a minimizar como funci�n an�nima de una sola variable vectorial.

% Se utiliza jacobian para calcular su gradiente.
syms x y
Gf = matlabFunction(jacobian(f([x;y])).');
Gf = @(x) Gf(x(1), x(2)); % Se define como funci�n an�nima de una sola variable vectorial.

% Se obtiene el m�ximo.
[x,n] = MaximaPendiente(f, Gf, [0;0], T, N);

disp(x(1) + x(2) + f(x)) % Se muestra el resultado. % MEJOR -> disp(sum(x) + f(x))

disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
% Se declaran las variables.
F = @(x, y) 16.*x.^2 + 36.*y.^2 - 20.8.*x - 62.4.*y + 39.4;

R = [-2 2 -3 3]; % regi�n.

% Se representa la funci�n
subplot(121), fsurf(F, R), subplot(122), fcontour(F, R) % BASTA CON -> fcontour(F, R)

f = @(x) F(x(1), x(2)); % Se define la funci�n a minimizar como funci�n an�nima de una sola variable vectorial.
m = fminsearch(f, [0;1]); % Se obtiene el m�nimo mediante la funci�n.

disp(m(1) + m(2) + f(m)) % Se muestra el resultado. % MEJOR -> disp(sum(m) + f(m))

disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
% Se declaran las variables.
f = [600 300];
A = [2 1.5 ; 1 0.25];
b = [1200 376]';

x = linprog(-f, A, b); % Se utiliza -f porque linprog obtiene el m�nimo.
disp(f*x) % Se obtiene el beneficio.

disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
% Se declaran las variables.
E = 1e-4; % tolerancia.
intervalo = [0 2];
f = @(x) 1.93 * abs(integral(@(t) cos(2.*t).^(x + 0.37), 0, x + 0.37));

% Se representa la funci�n en el intervalo.
fplot(f, intervalo)
% LA FUNCI�N -> f NO EST� VECTORIZADA. MEJOR UTILIZA UN BUCLE PARA HALLAR
% LOS PUNTOS (x,y) DE LA FUNCI�N Y LUEGO REPRESENTA CON plot(x,y)

% Se obtiene el m�nimo
[xmin, alturaMin] = metodo_aureo2(f, 0.5, 1, E);
disp(xmin + alturaMin) % Se muestra el resultado.

disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%
% NOTA -> 10,0