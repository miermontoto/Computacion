function [x,n]=newton(f,f_der,x0,T,N)
%     Funci�n [x,n]=newton(f,f_der,x0,T,N)
% M�todo de Newton-Raphson para resolver f(x) = 0
% ARGUMENTOS DE ENTRADA:
%   f ..........  Funci�n num�rica
%   f_der ......  Funci�n derivada de f en formato num�rico
%   x0 .........  Punto inicial del algoritmo
%   T ..........  Tolerancia relativa permitida
%   N ..........  N�mero m�ximo de iteraciones
% ARGUMENTOS DE SALIDA:
%   x ..........  Soluci�n
%   n ..........  N�mero de iteraciones efectuadas
test_parada=0; n=0; % n es el contador de iteraciones
while test_parada==0 && n<N
    n=n+1; 
    x=x0-f(x0)/f_der(x0);
    test_parada=abs(x-x0)<=T*abs(x0);
    x0=x;
end
if test_parada==0
    disp('No converge con la precisi�n pedida.')
    disp('El valor hallado no es la soluci�n, sino la �ltima iteraci�n:')
end