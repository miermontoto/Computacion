function r=simpson(f,a,b)
% Función r=simpson(f,a,b) que aproxima la integral de la función
% numérica f, en el intervalo [a,b], utilizando la regla de Simpson
r=(b-a)*(f(a)+4*f((a+b)/2)+f(b))/6;