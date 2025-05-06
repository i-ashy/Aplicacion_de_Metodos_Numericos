%Algunos comentarios es código si acaso solo nos dan los valores de X y un F(x), nosotros debemos encontrar Y y la derivada
syms x
format long
disp('METODO DE HERMITE')
X=input('Ingrese x: ');
Y=input('Ingrese y: ');

%f=input('Ingrese la función: ');
%Y=subs(f,X)

dy=input('Ingrese los valores de la derivada de y: ');

%df=diff(f); aca se deriva la función dada
%dy=subs(df,X); se evaluan los valores de X ahora en la derivada

aprox=input('Ingrese la aproximación: ');
n=length(X)*2; %la matriz debe sser dos veces más grandes por la sustitución doble
Q=zeros(n);

%llenando primera columna con valores doble consecutivos
for i=1:n/2
    Q(i*2,1)=Y(i); %se llenan las columnas pares
    Q(i*2-1,1)=Y(i); %se llenan columnas impares
end

%llenando segunda columnas pares con las derivadas y las impares con diferencias divididas
for i=1:n/2
    Q(i*2,2)=dy(i);
    if i > 1
        Q(2*i-1,2)=(Q(2*i-1,1)-Q(2*i-2,1))/(X(i)-X(i-1));
    end
end

%llenando lo que queda de matriz con dif/div
for j=3:n
    for i=j:n
        Q(i,j)=(Q(i,j-1)-Q(i-1,j-1))/(X(ceil((i)/2))-X(ceil((i-j+1)/2)));
    end
end
display('Matriz:');
display(Q);

%formando polinomio
pol=Q(1,1); %el primer valor de la matriz
for i=2:n %los factores del polinomio comienzan en el segundo término
    fact=1;
    for j=1:ceil(i-1)
        fact=fact*(x-X(ceil(j/2)));
    end
    pol=pol+Q(i,i)*fact;
end
pretty(vpa(pol,15));

valaprox=subs(pol,aprox);
%si piden valor exacto y error
%valreal=subs(f,aprox);
%error=abs(valreal-valaprox);
fprintf('El valor aproximado es: %.9f\n',double(valaprox));
