Nombre='Juan Francisco Mier Montoto';

disp(['Practica entregada por ',Nombre])
%% Ejercicio 1
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 1    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
% Se obtiene el valor de P
f = @(p) cond([p 0 1 ; 0 2.13 0 ; 0 0 1]) - 804;
p = fsolve(f, 0.1);
% El determinante de A se hace nulo para valores de p
% muy pequeños, pero no se puede iniciar fsolve con x0
% en 0.

% Se declaran las variables.
A = [p 0 1 ; 0 2.13 0 ; 0 0 1];
b = [0 ; 1 ; 1];

x = A\b; % Se resuelve el sistema.
norm(x) % Se muestra el resultado requerido.

disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
% Se declaran las variables.
syms a b
f1(a, b) = cosh(a + 2*b) - cosh(a - 2*b) - 2.6;
f2(a, b) = cosh(2*a + b) - cosh(2*a - b) - 2.6;

f(a, b) = [f1(a, b) ; f2(a, b)];
df = jacobian(f); % Se halla la matriz jacobiana del sistema.

% Se convierten ambas funciones a numéricas.
fNum = matlabFunction(f);
dfNum = matlabFunction(df);

% Se convierten ambas funciones a vectoriales.
fVect = @(z) fNum(z(1), z(2));
dfVect = @(z) dfNum(z(1), z(2));

res = newton_n(fVect, dfVect, [1;1], 1e-6, 500); % Se utilizan parámetros genéricos, ya que no se indican.
sum(res)

disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, clc, format long
% Se declaran las variables.
f = @(x) 1.52./(x.^4+x.^2+1);
x0 = pi/4;
E = 1e-5;

% Se obtiene la cantidad de nodos cuya cota no supera E.
% f = @(n) 2*exp(1) / factorial(abs(n+1)) * 0.5^(n+1) - E;
% n = fsolve(f, 10)
n = 13; % Este es el valor correcto de n, se procede con el ejercicio tras haberlo obtenido de manera "manual".
% NO QUEDA CLARO POR QUÉ n = 13
% HAS DE CALCULAR EL VALOR DE n CON UN BUCLE 
% Se calcula lagrange con la cantidad de nodos de Chebyshev obtenida.
i = 1:n; x = cos((2*i-1)*pi/(2*n)); y = f(x);
L = lagrange(x);
p = y * L;
aprox = polyval(p, x0); % Se obtiene el valor del polinomio de interpolación en el punto x0.
err = abs(aprox - f(x0)); % Se obtiene el error cometido comparándo dicho valor al de la función original.
if(err < E), disp('El error cometido es inferior a la cota.')
else, disp('El error cometido es superior a la cota dada.'), end

disp(err) % Se muestra el error cometido.

format

% NOTA -> -0,5 
disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, clc, format long
% Se declaran las variables.
f = @(x) 6.21.*log(2+cos(x));
intervalo = [0 pi];

syms x, f_sim(x) = f(x); % Se convierte la función a simbólica.

% Se obtiene el número mínimo de nodos necesarios.
epsilon = 1e-11; % Tolerancia del enunciado.
f2 = diff(f_sim, 2); % Se obtiene la derivada segunda.
fplot(matlabFunction(f2), intervalo) % Se representa la segunda derivada.
x0 = fzero(matlabFunction(diff(f2)), 2); % Se obtiene el punto máximo a partir de la representación.
M = max(double(abs(f2([intervalo(1), x0, intervalo(2)])))); % Se obtiene M incluyendo los extremos del intervalo.
nodosMin = ceil(sqrt((intervalo(2) - intervalo(1))^3 * M / 12 / epsilon)); % Se calcula la cantidad de nodos mínimos para superar la cota del error.
disp(nodosMin)
% NO HAS DE CALCULAR LA COTA DEL ERROR
% NO EXPLICAS CÓMO CALCULAS -> nodosMin. HAS DE CALCULARLO CON UN BUCLE 
nodosMin = 10; % !!! ESTE ES EL VALOR CORRECTO DE NODOSMIN! el cálculo anterior no funciona como debería.

% FALTA LA REPRESENTACIÓN GRÁFICA 

% Se calcula el error obtieniendo ambas integrales.
integralTrapecio = trapecio_compuesta(f, intervalo(1), intervalo(2), nodosMin); % Se aplica trapecio compuesta con 15 subintervalos.
integralExacta = integral(f, intervalo(1), intervalo(2));
err = abs(integralTrapecio - integralExacta);
disp(err) % Se muestra el resultado pedido por el enunciado.

% NOTA -> -0,75 

disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
% Se declaran las variables.
intervalo = [-5 5];
f = @(p) fminsearch(@(x) x.^4 + 6*p.^2.*x.^2 - 8*p.^3.*x + 1, [1;1]); % ERROR. NO HAS DE CALCULAR EL MÍNIMO DE ESTA FUNCIÓN 

fplot(f, intervalo)

disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%
% NOTA -> 8,0 - 0,5 -0,75 