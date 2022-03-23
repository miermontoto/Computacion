function m=media(u)
% Función m=media(u) que devuelve la media de los valores en el vector 'u'
% introducido.

m=0; % elemento neutro de la operación suma.
for i=u
    m=m+i;
end
m=m/length(u);