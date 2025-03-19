syms x
disp('Metodo de Interpolacion de Lagrange')
X=input('Ingrese los valores de x: ');
Y=input('Ingrese los valores de y: ');
aprox=input('Ingrese el valor a aproximar: ');
n=length(X); 
for i=1:n
    numerador=1;
    denominador=1;
    for j=1:n
        if i~=j
            numerador=numerador*(x-X(j));
            denominador=denominador*(X(i)-X(j));
        end
    end
    L(i)=numerador/denominador;
    fprintf('L%d(x)=\n', i-1);
    pretty(L(i));
end
pol=0;
for i=1:n
    pol=pol+double(Y(i))*L(i);
end
fprintf('Polinomio de Lagrange resultante: \n');
pretty(vpa(pol,15));
valaprox=subs(pol,aprox);
fprintf('El valor aproximado de la funcion es: %.15f \n\n',double(valaprox));
