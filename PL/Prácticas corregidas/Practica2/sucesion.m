function x=sucesion(n)
% Función x=sucesion(n) que calcula un vector con los n primeros valores de
% la sucesión xn=1.5xn−1−0.5xn−2 :  x1=642.65, x2=367.975.

a=@(b,c) 1.5*b(c-1)-0.5*b(c-2); % define la sucesión como func. anon.
x=[642.65,367.975]; % preestablece los dos primeros valores del vector.
if n==round(n) && n>2 % si n es natural y mayor que dos
    for k=(3:1:n) % desde 3 hasta el valor especificado
        x(k)=a(x,k); % calcula el valor k de la sucesión y lo guarda
    end
elseif n==1
    x=[642.65]; % si se introduce n=1, devuelve solo el x con x_1
elseif n==2
    x=[642.65,367.975]; % si se introduce n=2, devuelve x con x_1 y x_2
else
    disp('n tiene que ser un número natural.')
    x=[]; % si n no es un valor válido, devuelve un vector vacío.
end
