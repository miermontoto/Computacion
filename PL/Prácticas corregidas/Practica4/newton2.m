function x=newton2(f,f_der,x0,T,N)
%     Funci�n x=newton2(f,f_der,x0,T,N)
% M�todo de Newton-Raphson para resolver f(x) = 0
% ARGUMENTOS DE ENTRADA:
%   f ..........  Funci�n num�rica
%   f_der ......  Funci�n derivada de f en formato num�rico
%   x0 .........  Punto inicial del algoritmo
%   T ..........  Tolerancia relativa permitida
%   N ..........  N�mero m�ximo de iteraciones
% ARGUMENTO DE SALIDA:
%   x  ......  Vector cuya �ltima coordenada es la soluci�n
%              y las dem�s, las iteraciones anteriores
test_parada=0; n=0; % n es el contador de iteraciones
x(1)=x0;
while test_parada==0 && n<N
    n=n+1; 
    x(n+1)=x(n)-f(x(n))/f_der(x(n));
    test_parada=abs(x(n+1)-x(n))<=T*abs(x(n));
end
x(1)=[]; % Eliminamos el punto x0 de la sucesi�n
if test_parada==0
    disp('No converge con la precisi�n pedida.')
end