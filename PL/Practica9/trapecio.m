function r=trapecio(f,a,b)
% Función r=trapecio(f,a,b) que aproxima la integral de la funcion
% numérica f, en el intervalo [a,b], utilizando la regla del trapecio
r=(b-a)*(f(a)+f(b))/2;