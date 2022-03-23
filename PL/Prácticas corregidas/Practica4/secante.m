function [x,n]=secante(f,x0,x1,T,N)
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
y0=f(x0); y1=f(x1); test_parada=0; n=0;
% n es el contador de iteraciones
while test_parada==0 && n<N
    n=n+1; 
    x=x1-y1*(x1-x0)/(y1-y0);
    test_parada=abs(x-x1)<=T*abs(x1);
    x0=x1; y0=y1; x1=x; y1=f(x1);
end
if test_parada==0
    disp('No converge con la precisión pedida.')
    disp('El valor hallado no es la solución, sino la última iteración:')
end