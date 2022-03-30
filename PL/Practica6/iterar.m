function x=iterar(A, b, x0, T, N)
% Función que implementa el módulo iterativo del ejercicio 5.
% A: matriz cuadrada de orden n.
% b: vector de n componentes.
% x0: vector de n componentes.
% T: tolerancia del criterio de parada.
% N: número máximo de iteraciones.

x=[]; k=0; % k es el contador de iteraciones
[m,n]=size(A);
if m~=n, disp('ERROR: Matriz del sistema NO Cuadrada'), return, end
if m~=length(b) || m~=length(x0), disp('ERROR: Sistema NO Coherente'), return, end
if min(abs(diag(A)))==0
   disp('ERROR: Método no válido por existir elemento diagonal nulo')
   return
end

x_0=x0;
d=diag(diag(A));
invD = inv(d);
test_parada=0;
B = invD * (A - 3*eye(m));
c = invD * b;
while test_parada==0 && k<N
    k = k + 1;
    x = B*x_0 + c;
    test_parada=norm(x-x_0)<=T*norm(x_0);
    x_0 = x;
end
if test_parada==0
    disp('No converge con la precisión pedida.')
    disp('El valor hallado no es la solución, sino la última iteración:')
end