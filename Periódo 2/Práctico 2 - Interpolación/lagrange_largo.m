syms x
format long
disp('Metodo de Interpolacion de Lagrange')
X=input('Ingrese los valores de x: ');
f=input('Ingrese la funcion: ');
Y=subs(f,X);
aprox=input('Ingrese el valor a aproximar: ');
n=length(X); %Obteniendo el size del vector
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
%construyendo el polinomio
pol=0;
for i=1:n
    pol=pol+double(Y(i))*L(i);
end
fprintf('Polinomio de Lagrange resultante: \n');
pretty(vpa(pol,15));
valaprox=subs(pol,aprox);
valorexacto=subs(f,aprox);
error=abs(valorexacto-valaprox);
fprintf('El valor aproximado de la funcion es: %.15f \n\n',double(valaprox));
fprintf('El valor exacto de la funcion es: %.15f \n\n', double(valorexacto));