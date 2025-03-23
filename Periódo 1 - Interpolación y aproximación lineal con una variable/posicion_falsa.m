fprintf('POSICION FALSA\n');
syms x;
f=input('Ingrese la funcion: ');
x0=input('Ingrese x0: ');
x1=input('Ingrese x1: ');
tol=input('Margen de error: 10^-');
tol=10^-tol;
f0=subs(f,x0);
f1=subs(f,x1);
if f0*f1<0
    x2=x1-((f1)*(x1-x0)/(f1-f0));
    error=abs(x2-x1);
    cont=1;
    fprintf('n || x0\t\t\t\t\t|| x1\t\t\t\t || x2\t\t\t\t || error\n');
    fprintf('%d || %.15f || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(x2), double(error));
    while error>tol && cont <100
        cont=cont+1;
        f2=subs(f,x2);
        if f0*f2<0
            x1=x2;
            x2=x1-double((f1)*(x1-x0)/(f1-f0));
            error=abs(x2-x1);
        else
            x0=x2;
            x2=x1-double((f1)*(x1-x0)/(f1-f0));
            error=abs(x2-x0);
        end
        fprintf('%d || %.15f || %.15f || %.15f || %e\n', cont, double(x0), double(x1), double(x2), double(error));
        f0=subs(f,x0);
        f1=subs(f,x1);
    end
    fprintf('La raiz es aproximadamente: %.15f\n',double(x2));
end