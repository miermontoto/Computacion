function I = intGauss5(f, a, b)
% Función I=intGauss5
% f: Función anónima
% a,b: Extremos del intervalo.
% I: Forma de cuadratura gaussiana con 5 nodos aplicado a la función.
format long % INNECESARIO 
syms x, L5_sim(x) = diff((x^2 - 1)^5, 5) / (2^5) / factorial(5); % Fórmula de Rodrigues.
L5 = sym2poly(L5_sim);
xx = roots(L5); % Puntos a interpolar.
g = @(x) f((a+b)/2 + (b-a)/2*x);
I = (b - a)/2 * double(int(poly2sym(polyfit(xx, g(xx), 4)), -1, 1));
