% Zona para rellenar el nombre y los apellidos
% Por ejemplo:
% Nombre='Juan Luis González-Santander';
Nombre='Juan Francisco Mier Montoto';

disp(['Practica entregada por ',Nombre])
%% Ejercicio 1
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 1    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear
syms x, f(x) = x^3+6*x-3; % se define la función.
f1 = diff(f); % se define su derivada.
f_num = matlabFunction(f); f1_num = matlabFunction(f1); % se convierten a funciones numéricas.
newton(f_num, f1_num, 6, 1e-10, 100) % se obtiene la aproximación de la raíz.

disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear
y0 = 250; g = -9.8; m = 5.5; v0 = 15; k = 0.3; % se definen las constantes.
syms t, y(t) = y0 + m*g*t/k + (v0 - m*g/k)*m/k*(1 - exp(1)^(-k*t/m)); % se define la función.
fplot(y, [-10, 10]); grid; % observa dónde corta la función, se escoge la raíz positiva.
y1 = diff(y); % se define su derivada.
y_num = matlabFunction(y); y1_num = matlabFunction(y1); % se pasan ambas funciones a funciones numéricas.
x = newton2(y_num, y1_num, 10, 1e-12, 500); % se obtiene el vector del Método de Newton.
x(end) % se imprime por pantalla el último elemento del vector, es decir, la aprox. de la raíz.

disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear
c = 343; g = 9.8; t = 9.3; % se definen las constantes que se van a utilizar en la función.
syms h, f(h) = sqrt(2*h/g) + h/c - t; % se define la función.
fplot(f, [0, 400]); grid % se representa la función como especifica el enunciado.
f_num = matlabFunction(f); % se convierte a función numérica.
secante(f_num,325,350,1e-9,200) % se obtiene el resultado.

disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear
f=@(x) x.^3-9.1*x+1-3*cos(x); % se define la función anónima.
fplot(f); grid; % se representa para estimar sus raíces.
r1 = fzero(f, -5); r2 = fzero(f, 0); r3 = fzero(f, 3); % se calculan las raíces.
r1 + r2 + r3 % se obtiene el resultado que se pide.

disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear
syms x, f(x) = x^3 + 3.3*x - 3; % se declara la función.
f_num = matlabFunction(f); % se convierte a función numérica.
x = MI_secante(f_num, 3.3, 4.3, 1e-10, 100); % se calcula y se almacena el resultado.
x(8) % se imprime el valor pedido.



disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%
