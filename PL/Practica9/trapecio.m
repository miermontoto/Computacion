function r=trapecio(f,a,b)
% Funci�n r=trapecio(f,a,b) que aproxima la integral de la funcion
% num�rica f, en el intervalo [a,b], utilizando la regla del trapecio
r=(b-a)*(f(a)+f(b))/2;