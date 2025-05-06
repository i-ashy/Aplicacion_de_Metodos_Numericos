syms t y
disp('Metodo de Runge-Kutta Orden 4')
f=input('Ingrese la ecuación diferencial dy/dt: ');
intervalo=input('Ingrese el intervalo [a,b]: ');
y0=input('Ingrese el valor inicial: ');
F=input('Ingrese la solucion de la ecuacion diferencial: ');
h=input('Ingrese el valor de h: ');
a=intervalo(1);
b=intervalo(2);
n=int16((b-a)/h);
T=[a:h:b];
Y(1)=y0;
fprintf('ti\t\t\t\t\t || k1\t\t\t || k2\t\t\t || k3\t\t\t || k4\t\t\t || Yi\t\t\t\t\t || F(ti)\t\t\t\t || error\n');
fprintf('%.15f\t || %.9f\t || %.9f\t || %.9f\t || %.9f\t || %.15f\t || %.15f\t || %e\n',...
    T(1), 0, 0, 0, 0, double(Y(1)), double(Y(1)), 0);

for i=1:n
    k1=subs(f,{t,y},{T(i),Y(i)});
    k2=subs(f,{t,y},{T(i)+(1/2)*h,Y(i)+(1/2)*h*k1});
    k3=subs(f,{t,y},{T(i)+(1/2)*h,Y(i)+(1/2)*h*k2});
    k4=subs(f,{t,y},{T(i)+h,Y(i)+h*k3});
    Y(i+1) = Y(i)+(h/6)*(k1+2*k2+2*k3+k4);
    exacta=subs(F,T(i+1));
    error=abs(exacta-Y(i+1));
    fprintf('%.15f\t || %.9f\t || %.9f\t || %.9f\t || %.9f\t || %.15f\t || %.15f\t || %e\n',...
    T(i+1), double(k1), double(k2), double(k3), double(k4), double(Y(i+1)), double(exacta), double(error));
end

fprintf('Valor aproximado y(%.15f) = %.15f \n', b, double(Y(n+1)));
fprintf('Valor exacto f(%.15f) = %.15f \n', b, double(exacta));
fprintf('Error = %e \n', double(error));


%para orden 3
%k1=subs(f,{t,y},{T(i),Y(i)});
%k2=subs(f,{t,y},{T(i)+(1/2)*h,Y(i)+(1/2)*h*k1});
%k3=subs(f,{t,y},{T(i)+(3/4)*h,Y(i)+(3/4)*h*k2});
%Y(i+1)=Y(i)+(h/9)*(2*k1+3*k2+4*k3);

%para orden 5
%k1=subs(f,{t,y},{T(i),Y(i)});
%k2=subs(f,{t,y},{T(i)+(1/4)*h,Y(i)+(1/4)*h*k1});
%k3=subs(f,{t,y},{T(i)+(3/8)*h,Y(i)+(3/32)*h*k1+(9/32)*h*k2});
%k4=subs(f,{t,y},{T(i)+(12/13)*h,Y(i)+(1932/2197)*h*k1-(7200/2197)*h*k2+(7296/2197)*h*k3});
%k5=subs(f,{t,y},{T(i)+h,Y(i)+(439/216)*h*k1-8*h*k2+(3680/513)*h*k3-(845/4104)*h*k4});
%k6=subs(f,{t,y},{T(i)+(1/2)*h,Y(i)-(8/27)*h*k1+2*h*k2-(3544/2565)*h*k3+(1859/4104)*h*k4-(11/40)*h*k5});
%Y(i+1)=Y(i)+h*((16/135)*k1+(6656/12825)*k3+(28561/56430)*k4+(9/50)*k5+(2/55)*k6);
