fprintf('STEFFENSEN\n');
syms x;
g=input('Ingrese g(x): ');
x0=input('Ingrese la estimacion inicial (x0): ');
tol=input('Margen de error: 10^-');
tol=10^-tol;
x1=subs(g,x0);
x2=subs(g,x1);
x3=x0-((x1-x0)^2/(x2-2*x1+x0));
error=abs(x3-x0);
cont=1;
fprintf('n || x0\t\t\t\t\t|| x1\t\t\t\t || x2\t\t\t\t || x3\t\t\t\t || error\n');
fprintf('%d || %.15f || %.15f || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(x2), double(x3), double(error));
while error>tol && cont<100
    cont=cont+1;
    x0=x3;
    x1=subs(g,x0);
    x2=subs(g,x1);
    x3=x0-double((x1-x0)^2/(x2-2*x1+x0));
    error=abs(x3-x0);
    fprintf('%d || %.15f || %.15f || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(x2), double(x3), double(error));
end
fprintf('La raiz es aproximadamente: %.15f\n',double(x3));