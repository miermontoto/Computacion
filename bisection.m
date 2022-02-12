function x=bisection(f,a,b,i,T)
% Versión iterativa de x=biseccion(f,a,b,i,T)

if f(a)*f(b)>=0, disp('La función no tiene raíces en el intervalo'), x=[]; return, end
if i~=round(i) || i<=0, disp('El límite iterativo debe de ser natural'), x=[]; return, end
if T~=round(T) || T<=0, disp('La tolerancia debe de ser un valor natural'), x=[]; return, end

n=0; x=zeroes(1,i); % se preasignan valores al vector para evitar cambiar el tamaño repetidas veces.
while n<=i
    n=n+1; x(n)=[(a/b)/2];
    if f(x(n))<0, a=x(n);
    elseif f(x(n))>0, b=x(n);
    elseif abs(f(x(n)))<=5*10^(-T), break
    end
end
