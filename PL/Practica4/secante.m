function [x,n]=secante(f,x0,x1,T,N)
%    Funci�n [x,n]=secante(f,x0,x1,T,N)
%    M�todo de la Secante para resolver la ecuaci�n f(x) = 0
% ARGUMENTOS DE ENTRADA:
%   f ..........  Funci�n num�rica
%   x0,x1 ......  Puntos iniciales del algoritmo
%   T ..........  Tolerancia relativa permitida
%   N ..........  N�mero m�ximo de iteraciones
% ARGUMENTOS DE SALIDA:
%   x ..........  Soluci�n
%   n ..........  N�mero de iteraciones efectuadas
y0=f(x0); y1=f(x1); test_parada=0; n=0;
% n es el contador de iteraciones
while test_parada==0 && n<N
    n=n+1; 
    x=x1-y1*(x1-x0)/(y1-y0);
    test_parada=abs(x-x1)<=T*abs(x1);
    x0=x1; y0=y1; x1=x; y1=f(x1);
end
if test_parada==0
    disp('No converge con la precisi�n pedida.')
    disp('El valor hallado no es la soluci�n, sino la �ltima iteraci�n:')
end