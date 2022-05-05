Nombre='Juan Francisco Mier Montoto';

disp(['Practica entregada por ',Nombre])
%% Ejercicio 1
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 1    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
% Se declaran los datos.
f=@(x) 91/10 .* sqrt(3.*pi+10.*x./91) .* sin(100.*x./455) - 100.*x./182;
% MEJOR -> f = @(x) 91/10*sqrt(3*pi + 10*x/91).*sin(100*x/455) - 100*x/182;
x = linspace(-18.2*pi,18.2*pi, 15) ; % Coordenadas x de los puntos.
y = f(x); % Coordenadas y de los puntos, se obtienen a partir de la función y de x.

% Se representa la función y la interpolación.
fplot(f, [x(1) x(end)], 'k') % Se representa la función en negrita.
hold on, plot(x,y,'r:') % Se representa la interpolación lineal en rojo con líneas punteadas.
% FALTA REPRESENTAR LOS PUNTOS 
hold off, legend('f(x)', 'Interpolación lineal', 'location', 'southwest') % Se inlcuye una leyenda.

% Calcular los errores de aproximar la función por interpolación respecto a la función en sí.
puntos = [-3.64*pi, 3.64*pi];
errs = abs(interp1(x, y, puntos) - f(puntos));
disp(sum(errs)) % Se muestra el valor requerido.

% NOTA -> -0,25 
disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
% Se declaran los datos.
x = [-34.4 -30.1 -17.2 -12.9 -8.6 -4.3 4.3 17.2 34.4]; % Coordenadas x de los puntos.
y = [ 12.9 15.91 16.77 18.06 24.51 28.38 30.53 28.81 19.35 ]; % Coordenadas y de los puntos.

s = @(t) spline(x, y, t); % Se declara la función anónima 's' correspondiente al spline.

% Se representa los puntos y la interpolación.
plot(x, y, '.', 'markersize', 40) % Se representan los puntos.
% LOS PUNTOS HAN DE SER DE COLOR VERDE 
hold on, fplot(s, [x(1) x(end)], 'r') % Se representa la interpolación por splines "mediante trazo continuo rojo".
hold off, legend('f(x)', 'Interpolación', 'location', 'northwest') % Se inlcuye una leyenda.
disp(s(6.45)) % Se muestra el valor requerido.
% NOTA -> -0,25 
disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
% Se declaran las variables.
x = [-6 -3 -1.2 1.5 9 12]; % Coordenadas x de los puntos.
y = [36.06 8.94 1.38 2.31 80.94 144.06] ; % Coordenadas y de los puntos.
k = 1; % Al tratarse de una recta, tiene grado 1.

% Recta que se ajusta mejor a esos datos con un grado 'k'.
r = polyfit(x,y,k);

% Se representa la recta obtenida frente a los datos.
plot(x, y, '.', 'markersize', 20) % Se representan los puntos.
hold on, fplot(@(n) polyval(r, n), [x(1) x(end)], 'g') % Se representa la recta ajustada en verde.
hold off, legend('Datos', 'Ajuste', 'location', 'south') % Se incluye una leyenda.

polyval(r, -4.5)
disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc
% Se declaran las variables.
t = linspace(1,4,7); % Instantes de tiempo.
h = [21.595 21.36375 18.28 13.14375 5.155 -4.88625 -17.78]; % Altura correspondiente a los instantes de tiempo.
hx = polyfit(t,h,2);

% Se representan los datos.
plot(t, h, '.', 'markersize', 20); % Se representan los puntos.
hold on, fplot(@(x) polyval(hx, x), [t(1) t(end)], 'y') % Se representa la aproximación en amarillo.
hold off, legend('Puntos', 'Ajuste', 'location', 'best')

% La altura inicial será la segunda posición del polinomio obtenido.
% La velocidad inicial será la tercera.
disp(hx(2) + hx(3))

disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear, format, clc

% Se declaran las variables.
r = [17.01 12.6 10.143 7.56 6.426];
t = [48 67 83 108 126];
t = deg2rad(t);
% FALTAN COMENTARIOS 
% Se transforman las variables.
R = 1./r;
T = cos(t);
p = polyfit(T, R, 1);
m = p(1); n = p(2);
a = 1/n; b = -m*a;
f = @(x) a./(1-b*cos(x));

disp(f(deg2rad(91)))
% NOTA -> -0,25 
disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%

% NOTA -> 10,0 -0,25 -0,25 -0,25 