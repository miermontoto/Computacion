% Zona para rellenar el nombre y los apellidos
% Por ejemplo:
% Nombre='Juan Luis Gonz�lez-Santander';
Nombre='Juan Francisco Mier Montoto';

disp(['Practica entregada por ',Nombre])
%% Ejercicio 1
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 1    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear
syms x, f(x) = x^3+6*x-3; % se define la funci�n.
f1 = diff(f); % se define su derivada.
f_num = matlabFunction(f); f1_num = matlabFunction(f1); % se convierten a funciones num�ricas.
newton(f_num, f1_num, 6, 1e-10, 100) % se obtiene la aproximaci�n de la ra�z.

disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear
y0 = 250; g = -9.8; m = 5.5; v0 = 15; k = 0.3; % se definen las constantes.
syms t, y(t) = y0 + m*g*t/k + (v0 - m*g/k)*m/k*(1 - exp(1)^(-k*t/m)); % se define la funci�n. % MEJOR -> exp(-k*t/m)
% Se escoge el punto de corte correcto.
t_corte = solve(y(t) == 0, t);

fplot(y, [-10, 10]); grid; % observa d�nde corta la funci�n, se escoge la ra�z positiva.
y1 = diff(y); % se define su derivada.
y_num = matlabFunction(y); y1_num = matlabFunction(y1); % se pasan ambas funciones a funciones num�ricas.
x = newton2(y_num, y1_num, 10, 1e-12, 500); % se obtiene el vector del M�todo de Newton.
x(end) % se imprime por pantalla el �ltimo elemento del vector, es decir, la aprox. de la ra�z.

% NOTA -> -0,5 
disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear
c = 343; g = 9.8; t = 9.3; % se definen las constantes que se van a utilizar en la funci�n.
syms h, f(h) = sqrt(2*h/g) + h/c - t; % se define la funci�n.
fplot(f, [0, 400]); grid % se representa la funci�n como especifica el enunciado.
f_num = matlabFunction(f); % se convierte a funci�n num�rica.
secante(f_num,325,350,1e-9,200) % se obtiene el resultado.


disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear
f=@(x) x.^3-9.1*x+1-3*cos(x); % se define la funci�n an�nima.
fplot(f); grid; % se representa para estimar sus ra�ces.
r1 = fzero(f, -5); r2 = fzero(f, 0); r3 = fzero(f, 3); % se calculan las ra�ces.
r1 + r2 + r3 % se obtiene el resultado que se pide. 
% MEJOR -> disp(r1 + r2 + r3)

disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Soluci�n del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
clear
syms x, f(x) = x^3 + 3.3*x - 3; % se declara la funci�n.
f_num = matlabFunction(f); % se convierte a funci�n num�rica.
x = MI_secante(f_num, 3.3, 4.3, 1e-10, 100); % se calcula y se almacena el resultado.
x(8) % se imprime el valor pedido.



disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%

% NOTA -> 10 - 0,5 