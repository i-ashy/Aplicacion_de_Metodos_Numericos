syms x
g = input('Ingrese la función g:');
c = input('Ingrese el valor de c:');
h = input('Ingrese el valor de h:');
p = input('Ingrese el valor de j:' );
N = zeros(p);

for i = 1:p
    N(i,1) = (subs(g, c + h) - subs(g, c - h)) / (2 * h);
    h = h / 2;
end

for j = 2:p
    for i = 1:p - j + 1
        N(i,j) = (4^(j-1) * N(i+1,j-1) - N(i,j-1)) / (4^(j-1) - 1);
    end
end

vpa(N, 15)
fprintf('El valor aproximado de la derivada: %.16f \n\n', double(N(1,p)))