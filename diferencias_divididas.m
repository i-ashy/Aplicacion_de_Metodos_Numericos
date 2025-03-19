syms x
format long
display('METODO DE DIFERENCIAS DIVIDIDAS');
X=input('Ingrese los valores de x: ');
Y=input('Ingrese los valores de y: ');
aprox=input('Ingrese el valor aproximar: ');
n=length(X); %tamaño de matriz
F=zeros(n); %inicializamos matriz de ceros
%llenamos primera columna
F(:,1)=Y;
for j=2:n %desde la columna 2 n
    for i=j:n %desde la fila 2 a n
       F(i,j)=(F(i-1,j-1)-F(i,j-1))/(X(i-j+1)-X(i)); %formula de dif div
    end
end
display(F); %muestro la matriz
display('Polinomio resultante:');
%construyendo polinomio
pol=F(1,1);
for i=2:n %se ocupa desde la segunda fila
    fact=1;
    for j=1:i-1 %los factores que se van agregando segun van pasando los coef
        fact=fact*(x-X(j));
    end
    pol=pol+F(i,i)*fact;
end
pretty(vpa(pol,15)); %damos forma
%valor aproximado
valaprox=subs(pol,aprox);
fprintf('El valor aproximado es: %.15f\n',double(valaprox));