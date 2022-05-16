function r=trapecio_compuesta(f,a,b,n)
% Funci�n r=trapecio_compuesta(f,a,b,n) que aplica la regla del
% trapecio compuesta, para aproximar la integral de f en [a,b]
% ARGUMENTOS DE ENTRADA:
% f ........ Funci�n num�rica que debe operar elemento a elemento
% a,b ...... Extremos del intervalo de integraci�n
% n ........ N�mero de subintervalos a utilizar
% ARGUMENTOS DE SALIDA:
% r ........ Aproximaci�n de la integral
x=linspace(a,b,n+1); h=(b-a)/n;
r=(2*sum(f(x))-f(a)-f(b))*h/2;