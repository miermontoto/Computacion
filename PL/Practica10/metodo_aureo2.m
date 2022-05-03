function [x,fx] = metodo_aureo2(g,a,b,E)
% Función x = metodo_aureo(f,a,b,E)
% Método de la sección de oro para hallar el único mínimo de una función f 
% que se encuentra en el intervalo [a,b]
% ARGUMENTOS DE ENTRADA:
%   g .....  Función numérica de la que se busca el mínimo.
%   a,b ...  Extremos del intervalo de búsqueda de la solución
%   E .....  Cota del error absoluto: |x-xmax| <= E, siendo xmax el máximo
%   exacto
% ARGUMENTO DE SALIDA:
%   x ......  Valor aproximado donde se encuentra el máximo
%   fx .....  Valor aproximado del máximo -> f(x)
f = @(x) -g(x);
% Inicialización del bucle
phi = (sqrt(5) - 1)/2; % razón aúrea -> phi = 0.618033988749895
N = ceil(log(2*E/(b - a))/(log(phi))); % número de iteraciones del método
N = max([N,1]); % el método se aplica al menos una vez
% Cálculo de los puntos intermedios del intervalo
delta = (b - a)*phi;
x1 = b - delta;
x2 = a + delta;
% Valor de la función en los puntos intermedios
fx1 = f(x1);
fx2 = f(x2);
% Bucle 
for i = 1:N
    if fx1 > fx2
        % Descartamos el subintervalo derecho
        b = x2; 
        x2 = x1;
        fx2 = fx1;
        delta = (b - a)*phi;
        x1 = b - delta;
        fx1 = f(x1);
    else
        % Descartamos el subintervalo izquierdo
        a = x1; 
        x1 = x2;
        fx1 = fx2;
        delta = (b - a)*phi;
        x2 = a + delta;
        fx2 = f(x2);
    end
end
x = (a + b)/2; % tomamos el valor intermedio del intervalo final
fx = g(x); 
