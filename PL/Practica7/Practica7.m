Nombre='Juan Francisco Mier Montoto';

disp(['Practica entregada por ',Nombre])
%% Ejercicio 1
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 1    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
p = [1 -21.8 118.81 0]; % Se definen los vectores que representan a los polinomios.
q = [1 0 -20.3525 46.0575 -26.705];

p1 = polyder(p); % p1 = derivada de p
h = conv(p1, q); % h = p1 * q
r = prod(roots(h)); % Producto de las raíces de h.
v = polyval(h, 5.45); % Se evalúa h en 5.45
disp(v+r)

disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
x = [4.2 5.04 5.88 6.72 7.56 8.4]; % Se declaran los vectores que definen a los puntos.
y = [-186.70176 936.6155172864 3880.5487838208 9820.2735977472 20298.992026522 37278.11808];

L = lagrange(x); % Se utiliza Lagrange sobre las x de los puntos.
p = y * L; % Se obtiene el polinomio de interpolación.

% Se representa el resultado.
plot(x, y, '.', 'markersize', 20)
xx = linspace(x(1), x(end)); % Intervalo de x's
yy = polyval(p, xx); % Se evalúa el polinomio en dicho intervalo.
hold on, plot(xx, yy)
legend('Nodos', 'Polinomio', 'location', 'northeast') % LA LEYENDA TAPA LA GRÁFICA
% FALTA -> hold off

disp(polyval(p, 4.9)) % Mostrar el resultado pedido en el enunciado.
% NOTA -> -0,25 

disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, clc, format short e

% Se declara la función.
f=@(x) -exp(0.35555555555556.*x-1.7777777777778).*sin(3.3333333333333-0.66666666666667.*x)./(4.4444444444444-0.88888888888889.*x);
intervalo = [-1.4 0.725];
x = linspace(intervalo(1), intervalo(2), 7); % Se divide el intervalo en 7 elementos.
y = f(x);

% Se calcula el polinomio de Lagrange.
L = lagrange(x);
p = y * L;

% Representar
fplot(f, intervalo, 'k')
hold on, fplot(@(x) polyval(p,x), intervalo, 'r:')
legend('f(x)','Polinomio interpolador','location','southwest')
% FALTA REPRESENTAR LOS NODOS 
% FALTA -> hold off 

polyval(p, 0.19375) % Se calcula el resultado requerido.
% NOTA -> -0,25 
disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
format, clc, clear

% Se usan los comandos de la función anterior.
% Se declara la función.
f=@(x) -exp(0.35555555555556.*x-1.7777777777778).*sin(3.3333333333333-0.66666666666667.*x)./(4.4444444444444-0.88888888888889.*x);
intervalo = [-1.4 0.725];
x = linspace(intervalo(1), intervalo(2), 7); % Se divide el intervalo en 7 elementos.
y = f(x);

% Se calcula el polinomio de Lagrange.
L = lagrange(x);
p = y * L;

% Obtener K
q=poly(x);
fplot(@(x) polyval(q,x), intervalo)
r = roots(polyder(q)); % se obtienen todas las raíces de la derivada de q (máximos/mínimos).
r = [ intervalo(1) ; r ; intervalo(2) ]; % se añaden los extremos del intervalo al vector columna de posibilidades.

K = max(abs(polyval(q,r))); % se evalúan todas las posibilidades y se escoge la máxima.

% Obtener M
syms x, f_sim(x) = f(x); % ¡OJO! REDEFINES LA VARIABLE -> x COMO SIMBÓLICA 
f7 = diff(f_sim,7);

% Representar
fplot(matlabFunction(f7), intervalo) % se visualiza la derivada.
legend('location', 'northwest') % LEYENDA INNECESARIA

c = fzero(matlabFunction(diff(f7)),1); % punto de derivada nula con una aproximación al máximo. 
%       MEJOR -> -1 EN LUGAR DE -> 1
M = double(abs(f7(c)));

% Cota del error
error = K*M / factorial(7);
disp(error)

disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, clc, format long
% El funcionamiento del ejercicio es el mismo que el del
% ejercicio 3, simplemente hay que cambiar 'x' para pasar a utilizar
% los nodos de Chebyshev en vez de puntos equiespaciados.

% Se declara la función.
f=@(x) 1./(x.^4 - 37.2.*x.^3 + 520.94.*x.^2 - 3254.628.*x + 7654.5001);
intervalo = [6.2 12.4]; % Se declara el intervalo.
a = intervalo(1);
b = intervalo(2);

% Se calculan los nodos de Chebyshev
n = 11; % 11 nodos de Chebyshev. (grado 10)
i = 1:n; x = (a+b)/2 + (b-a)/2*cos((2*i-1)*pi/(2*n));

% Se evalúa la función para todos los nodos de Chebyshev.
y = f(x);

% Se calcula el polinomio de Lagrange.
L = lagrange(x);
p = y * L;

% Representar
plot(x, y, '.', 'markersize', 20);
xx=linspace(a, b); plot(xx, f(xx), 'k')
hold on, yy = polyval(p,xx); plot(xx,yy,'b')
legend('f(x)','Polinomio interpolador','location','southwest')
% FALTA REPRESENTAR LOS NODOS 
% FALTA -> hold off

var = 7.75;
disp(abs(polyval(p, var) - f(var))) % Se calcula lo que pide el enunciado.
% NOTA -> -0,25 

disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%

% NOTA -> 10,0 - 0,25 - 0,25 