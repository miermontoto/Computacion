function x=newton(f,a,b,i,T)
% Función x=newton(f,a,b,i,T) que devuelve el vector de x_n resultante de
% aplicar el método de Newton a una función.
% f: Función sobre la que aplicar el método.
% a: Límite inferior del intervalo.
% b: Límite superior del intervalo.
% i: número de iteraciones.
% T: dígitos de tolerancia (5*10^-T)

f1=diff(f);
if f(a)*f(b)>=0, disp('La función no tiene al menos una raíz en el intervalo introducido.'), exit
elseif i~=round(i) || i<=0, disp('El limitador debe de ser natural.'), exit
end


