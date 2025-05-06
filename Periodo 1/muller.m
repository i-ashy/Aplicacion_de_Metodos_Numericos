fprintf('MULLER\n');
syms x;
f=input('Ingrese la función: ');
x0=input('Ingrese x0: ');
x1=input('Ingrese x1: ');
x2=input('Ingrese x2: ');
tol=input('Ingrese el valor de tolerancia: 10^-');
tol=10^-tol;
%evaluamos
f0=subs(f,x0);
f1=subs(f,x1);
f2=subs(f,x2);
%sustituimos en formulas
a=(((f0-f2)*(x1-x2))-((f1-f2)*(x0-x2)))/((x0-x2)*(x1-x2)*(x0-x1));
b=(((f1-f2)*(x0-x2)^2)-((f0-f2)*(x1-x2)^2))/((x0-x2)*(x1-x2)*(x0-x1));
c=f2;
%nuevo valor de aprox
if b<0
    x3=x2-2*c/(b-sqrt(b^2-(4*a*c)));
    error=abs(x3-x2);
    cont=1;
else
    x3=x2-2*c/(b+sqrt(b^2-(4*a*c)));
    error=abs(x3-x2);
    cont=1;
end
fprintf('n || x0\t\t\t\t\t || x1\t\t\t\t\t || x2\t\t\t\t\t || x3\t\t\t\t\t || e\n');
fprintf('%d || %.15f || %.15f || %.15f || %.15f || %e\n',cont,double(x0),double(x1),double(x2),double(x3),double(error));
while error>tol && cont<100
    cont=cont+1;
    x0=x1;
    x1=x2;
    x2=x3;
    %evaluamos
    f0=double(subs(f,x0));
    f1=double(subs(f,x1));
    f2=double(subs(f,x2));
    %sustituimos en formulas
    a=double((((f0-f2)*(x1-x2))-((f1-f2)*(x0-x2)))/((x0-x2)*(x1-x2)*(x0-x1)));
    b=double((((f1-f2)*(x0-x2)^2)-((f0-f2)*(x1-x2)^2))/((x0-x2)*(x1-x2)*(x0-x1)));
    c=f2;
    if b<0
        x3=x2-2*c/(b-sqrt(b^2-(4*a*c)));
        error=abs(x3-x2);
    else
        x3=x2-2*c/(b+sqrt(b^2-(4*a*c)));
        error=abs(x3-x2);
    end
    fprintf('%d || %.15f || %.15f || %.15f || %.15f || %e\n',cont,double(x0),double(x1),double(x2),double(x3),double(error));
end
fprintf('La solución es: %.15f\n',double(x3));