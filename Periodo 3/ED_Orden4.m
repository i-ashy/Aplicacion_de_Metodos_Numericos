syms t u1 u2 u3 u4
disp('Sistema EDL Orden 4');
fu1 = input('Ingrese du1 : ');
fu2 = input('Ingrese du2 : ');
fu3 = input('Ingrese du3 : ');
fu4 = input('Ingrese du4 : ');
intervalo = input('Ingrese el intervalo de t : ');
u10 = input('Ingrese el valor inicial de u1 (y(0)): ');
u20 = input('Ingrese el valor inicial de u2 (y''(0)): ');
u30 = input('Ingrese el valor inicial de u3 (y''(0)): ');
u40 = input('Ingrese el valor inicial de u4 (y''''(0)): ');
h = input('Ingrese el valor de h : ');
a = intervalo(1);
b = intervalo(2);
T = [a:h:b];
n = length(T)-1;
U1 = zeros(1,n);
U2 = zeros(1,n);
U3 = zeros(1,n);
U4 = zeros(1,n);
U1(1) = u10;
U2(1) = u20;  
U3(1) = u30;  
U4(1) = u40; 
fprintf('------------------------------\n');
fprintf(' t=%.10f\n', T(1));
fprintf('u1(t)=y(t)=%0.15f\n',U1(1));
fprintf('u2(t)=Dy(t)=%0.15f\n',U2(1));
fprintf('u3(t)=D2y(t)=%0.15f\n',U3(1));
fprintf('u4(t)=D3y(t)=%0.15f\n',U4(1));
fprintf('------------------------------\n');
for i=1:n
    fprintf(' i=%2f\n',i);
    fprintf('t=%.15f\n',T(i+1));
    %primer paso
    k11=double(subs(fu1,{t,u1,u2,u3,u4},{T(i),U1(i),U2(i),U3(i),U4(i)}));
    k12=double(subs(fu2,{t,u1,u2,u3,u4},{T(i),U1(i),U2(i),U3(i),U4(i)}));
    k13=double(subs(fu3,{t,u1,u2,u3,u4},{T(i),U1(i),U2(i),U3(i),U4(i)})); 
    k14=double(subs(fu4,{t,u1,u2,u3,u4},{T(i),U1(i),U2(i),U3(i),U4(i)}));
    
    %segundo paso
    k21=double(subs(fu1,{t,u1,u2,u3,u4},{T(i)+h/2,U1(i)+(h/2)*k11,U2(i)+(h/2)*k12,U3(i)+(h/2)*k13,U4(i)+(h/2)*k14}));
    k22=double(subs(fu2,{t,u1,u2,u3,u4},{T(i)+h/2,U1(i)+(h/2)*k11,U2(i)+(h/2)*k12,U3(i)+(h/2)*k13,U4(i)+(h/2)*k14}));
    k23=double(subs(fu3,{t,u1,u2,u3,u4},{T(i)+h/2,U1(i)+(h/2)*k11,U2(i)+(h/2)*k12,U3(i)+(h/2)*k13,U4(i)+(h/2)*k14}));
    k24=double(subs(fu4,{t,u1,u2,u3,u4},{T(i)+h/2,U1(i)+(h/2)*k11,U2(i)+(h/2)*k12,U3(i)+(h/2)*k13,U4(i)+(h/2)*k14}));
    
    %tercer paso
    k31=double(subs(fu1,{t,u1,u2,u3,u4},{T(i)+h/2,U1(i)+(h/2)*k21,U2(i)+(h/2)*k22,U3(i)+(h/2)*k23,U4(i)+(h/2)*k24}));
    k32=double(subs(fu2,{t,u1,u2,u3,u4},{T(i)+h/2,U1(i)+(h/2)*k21,U2(i)+(h/2)*k22,U3(i)+(h/2)*k23,U4(i)+(h/2)*k24}));
    k33=double(subs(fu3,{t,u1,u2,u3,u4},{T(i)+h/2,U1(i)+(h/2)*k21,U2(i)+(h/2)*k22,U3(i)+(h/2)*k23,U4(i)+(h/2)*k24}));
    k34=double(subs(fu4,{t,u1,u2,u3,u4},{T(i)+h/2,U1(i)+(h/2)*k21,U2(i)+(h/2)*k22,U3(i)+(h/2)*k23,U4(i)+(h/2)*k24}));
    
    %cuarto paso
    k41=double(subs(fu1,{t,u1,u2,u3,u4},{T(i)+h,U1(i)+h*k31,U2(i)+h*k32,U3(i)+h*k33,U4(i)+h*k34}));
    k42=double(subs(fu2,{t,u1,u2,u3,u4},{T(i)+h,U1(i)+h*k31,U2(i)+h*k32,U3(i)+h*k33,U4(i)+h*k34}));
    k43=double(subs(fu3,{t,u1,u2,u3,u4},{T(i)+h,U1(i)+h*k31,U2(i)+h*k32,U3(i)+h*k33,U4(i)+h*k34}));
    k44=double(subs(fu4,{t,u1,u2,u3,u4},{T(i)+h,U1(i)+h*k31,U2(i)+h*k32,U3(i)+h*k33,U4(i)+h*k34}));
    
    %imprimiendo la solución de la formula de R4
    U1(i+1)=double(U1(i)+(h/6)*(k11+2*k21+2*k31+k41));
    U2(i+1)=double(U2(i)+(h/6)*(k12+2*k22+2*k32+k42));
    U3(i+1)=double(U3(i)+(h/6)*(k13+2*k23+2*k33+k43));
    U4(i+1)=double(U4(i)+(h/6)*(k14+2*k24+2*k34+k44));
    
    fprintf('u1(t)=y(t)=%0.15f\n',U1(i+1));
    fprintf('u2(t)=Dy(t)=%0.15f\n',U2(i+1));
    fprintf('u3(t)=D2y(t)=%0.15f\n',U3(i+1));
    fprintf('u4(t)=D3y(t)=%0.15f\n',U4(i+1));
    fprintf('-------------------------------------\n');
    
end

%TAYLOR ORDEN SUPERIOR
% syms t y
% a=0; b=0; h=0;
% y0=0;
% T=[a:h:b];
% n=length(T)-1;
% f=F';
% d1f=F'';
% d2f=F''';
% d3f=F'''';
% g=h*f+((h^2)/2)*d1f+((h^3)/6)*d2f+((h^4)/24)*d3f;
% Y(1)=y0;
% for i=1:n
%     Y(i+1)=Y(i)+subs(g,[t,y],[T(i),Y(i)]);
% end
% Y'
% para exacta
% exacta=funcion;
% E=subs(exacta,T);
% error=abs(E-Y);
% [T' Y' E' error']

%para sol implicita exacta
% syms y t
% T=[a:h:b];
% sol=implicita;
% g=subs(sol,t,T);
% for i=1:length(g)
%     E(i)=solve(g(i));
% end
% E'