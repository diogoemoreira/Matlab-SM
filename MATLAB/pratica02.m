%% ex1
%
%% 1.a
ta = 0.01;
t=[0:ta:5];
xt = 2*sin(4*pi*t);
Potencia(xt);
%% 1.b
yt = sin(10*pi*t + pi/2);
plot(yt);
%% 1.c
zt=sin(6*pi*t)+sin(8*pi*t);
plot(zt)
%% 1.d
wt=sin(6*pi*t)+sin(8*pi*t + 0.1);
plot(wt);
%% 1.e
qt=sin(6*pi*t)+sin(7*pi*t)+sin(8*pi*t);
plot(qt);

%% ex3
function [p] = Potencia(Xt)
ta=0.01;
T = length(Xt)*ta;  % ta=espaco entre os intervalos length(Xt)=nºde intervalos T=ultimo X
area=0;
for k=Xt
    i=(k^2)*ta;  %k^2 -> y  ta -> espaco entre x1 e x2
    area = area+i;   %area do retangulo
end
p = (1/T)*area;

show = ['Potency =',num2str(p)];
disp(show);
end