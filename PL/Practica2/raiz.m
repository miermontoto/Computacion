function r=raiz(n,a)
% Función r=raiz(n,a) que devuelve la raíz n-ésima de a.
% Solo acepta valores de n que sean naturales y valores de a que sean
% reales positivos.

if n==round(n) && n>0 && a>=0 % comprueba la validez de los parámetros.
    r=nthroot(a,n); % calcula la raíz n-ésima de a
else
    disp('n debe de ser un valor natural, a debe de ser un valor real positivo.')
    r=[]; % si no es válido, devuelve un vector vacío.
end