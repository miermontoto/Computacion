f=@(n) n^5+n^3+n-3; % función anónima de prueba
a=0 ; b=3; % límites de intervalo establecidos
%fplot(f,[a b])

biseccion(f,a,b,10,1)