function x=gausspivoteo(A,b)
% Función x=gausspivoteo(A,b)
% Resolución de Ax=b, por el método de Gauss con pivoteo
x=[]; [m,n]=size(A);
if m~=n, disp('ERROR: Matriz del sistema NO Cuadrada'), return, end
if m~=length(b), disp('ERROR: Sistema NO Coherente'), return, end
for k=1:n
    [p,j]=max(abs(A(k:n,k))); j=j+k-1;
    if p==0
        disp('ERROR:Matriz de coeficientes singular'), return
    end
    if k~=j
        A([k j],:)=A([j k],:); b([k j])=b([j k]);
    end
    for i=k+1:n
        z=A(i,k);
        A(i,k:n)=A(i,k:n)- A(k,k:n)/A(k,k)*z;
        b(i)=b(i)- b(k)/A(k,k)*z;
    end
end
x=sustitucion_regresiva(A,b);