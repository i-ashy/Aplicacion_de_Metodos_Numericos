disp('********************************************')
disp('--------Regresión lineal exponencial--------')
disp('********************************************')
syms x
X = input('Ingrese los valores de x: ');
Y = input('Ingrese los valores de y: ');
num = input('Ingrese el valor a estimar: ');
n = length(X);
Yp = log(Y);

% for para las sumas
sum = 0;
sum1 = 0;
sum2 = 0;
sm = 0;
for i=1:n
    sum = sum + X(i);
    sum1 = sum1 + double(X(i)*Yp(i));
    sum2 = sum2 + Yp(i);
    sm = sm + double(X(i)^2);
end

% formula para B y a
B = double(((n*sum1)-sum*sum2)/((n*sm)-(sum)^2));
a = double((sum2 - (B*sum))/n);
% obtener a original
a1 = exp(a);
ec = double(a1)*(exp(B*x));
res = subs(ec,num);
% imprimir(f)
fprintf('\t\tsuma x\t\t || \t\tsuma ln(y)\t\t || \t\tsuma x*ln(y)\t\t || \t\tsuma x^2\n')
fprintf('\t\t%.4f\t\t || \t\t%.4f\t\t || \t\t%.4f\t\t || \t\t%.4f\n', sum, sum2, sum1, sm)
fprintf('La ecuacion transformada es: y = %.4fe^(%.4fx)\n',a1,B)
fprintf('La estimacion de x = %.4f es y = %.4f\n', num, double(res))