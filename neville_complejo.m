syms x
disp('Metodo de Interpolacion de Neville')
% Ingreso de los vectores de valores de X y Y
X = input('Ingrese los valores de x: ');
Y = input('Ingrese los valores de y: ');
aprox = input('Ingrese el valor a aproximar: ');
% Leyendo el tama?o del vector X
n = length(X);
% Formando una matriz de ceros de orden nxn
Q = zeros(n);
% La primera columna tiene los valores de Y
Q(:,1) = Y;
% Recorriendo columna por columna desde la segunda
for j = 2:n
    % Llenando las filas de cada columna
    for i = j:n
        Q(i,j) = ((aprox - X(i-j+1)) * Q(i,j-1) - (aprox - X(i)) * Q(i-1,j-1)) / (X(i) - X(i-j+1));
        fprintf('\n\t (X-X%d)%d%d - (X-X%d)%d%d    (x-(%.2f))*(%.9f) - (x-(%.2f))*(%.9f) ', ...
            i-j, i-1, j-2, i-1, i-2, j-2, ...
            X(i-j+1), Q(i,j-1), X(i), Q(i-1,j-1));
        fprintf('\n%d%d %% %.9f', i-1, j-1, Q(i,j));
        fprintf('\n\t\t (X%d-%d%)\t\t\t\t\t\t    (%.2f)-(%.2f)\n', i-1, i-j, X(i), X(i-j+1));
    end
end
fprintf('---- MATRIZ DE VALORES Q------ \n');
display(Q)
fprintf('El valor aproximado es: %.15f \n\n', double(Q(n,n)));