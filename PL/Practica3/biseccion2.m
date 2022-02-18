function x=biseccion2(f,a,b,E)
% Funcion x=biseccion2(f,a,b,E) que devuelve un vector con todos los
% valores generados por el método de bisección aplicado a la función f en
% el intervalo [a,b].

fa=f(a); fb=f(b);
if fa*fb>0
    disp('MÉTODO NO APLICABLE:')
    disp('La función no cambia de signo en los extremos')
    x=[];
elseif fa==0
    disp('Solución exacta'), x=[a];
elseif fb==0
    disp('Solución exacta'), x=[b];
else
    x=[]
    N=ceil(log2(abs(b-a)/E)); % Nº de iteraciones para que |x-r| <= E
    N=max([N 1]); % El método de bisección se aplica, al menos, una vez
    for n=1:N
        x(n)=(a+b)/2; fx=f(x(n));
        if fx==0
            disp('Solución exacta'), return
        elseif fa*fx<0
            b=x(n);
        else
            a=x(n);
        end
    end
end