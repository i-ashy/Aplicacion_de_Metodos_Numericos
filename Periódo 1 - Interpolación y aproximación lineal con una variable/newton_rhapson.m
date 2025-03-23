fprintf('-------------newton-rhapson----------------\n');
syms x
f=input('Introduzca la función: ');
x0=input('Introduzca el punto inicial: ');
tol=input('Introduzca el margen de error: 10^-');
tol=10^-tol;
%se deriva la funcion
df=diff(f);
%se evalua el punto dado en f y en la derivada
fa=subs(f,x0);
fb=subs(df,x0);
%formula de valor aproximado
x1=x0-(fa/fb);
%error
error = abs(x1-x0);
cont=1;
%impresion
fprintf('n || x0\t\t\t\t\t|| x1\t\t\t\t || error\n')
fprintf('%d || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(error))
while error>tol && cont<100
    cont=cont+1;
    %reasignamos
    x0=x1;
    fa=subs(f,x0);
    fb=subs(df,x0);
    x1=x0-(fa/fb);
    error=abs(x1-x0);
    fprintf('%d || %.15f || %.15f || %e\n', cont, double(x0), double(x1),double(error)');
end

fprintf('\nEl valor aproximado de de x es: %.15f\n', double(x1));