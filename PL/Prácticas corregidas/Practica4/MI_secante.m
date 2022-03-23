function [x,n]=MI_secante(f,x0,x1,T,N)
%    Función [x,n]=secante(f,x0,x1,T,N)
%    Método de la Secante para resolver la ecuación f(x) = 0
% ARGUMENTOS DE ENTRADA:
%   f ..........  Función numérica
%   x0,x1 ......  Puntos iniciales del algoritmo
%   T ..........  Tolerancia relativa permitida
%   N ..........  Número máximo de iteraciones
% ARGUMENTOS DE SALIDA:
%   x ..........  Solución
%   n ..........  Número de iteraciones efectuadas
test_parada=0; n=0;
% n es el contador de iteraciones
x(1) = x0; x(2) = x1;
while test_parada==0 && n<N
    n=n+1; 
    x(n+2)=x(n+1)-f(x(n+1))*(x(n+1)-x(n))/(f(x(n+1))-f(x(n)));
    test_parada=abs(x(n+2)-x(n+1))<=T*abs(x(n+1));
end
if test_parada==0
    disp('No converge con la precisión pedida.')
    disp('El valor hallado no es la solución, sino la última iteración:')
end