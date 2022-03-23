function [x,n]=Log(z,E)
% Función Log(z) que calcula el logaritmo neperiano de un número complejo
% mediante la fórmula de Carlson.
% z: Número complejo del que se quiere calcular el logaritmo neperiano.
% E: error relativo que funciona como criterio de parada.

err = intmax; % El error se establece al máximo para que siempre entre en el bucle.
x = (z - 1); % x comienza en (z - 1) para que realizar la multiplicación (z - 1) inicial.
n = 0; % Contador de iteraciones.
while(err > E) % Mientras no se cumpla la condición de parada del error relativo
    n = n + 1; % Se incrementa el contador.
    a = x; % Se guarda el valor de la iteración anterior para calcular el error.
    x = x * 2 / (1 + z.^(2^-n)); % Se calcula el nuevo valor.
    err = abs(a - x) / abs(a); % Error relativo entre esta iteración y la siguiente.
end

