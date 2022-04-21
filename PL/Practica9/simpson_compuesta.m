function r=simpson_compuesta(f,a,b,n)
% Función r=simpson_compuesta(f,a,b,n) que aplica la regla de
% Simpson compuesta, para aproximar la integral de f en [a,b]
% ARGUMENTOS DE ENTRADA:
% f ........ Función numérica que debe operar elemento a elemento
% a,b ...... Extremos del intervalo de integración
% n ........ Número de subintervalos a utilizar
% ARGUMENTOS DE SALIDA:
% r ........ Aproximación de la integral
x=linspace(a,b,n+1); h=(b-a)/n; y=x+h/2; y(n+1)=[];
r=(2*sum(f(x))-f(a)-f(b)+4*sum(f(y)))*h/6;