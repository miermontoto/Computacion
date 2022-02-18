function x=biseccion(f,a,b,E)
% Función x=biseccion(f,a,b,E)
% Método de Bisección para resolver f(x) = 0
% ARGUMENTOS DE ENTRADA:
% f ........ Función numérica de la que se buscan los ceros
% a,b ...... Extremos del intervalo de búsqueda de la solución
% E ........ Cota del error absoluto
% ARGUMENTO DE SALIDA:
% x ........ Valor aproximado de la raíz
fa=f(a); fb=f(b);
if fa*fb>0
    disp('MÉTODO NO APLICABLE:')
    disp('La función no cambia de signo en los extremos')
    x=[];
elseif fa==0
    disp('Solución exacta'), x=a;
elseif fb==0
    disp('Solución exacta'), x=b;
else
    N=ceil(log2(abs(b-a)/E)); % Nº de iteraciones para que |x-r| <= E
    N=max([N 1]); % El método de bisección se aplica, al menos, una vez
    for n=1:N
        x=(a+b)/2; fx=f(x);
        if fx==0
            disp('Solución exacta'), return
        elseif fa*fx<0
            b=x;
        else
            a=x;
        end
    end
end