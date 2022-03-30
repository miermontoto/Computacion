function [x,k]=jacobi(A,b,T,N)
% Funci�n [x,k]=jacobi(A,b,T,N)
% Resoluci�n de Ax=b, por el m�todo de Jacobi
% ARGUMENTOS DE ENTRADA:
%   A    ...... Matriz cuadrada
%   b    ...... Vector columna
%   T  ........ Tolerancia relativa permitida
%   N    ...... N�mero m�ximo de iteraciones
% ARGUMENTOS DE SALIDA:
%   x .......  Soluci�n
%   k .......  N�mero de iteraciones efectuadas
x=[]; k=0; % k es el contador de iteraciones
[m,n]=size(A);
if m~=n, disp('ERROR: Matriz del sistema NO Cuadrada'), return, end
if m~=length(b), disp('ERROR: Sistema NO Coherente'), return, end
if min(abs(diag(A)))==0
   disp('ERROR: M�todo no v�lido por existir elemento diagonal nulo')
   return
end
x0=zeros(n,1);
d=diag(A);
test_parada=0;
while test_parada==0 && k<N
    k=k+1;
    x=x0+(b-A*x0)./d;
    test_parada=norm(x-x0)<=T*norm(x0);
    x0=x;
end
if test_parada==0
    disp('No converge con la precisi�n pedida.')
    disp('El valor hallado no es la soluci�n, sino la �ltima iteraci�n:')
end