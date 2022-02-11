function [S,n]=serie(a,T,N)
% Función [S,n]=serie(a,T,N) para hallar
% el valor aproximado de la suma de la serie en caso
% de que dicha serie converga con la precisión pedida.

n=1; S1=a(1);
test_parada=0;
while test_parada==0 && n<N
    n=n+1;
    S=S1+a(n);
    test_parada=abs(S-S1)<=T*abs(S1);
    S1=S;
end
if test_parada == 0
    disp('No converge con la precisión pedida.')
    disp('El resultado no es la solución, sino la última suma hallada.')
end

% Se prueba el resultado con a=@(n) 1/n²
% En caso de tener una función _function y=z(n) ; y=1/n^2_, se debería
% utilizar serie(@z,T,N).