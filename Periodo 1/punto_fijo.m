fprintf('PUNTO FIJO\n');
syms x;
f=input('Ingrese g(x): ');
x0=input('Ingrese la estimacion inicial (x0): ');
tol=input('Margen de error: 10^-');
tol=10^-tol;
%se evalua el punto x0 em la funcion y es nuestro nuevo punto de estimacion
x1=subs(f,x0);
error=abs(x1-x0);
cont=1;
fprintf('n || x0\t\t\t\t\t|| x1\t\t\t\t || error\n');
fprintf('%d || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(error));
while error>tol && cont<100 %mientras el error sea mayor que la tol
    cont=cont+1;
    x0=x1; %se busca una nueva estimacion cambiando x1 a x0
    x1=double(subs(f,x0)); %y encontrando el nuevo punto evaluando la funcion otra vez
    error=double(abs(x1-x0));
    fprintf('%d || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(error));
end
fprintf('La raiz es aproximadamente: %.15f\n',double(x1));