function x=whileloop()
% Función x=whileloop() que calcula el menor entero k de forma que 
% 2^−31+2^−(k+1)=2^-31 utilizando un bucle while.

x = 0;
while ~(2^-31+2^-(x+1)==2^-31)
    x=x+1;
end