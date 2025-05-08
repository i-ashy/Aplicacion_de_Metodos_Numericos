display('REGRESI�N POLINOMIAL');
%Recolectando datos
X = input('Introduzca el arreglo X: ');
Y = input('Introduzca el arreglo Y: ');
m = input('Introduzca el grado del polinomio: ');

%Contando tama�o de arreglo
n=length(X);

% Calculando las matrices:
A = zeros(m + 1, m + 1); %matriz para x a x^n
B = zeros(m + 1, 1); %matriz para x*y^n

%Llenando las filas de 0 a m
for i = 0:m
    for j = 0:m %llenando columnas
        A(i + 1, j + 1) = sum(X.^(i + j)); %se suma x^n en cada iteraci�n
    end
    B(i + 1) = sum(Y .* X.^i);
end

% Mostrando matriz aumentada
disp('Matriz aumentada:');
disp([A B]);

% Resolviendo el sistema de ecuaciones usando eliminaci�n de Gauss
coef = A \ B;

% Imprimiendo los coeficientes
fprintf('Coeficientes del polinomio:\n');
for i = 0:m
    fprintf('\ta%d = %.4f\t\t', i, coef(i + 1));
end

% Imprimiendo la ecuaci�n ajustada
fprintf('\nEcuaci�n ajustada:\n');
fprintf('\t\ty = ');
for i = m:-1:0
    if i == 0
        fprintf('%.15f', coef(i + 1));
    else
        fprintf('%.15fx^%d + ', coef(i + 1), i);
    end
end
fprintf('\n');

% Evaluando el polinomio ajustado en los puntos dados
y_fit = polyval(flipud(coef), X);  % se usa flipud para que los coeficientes esten en orden correcto

% Calculando el error est�ndar y el coeficiente de determinaci�n
Sr = sum((Y - y_fit).^2); %suma de residuos
St = sum((Y - mean(Y)).^2); %suma de cuadrados
sy = sqrt(Sr / (n - (m + 1))); %error estandar
R2 = 1 - (Sr / St); %coeficiente de determinaci�n

%Imprimiendo
fprintf('Error est�ndar: %.15f\n', sy);
fprintf('Coeficiente de determinaci�n: %.15f\n', R2);