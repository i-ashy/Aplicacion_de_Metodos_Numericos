syms x
format long
display('METODO DE DIFERENCIAS DIVIDIDAS');
X=input('Ingrese los valores de x: ');
Y=input('Ingrese los valores de y: ');
aprox=input('Ingrese el valor aproximar: ');
n=length(X);
F=zeros(n);
F(:,1)=Y;
for j=2:n 
    for i=j:n 
       F(i,j)=(F(i-1,j-1)-F(i,j-1))/(X(i-j+1)-X(i)); 
    end
end
display(F);
display('Polinomio resultante:');
pol=F(1,1);
for i=2:n 
    fact=1;
    for j=1:i-1 
        fact=fact*(x-X(j));
    end
    pol=pol+F(i,i)*fact;
end
pretty(vpa(pol,15)); 
valaprox=subs(pol,aprox);
fprintf('El valor aproximado es: %.15f\n',double(valaprox));
