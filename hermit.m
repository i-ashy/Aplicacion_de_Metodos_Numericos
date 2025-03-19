syms x
format long
disp('METODO DE HERMITE')
X=input('Ingrese x: ');
Y=input('Ingrese y: ');
dy=input('Ingrese los valores de la derivada de y: ');
aprox=input('Ingrese la aproximación: ');
n=length(X)*2;
Q=zeros(n);
for i=1:n/2
    Q(i*2,1)=Y(i);
    Q(i*2-1,1)=Y(i);
end
for i=1:n/2
    Q(i*2,2)=dy(i);
    if i > 1
        Q(2*i-1,2)=(Q(2*i-1,1)-Q(2*i-2,1))/(X(i)-X(i-1));
    end
end
for j=3:n
    for i=j:n
        Q(i,j)=(Q(i,j-1)-Q(i-1,j-1))/(X(ceil((i)/2))-X(ceil((i-j+1)/2)));
    end
end
display('Matriz:');
display(Q);
pol=Q(1,1);
for i=2:n
    fact=1;
    for j=1:ceil(i-1)
        fact=fact*(x-X(ceil(j/2)));
    end
    pol=pol+Q(i,i)*fact;
end
pretty(vpa(pol,15));
valaprox=subs(pol,aprox);
fprintf('El valor aproximado es: %.9f\n',double(valaprox));
