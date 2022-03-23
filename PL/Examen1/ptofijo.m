function [x,n]=ptofijo(f,x0,T,N)
% Función [x,n]=ptofijo(f,x0,T,N)
% Método de punto fijo para resolver f(x) = x
% ARGUMENTOS DE ENTRADA:
% f ....... Función numérica
% x0 ...... Punto de partida de las iteraciones
% T ....... Tolerancia relativa permitida
% N ....... Número máximo de Iteraciones
% ARGUMENTOS DE SALIDA:
% x ....... Solución
% n ....... Número de iteraciones efectuadas
test_parada=0; n=0; % n es el contador de iteraciones
while test_parada==0 && n<N
    n=n+1;
    x=f(x0);
    test_parada=abs(x-x0)<=T*abs(x0);
    x0=x;
end
if test_parada==0
    disp('No converge con la precisión pedida.')
    disp('El valor hallado no es la solución, sino la última iteración:')
end