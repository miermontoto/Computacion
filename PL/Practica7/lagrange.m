function L=lagrange(x)
% Función L=lagrange(x) que calcula los polinomios de lagrange
% correspondientes a los nodos del vector x
% ARGUMENTO DE ENTRADA:
% x ...... Vector que contiene los nodos
% ARGUMENTO DE SALIDA:
% L ...... Matriz cuya fila j contiene el polinomio de Lagrange l_j(x)
m=length(x); L=zeros(m);
for j=1:m
    r=x([1:j-1 j+1:m]); l=poly(r)/prod(x(j)-r);
    L(j,:)=l;
end
