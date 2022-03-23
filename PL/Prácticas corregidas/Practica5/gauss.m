function x=gauss(A,b)
% Funci�n x=gauss(A,b)
% Resoluci�n de Ax=b, por el m�todo de Gauss
x=[]; [m,n]=size(A);
if m~=n, disp('ERROR: Matriz del sistema NO Cuadrada'),return, end
if m~=length(b), disp('ERROR: Sistema NO Coherente'), return, end
for k=1:n
    if A(k,k)==0
        j=find(A(k+1:n,k),1);
        if isempty(j)
            disp('ERROR:Matriz de coeficientes singular'), return
        end
        j=j+k; A([k j],:)=A([j k],:); b([k j])=b([j k]);
    end
    for i=k+1:n
        z=A(i,k);
        A(i,k:n)=A(i,k:n)-A(k,k:n)/A(k,k)*z;
        b(i)=b(i)-b(k)/A(k,k)*z;
    end
end
x=sustitucion_regresiva(A,b);