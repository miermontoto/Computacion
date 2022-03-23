function [x,n]=newton(f,f_der,x0,T,N)
%     Función [x,n]=newton(f,f_der,x0,T,N)
% Método de Newton-Raphson para resolver f(x) = 0
% ARGUMENTOS DE ENTRADA:
%   f ..........  Función numérica
%   f_der ......  Función derivada de f en formato numérico
%   x0 .........  Punto inicial del algoritmo
%   T ..........  Tolerancia relativa permitida
%   N ..........  Número máximo de iteraciones
% ARGUMENTOS DE SALIDA:
%   x ..........  Solución
%   n ..........  Número de iteraciones efectuadas
test_parada=0; n=0; % n es el contador de iteraciones
while test_parada==0 && n<N
    n=n+1; 
    x=x0-f(x0)/f_der(x0);
    test_parada=abs(x-x0)<=T*abs(x0);
    x0=x;
end
if test_parada==0
    disp('No converge con la precisión pedida.')
    disp('El valor hallado no es la solución, sino la última iteración:')
end