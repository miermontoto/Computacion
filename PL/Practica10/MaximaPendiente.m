function [x,n]=MaximaPendiente(f,Gf,x0,T,N)
% Función [x,n]=MaximaPendiente(f,Gf,x0,T,N)
% Método de máxima pendiente para minimizar f(x)
% ARGUMENTOS DE ENTRADA:
% f ..... Función de una variable que define a f.
% Gf .... Función de una variable que define a gradiente(f). Sus valores
% deben tener el formato de vector columna.
% x0 .... Vector columna con la aproximacion inicial
% T ..... Tolerancia relativa utilizada
% N ..... Número máximo de Iteraciones
% ARGUMENTOS DE SALIDA:
% x ...... Solución
% n ...... Número de iteraciones empleadas
test_parada=0; n=0; % n es el contador de iteraciones
while test_parada==0 && n < N
d=-Gf(x0);
g=@(L) f(x0+L*d);
L=fminbnd(g,0,1);
x=x0+L*d;
x0=x;
test_parada=norm(d) <= T;
n=n+1;
end
if n == N
disp('No converge, con la precisión pedida, en las iteraciones fijadas.')
disp('El valor obtenido no es la solución, sino la última iteración:')
end