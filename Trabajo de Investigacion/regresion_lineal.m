disp('---Regresión lineal de mínimos cuadrados---'); 
% Ingreso de los vectores de valores de X y Y 
X = input('Ingrese los valores de x: '); 
Y = input('Ingrese los valores de y: '); 
aprox = input('Ingrese el valor a aproximar: '); 

% Leyendo el tamaño del vector X 
n = length(X); 

% Declarando todas las sumatorias 
sumXi=0; 
sumYi=0; 
sumXiYi=0; 
sumXi2=0;

for i=1:n 
    sumXi=sumXi+X(i); 
    sumYi=sumYi+Y(i); 
    sumXiYi=sumXiYi+X(i)*Y(i); 
    sumXi2=sumXi2+(X(i))^2; 
end 

% Calculando la pendiente a_1 
al=(n*sumXiYi - sumXi*sumYi)/(n*sumXi2 - sumXi^2); 

% Calculando la interseccion a_0 
mediaX=sumXi/n; 
mediaY=sumYi/n; 
a0=mediaY-al*mediaX; 

% Escribiendo la ecuacion de la recta 
fprintf('La ecuacion de la linea de regresion es: \n'); 
fprintf('y = %.3f + %.3fx \n\n', a0, al); 

% Calculando la aproximacion
resp=a0+al*aprox;

fprintf('El resultado de la aproximacion x=%.3f es %.3f\n\n',aprox,resp);

Sr=0; %Error estandar de la línea de regresion
St=0; %Coeficiente de determinacion
for i=1:n
    Sr = Sr + (Y(i) - a0 - al*X(i))^2;
    St = St + (Y(i)-mediaY)^2;
end
Syx=sqrt(Sr/(n-2)); %Error estandar del estimado
r2=(St-Sr)/St;
%Interesciando resultados
fprintf('Pendiente (al=%.3f): Por cada unidad que aumenta x, y aumentara en %.3f unidades\n',al,al);
fprintf('Interseccion (a0=%.3f): Cuado x=0, y es aproximadamente %.3f \n',a0,a0);
fprintf('Coeficiente de determinacion (r^2=%.3f): El modelo explica el %.1f%% de la variabilidad en y\n',r2,r2*100);