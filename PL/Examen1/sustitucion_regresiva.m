function x=sustitucion_regresiva(A,b)
% Función x=sustitucion_regresiva(A,b)
% Resolución de Ax=b, cuando A es triangular superior
x=[]; [m,n]=size(A);
if m~=n, disp('ERROR: Matriz del sistema NO Cuadrada'), return, end
if m~=length(b), disp('ERROR: Sistema NO Coherente'), return, end
if ~isequal(A,triu(A))
    disp('ERROR: Matriz NO Triangular Superior'), return
end
if min(abs(diag(A)))==0, disp('ERROR: Matriz NO Regular'), return, end
x=zeros(n,1); x(n)=b(n)/A(n,n);
for k=n-1:-1:1
    x(k)=(b(k)-A(k,k+1:n)*x(k+1:n))/A(k,k);
end