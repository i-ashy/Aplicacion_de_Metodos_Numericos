syms x
disp('Método de Cuadratura Gaussiana')
f = input('Ingrese la función a integrar f:');
p = input('Ingrese el polinomio de Legendre a usar p:');
n = input('Ingrese el grado del polinomio de Legendre:');
X = double(solve(p));
X
Y = double(subs(f, X));
h = diff(p);

for i = 1:n
    d = int(p/(x - X(i)));
    m = subs(d, 1) - subs(d, -1);
    W(i) = double(norm(1/(subs(h, X(i))) * m));
end

double(W)
integral = 0;

for i = 1:n
    integral = integral + W(i) * Y(i);
end

fprintf('\nEl valor aproximado es: %.15f\n', double(integral))