function [x,n]=MaximaPendiente(f,Gf,x0,T,N)
% Funci�n [x,n]=MaximaPendiente(f,Gf,x0,T,N)
% M�todo de m�xima pendiente para minimizar f(x)
% ARGUMENTOS DE ENTRADA:
% f ..... Funci�n de una variable que define a f.
% Gf .... Funci�n de una variable que define a gradiente(f). Sus valores
% deben tener el formato de vector columna.
% x0 .... Vector columna con la aproximacion inicial
% T ..... Tolerancia relativa utilizada
% N ..... N�mero m�ximo de Iteraciones
% ARGUMENTOS DE SALIDA:
% x ...... Soluci�n
% n ...... N�mero de iteraciones empleadas
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
disp('No converge, con la precisi�n pedida, en las iteraciones fijadas.')
disp('El valor obtenido no es la soluci�n, sino la �ltima iteraci�n:')
end