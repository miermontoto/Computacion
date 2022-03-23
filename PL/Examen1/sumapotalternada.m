function x=sumapotalternada(n,p)
% Función sumapotalternada(n,p) devuelve la suma alternada de las potencias
% p-ésimas de los números naturales desde 1 hasta n.
% n: Límite del intervalo [1, n] en el que se calcula la suma. Número
% natural.
% p: Exponente de cada componente de la suma. Número natural.

if(n~=round(n) || p~=round(p) || n < 1 || p < 1)
    disp("Los dos argumentos de entrada deben de ser naturales")
end

x = 0; % elemento neutro de la operación suma.
i = 0; % índice de iteración
b = 0; % Valor que hace alternar entre suma y resta.
while(i < n)
    i = i + 1; % Se suma uno al contador de iteración.
    if(b == 0) % Si b es 0, se suma el siguiente elemento.
        b = 1;
        x = x + i^p;
    else % De lo contrario, se resta.
        b = 0;
        x = x - i^p;
    end
end
