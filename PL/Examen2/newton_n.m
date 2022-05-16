function [x,k]=newton_n(f,df,x0,T,N)
% Funci�n [x,k]=newton_n(f,df,x0,T,N)
% Resoluci�n del sistema f(x)=0, por el m�todo de Newton-Raphson
% ARGUMENTOS DE ENTRADA:
%   f    ...... Funci�n num�rica vectorial (DIMENSI�N n x 1)
%   df  ....... Funci�n diferencial de f, en forma num�rica vectorial
%   x0 ........ Estimaci�n inicial (DIMENSI�N n x 1)
%   T  ........ Tolerancia relativa permitida
%   N    ...... N�mero m�ximo de iteraciones
% ARGUMENTOS DE SALIDA:
%   x  ........ Soluci�n
%   k  ........ N�mero de iteraciones efectuadas
test_parada=0; k=0; % k es el contador de iteraciones
while test_parada==0 && k<N
    k=k+1;
    h=-df(x0)\f(x0);
    x=x0+h;
    test_parada=norm(h)<=T*norm(x0);
    x0=x;
end
if k==N
    disp('No converge con la precisi�n pedida.')
    disp('El valor hallado no es la soluci�n, sino la �ltima iteraci�n:')
end