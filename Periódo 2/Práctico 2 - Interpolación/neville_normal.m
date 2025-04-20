syms x
disp('Metodo de Interpolacion de Neville')
X = input('Ingrese los valores de x: ');
Y = input('Ingrese los valores de y: ');
aprox = input('Ingrese el valor a aproximar: ');
n = length(X);
Q = zeros(n);
Q(:,1) = Y;
for j = 2:n
    for i = j:n
        Q(i,j) = ((aprox - X(i-j+1)) * Q(i,j-1) - (aprox - X(i)) * Q(i-1,j-1)) / (X(i) - X(i-j+1));
    end
end
fprintf('MATRIZ\n');
display(Q)
fprintf('El valor aproximado es: %.15f \n\n', double(Q(n,n)));
