function x=biseccion(f,a,b,E)
% Funci�n x=biseccion(f,a,b,E)
% M�todo de Bisecci�n para resolver f(x) = 0
% ARGUMENTOS DE ENTRADA:
% f ........ Funci�n num�rica de la que se buscan los ceros
% a,b ...... Extremos del intervalo de b�squeda de la soluci�n
% E ........ Cota del error absoluto
% ARGUMENTO DE SALIDA:
% x ........ Valor aproximado de la ra�z
fa=f(a); fb=f(b);
if fa*fb>0
    disp('M�TODO NO APLICABLE:')
    disp('La funci�n no cambia de signo en los extremos')
    x=[];
elseif fa==0
    disp('Soluci�n exacta'), x=a;
elseif fb==0
    disp('Soluci�n exacta'), x=b;
else
    N=ceil(log2(abs(b-a)/E)); % N� de iteraciones para que |x-r| <= E
    N=max([N 1]); % El m�todo de bisecci�n se aplica, al menos, una vez
    for n=1:N
        x=(a+b)/2; fx=f(x);
        if fx==0
            disp('Soluci�n exacta'), return
        elseif fa*fx<0
            b=x;
        else
            a=x;
        end
    end
end