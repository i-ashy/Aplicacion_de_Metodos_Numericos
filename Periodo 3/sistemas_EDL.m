syms t x y
disp('Sistema de ecuaciones lineales')
f=input('Ingrese la ecuación diferencial dx/dt: ');
g=input('Ingrese la ecuación diferencial dy/dt: ');
intervalo=input('Ingrese el intervalo [a,b]: ');
x0=input('Ingrese el valor inicial x0: ');
y0=input('Ingrese el valor inicial y0: ');
F=input('Ingrese la solucion de la ecuacion diferencial: ');
h=input('Ingrese el valor de h: ');
a=intervalo(1);
b=intervalo(2);
T=[a:h:b];
n=length(T)-1;
Y(1)=y0;
X(1)=x0;
fprintf('ti\t\t\t\t\t || k11\t\t\t || k12\t\t\t || k21\t\t\t || k22\t\t\t || k31\t\t\t || k32\t\t\t || k41\t\t\t || k42\t\t\t || Xi\t\t\t\t\t || Yi\t\t\t\t\t || F(ti)\t\t\t\t\t || error\n');
fprintf('%.15f\t || %.9f\t || %.9f\t || %.9f\t || %.9f\t || %.9f\t || %.9f\t || %.9f\t || %.9f\t || %.15f\t || %.15f\t || %.15f\t || %e\n',...
    T(1), 0, 0, 0, 0, 0, 0, 0, 0, double(X(1)), double(Y(1)), double(Y(1)), 0);

for i=1:n
    k11=subs(f,{t,x,y},{T(i),X(i),Y(i)});
    k12=subs(g,{t,x,y},{T(i),X(i),Y(i)});
    k21=subs(f,{t,x,y},{T(i)+(h/2),X(i)+(h/2)*k11,Y(i)+(h/2)*k12});
    k22=subs(g,{t,x,y},{T(i)+(h/2),X(i)+(h/2)*k11,Y(i)+(h/2)*k12});
    k31=subs(f,{t,x,y},{T(i)+(h/2),X(i)+(h/2)*k21,Y(i)+(h/2)*k22});
    k32=subs(g,{t,x,y},{T(i)+(h/2),X(i)+(h/2)*k21,Y(i)+(h/2)*k22});
    k41=subs(f,{t,x,y},{T(i)+h,X(i)+h*k31,Y(i)+h*k32});
    k42=subs(g,{t,x,y},{T(i)+h,X(i)+h*k31,Y(i)+h*k32});
    X(i+1)=X(i)+(h/6)*(k11+2*k21+2*k31+k41);
    Y(i+1)=Y(i)+(h/6)*(k12+2*k22+2*k32+k42);
    exacta=subs(F,T(i+1));
    error=abs(exacta-Y(i+1));
    fprintf('%.15f\t || %.9f\t || %.9f\t || %.9f\t || %.9f\t || %.9f\t || %.9f\t || %.9f\t || %.9f\t || %.15f\t || %.15f\t || %.15f\t || %e\n',...
    T(i+1), double(k11), double(k12), double(k21), double(k22), double(k31), double(k32), double(k41), double(k42), double(X(i+1)), double(Y(i+1)), double(exacta), double(error));
end

fprintf('Valor aproximado x(%.15f) = %.15f \n', b, double(X(n+1)));
fprintf('Valor aproximado y(%.15f) = %.15f \n', b, double(Y(n+1)));
fprintf('Valor exacto f(%.15f) = %.15f \n', b, double(exacta));
fprintf('Error = %e \n', double(error));
