function x=newton2(f,f_der,x0,T,N)
%     Función x=newton2(f,f_der,x0,T,N)
% Método de Newton-Raphson para resolver f(x) = 0
% ARGUMENTOS DE ENTRADA:
%   f ..........  Función numérica
%   f_der ......  Función derivada de f en formato numérico
%   x0 .........  Punto inicial del algoritmo
%   T ..........  Tolerancia relativa permitida
%   N ..........  Número máximo de iteraciones
% ARGUMENTO DE SALIDA:
%   x  ......  Vector cuya última coordenada es la solución
%              y las demás, las iteraciones anteriores
test_parada=0; n=0; % n es el contador de iteraciones
x(1)=x0;
while test_parada==0 && n<N
    n=n+1; 
    x(n+1)=x(n)-f(x(n))/f_der(x(n));
    test_parada=abs(x(n+1)-x(n))<=T*abs(x(n));
end
x(1)=[]; % Eliminamos el punto x0 de la sucesión
if test_parada==0
    disp('No converge con la precisión pedida.')
end