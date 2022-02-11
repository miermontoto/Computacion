function x=aidbsc(f,a,b,i,n,T)
global x % <- cállate matlab
x(n)=(a+b)/2;
if abs(f(x(n)))<=5*10^-T || n>=i, return
elseif f(x(n))<0, aidbsc(f,x(n),b,i,n+1,T);
else, aidbsc(f,a,x(n),i,n+1,T);
end