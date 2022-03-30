function [x,k]=newton_n(f,df,x0,T,N)
% Función [x,k]=newton_n(f,df,x0,T,N)
% Resolución del sistema f(x)=0, por el método de Newton-Raphson
% ARGUMENTOS DE ENTRADA:
%   f    ...... Función numérica vectorial (DIMENSIÓN n x 1)
%   df  ....... Función diferencial de f, en forma numérica vectorial
%   x0 ........ Estimación inicial (DIMENSIÓN n x 1)
%   T  ........ Tolerancia relativa permitida
%   N    ...... Número máximo de iteraciones
% ARGUMENTOS DE SALIDA:
%   x  ........ Solución
%   k  ........ Número de iteraciones efectuadas
test_parada=0; k=0; % k es el contador de iteraciones
while test_parada==0 && k<N
    k=k+1;
    h=-df(x0)\f(x0);
    x=x0+h;
    test_parada=norm(h)<=T*norm(x0);
    x0=x;
end
if k==N
    disp('No converge con la precisión pedida.')
    disp('El valor hallado no es la solución, sino la última iteración:')
end