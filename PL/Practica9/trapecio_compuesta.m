function r=trapecio_compuesta(f,a,b,n)
% Función r=trapecio_compuesta(f,a,b,n) que aplica la regla del
% trapecio compuesta, para aproximar la integral de f en [a,b]
% ARGUMENTOS DE ENTRADA:
% f ........ Función numérica que debe operar elemento a elemento
% a,b ...... Extremos del intervalo de integración
% n ........ Número de subintervalos a utilizar
% ARGUMENTOS DE SALIDA:
% r ........ Aproximación de la integral
x=linspace(a,b,n+1); h=(b-a)/n;
r=(2*sum(f(x))-f(a)-f(b))*h/2;