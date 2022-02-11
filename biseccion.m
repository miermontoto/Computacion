function x=biseccion(f,a,b,i,T)
% Función que devuelve un vector con x_1, x_2, ..., x_n correspondientes a
% la iteración del método de bisección.
% f: función anonimizada a evauluar
% a: límite inferior cerrado
% b: límite superior cerrado
% i: número de iteraciones
% T: precisión de redondeo.

% 1. Base: x(n) ES la raíz o ya se ha sobrepasado el límite de iteraciones.
% 2. Recurrencia: f(x(i)) NO es la raíz

if f(a)*f(b)>=0, disp('La función introducida no tiene raíces en dicho intervalo.'), x=[];
elseif i~=round(i) || i<=0, disp('El limitador introducido no es natural'), x=[];
else, aidbsc(f,a,b,i,1,T)
end