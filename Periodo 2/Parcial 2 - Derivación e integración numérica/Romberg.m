disp('----------------Método de Romberg----------------')
syms x
f = input('Ingrese la función f: ');
a = input('Ingrese el valor de a: ');
b = input('Ingrese el valor de b: ');
n = input('Ingrese el valor de k: ');
R = zeros(n);
h = b - a;
hl = (b - a)/2;
R(1,1) = ((b - a)/2)*(subs(f,a) + subs(f,b));
suma = 0;

for i = 2:n
    for k = 1:2^(i-2)
        suma = suma + (subs(f, a + (2*k - 1)*hl));
    end
    R(i,1) = (1/2)*(R(i-1,1) + h*suma);
    h = h/2;
    hl = hl/2;
    suma = 0;
end

for j = 2:n
    for i = j:n
        R(i,j) = (4^(j-1)*R(i,j-1) - R(i-1,j-1))/(4^(j-1) - 1);
    end
end

vpa(R, 15)
fprintf('\nEl valor aproximado es: %.15f\n', double(R(n,n)))