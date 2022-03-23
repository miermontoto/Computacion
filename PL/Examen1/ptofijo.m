function [x,n]=ptofijo(f,x0,T,N)
% Funci�n [x,n]=ptofijo(f,x0,T,N)
% M�todo de punto fijo para resolver f(x) = x
% ARGUMENTOS DE ENTRADA:
% f ....... Funci�n num�rica
% x0 ...... Punto de partida de las iteraciones
% T ....... Tolerancia relativa permitida
% N ....... N�mero m�ximo de Iteraciones
% ARGUMENTOS DE SALIDA:
% x ....... Soluci�n
% n ....... N�mero de iteraciones efectuadas
test_parada=0; n=0; % n es el contador de iteraciones
while test_parada==0 && n<N
    n=n+1;
    x=f(x0);
    test_parada=abs(x-x0)<=T*abs(x0);
    x0=x;
end
if test_parada==0
    disp('No converge con la precisi�n pedida.')
    disp('El valor hallado no es la soluci�n, sino la �ltima iteraci�n:')
end