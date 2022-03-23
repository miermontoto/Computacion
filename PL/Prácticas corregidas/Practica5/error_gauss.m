function err=error_gauss(A, b)
% Función que calcula el error porcentual cometido al resolver el sistema
% Ax=b mediante Gauss frente a resolverlo mediante el comando '\'.
% A : Matriz A del sistema.
% b : Vector vertical de soluciones b del sistema.

xe = A\b; % se caulcula la solución "real".
xs = gauss(A, b); % se calcula la solución por Gauss normal.
err = norm(xe - xs) / norm(xe) * 100; % se calcula el error relativo y se multiplica por 100.
