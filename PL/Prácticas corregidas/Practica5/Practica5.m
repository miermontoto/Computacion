% Zona para rellenar el nombre y los apellidos
% Por ejemplo:
% Nombre='Juan Luis González-Santander';
Nombre='Juan Francisco Mier Montoto';

disp(['Practica entregada por ',Nombre])
%% Ejercicio 1
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 1    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 1
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"
clear
A = [1e-17 13.5 ; 1 19.75]; b = [13.5 ; 28.05]; % se declaran las variables
xe = gausspivoteo(A, b); % se caulcula la solución por Gauss con pivoteo.
xs = gauss(A, b); % se calcula la solución por Gauss normal.
errPorcentual = norm(xe - xs) / norm(xe) * 100 % se calcula el error relativo y se multiplica por 100. % FALTA -> ;
% FALTA -> disp(errPorcentual)
disp('%%%%%%%%%%%      Fin del Ejercicio 1      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 2
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 2    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 2
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"
clear
A = [ 14 27 38 ; 7 40.5 216 ; 4.6666666666667 22.5 153.16666666667];
b = [ 207 ; 273.5 ; 196 ]; % se declaran las variables.
[L,U,P] = lu(A); % se obtienen L, U y P de A.
b1 = P * b; % se calcula b1 (Pb)

% se calculan x e y a partir de b1 y las matrices triangulares de A.
y = sustitucion_progresiva(L, b1); % puesto que es triangular inferior, se calcula con sust. prog.
x = sustitucion_regresiva(U, y); % puesto que es triangular superior, se calcula con sust. regr.

U(1,2)+y(3)+x(1)+x(2)+x(3) % resultado que se pide. % MEJOR -> disp(U(1,2) + y(3) + sum(x))

disp('%%%%%%%%%%%      Fin del Ejercicio 2      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 3
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 3    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 3
% Para ejecuar este ejercicio, pon el cursor aquí y pincha en "Run Section"
clear
A = [ 1 -27.2 1 ; -27.2 924.8 157.76 ; 1 157.76 189.96 ]; % se declaran variables.
b = [ -369.92 ; 10061.824 ; -424.32 ];

% ¿A es simétrica?
isequal(A, A.') % 1 => sí % MEJOR -> if isequal(A,A.'), disp('A es simétrica'), end

% ¿A es definida positiva?
for i=1:3, D(i)=det(A(1:i,1:i)); end, min(D) > 0 % 1 => sí
                % MEJOR -> if min(D) > 0, disp('A es definida positiva'), end
% Puesto que A es simétrica y definida postiva, se puede aplicar la Fact.
% de Cholesky

U = chol(A); % matriz de Cholesky de A
% se calcula de la misma manera que en el ejercicio anterior
y = sustitucion_progresiva(U.', b); 
x = sustitucion_regresiva(U, y);

% el menor principal de orden dos será el segundo elemento del vector D.
U(1,2)+y(3)+x(1)+x(2)+x(3)+D(2) % se calcula el resultado. 
% MEJOR -> disp(U(1,2) + y(3) + sum(x) + D(2))

disp('%%%%%%%%%%%      Fin del Ejercicio 3      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 4
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 4    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 4
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"
clear

A = [ 16.6 16.6 -1 ; -12.6 -13.6 0 ; 11.6 12.6 -1 ];
b = [ -290.16 ; 227.76 ; -212.16 ]; % se declaran las variables.

x = A\b; % se calcula mediante el comando '\'
sum(x) % se calcula la suma de los elementos del vector resultado.

disp('%%%%%%%%%%%      Fin del Ejercicio 4      %%%%%%%%%%%%%')
%%
pause

%% Ejercicio 5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('%%%%%%%%%%    Solución del Ejercicio 5    %%%%%%%%%%%%%')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% Introduce a partir de aquí la solución del Ejercicio 5
% Para ejecutar este ejercicio, pon el cursor aquí y pincha en "Run Section"
clear

A = [ 1e-17 6.8 ; 1 9.7 ]; b = [ 6.8 ; 13.98 ]; % se declaran las variables
error_gauss(A, b) % se obtiene el resultado mediante error_gauss.m

disp('%%%%%%%%%%%      Fin del Ejercicio 5      %%%%%%%%%%%%%')
%%
