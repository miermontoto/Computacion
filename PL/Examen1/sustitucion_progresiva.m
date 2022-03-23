function x=sustitucion_progresiva(A,b)
% Función x=sustitucion_progresiva(A,b)
% Resolución de Ax=b, cuando A es triangular inferior
x=[]; [m,n]=size(A);
if m~=n, disp('ERROR: Matriz del sistema NO Cuadrada'), return, end
if m~=length(b), disp('ERROR: Sistema NO Coherente'), return, end
if ~isequal(A,tril(A))
    disp('ERROR: Matriz NO Triangular Inferior'), return
end   
if min(abs(diag(A)))==0, disp('ERROR: Matriz NO Regular'), return, end
x=zeros(n,1); x(1)=b(1)/A(1,1);
for k=2:n
    x(k)=(b(k)-A(k,1:k-1)*x(1:k-1))/A(k,k);
end