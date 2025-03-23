fprintf('-------------biseccion----------------\n');
syms x
f=input('Introduzca la función: ');
a=input('Introduzca el valor de a: ');
b=input('Introduzca el valor de b: ');
tol=input('Introduzca el margen de error: 10^-');
tol=10^-tol;
fa=subs(f,a);
fb=subs(f,b);
%si hay cambio de signo se calcula el punto medio
if fa*fb<0
    c=(a+b)/2;
    fc=subs(f,c);
    cont=1;
    error=abs(fc);
    fprintf('n || a\t\t\t\t\t|| b\t\t\t\t || c\t\t\t\t || error\n');
    fprintf('%d || %.15f || %.15f || %.15f || %e\n', cont, double(a), double(b), double(c), double(error));
    while error>tol && cont<100
        cont=cont+1;
        if fa*fc<0 %si hay una raiz entre a y c
            b=c;
            c=(a+b)/2;
            error=abs(c-b);
        else
            a=c;
            c=(a+b)/2;
            error=abs(c-a);
        end
        fc=subs(f,c);
        fprintf('%d || %.15f || %.15f || %.15f || %e\n', cont, double(a), double(b),double(c), double(error)');
    end
    fprintf('\nEl valor aproximado de de x es: %.15f\n', double(c));
end