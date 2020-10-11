%% ex01
clear;
load('Guitar01.mat');  %tem o vetor x e a frequencia fa
%sound(x,fa);

%ex 02
Ta=1/fa;
[X,f]=Espetro(x,Ta);
plot(f,abs(X));
xlabel('frequencia(Hz)');
axis([-4000 4000 0 4e-3]);

%ex 03
H=zeros(size(f));
H(f<500)=1;
H(f<100)=0;
H(f<-100)=1;
H(f<-500)=0;
W=H.*X;
[w,~]=ReconstroiSinal(W,f);
%sound(w,fa);
[w2,f2]=Espetro(w,Ta);
figure(102);
plot(f2,abs(w2));
axis([-4000 4000 0 4e-3]);

%% ex04
clear;
load Guitar01.mat;
figure(401);
[X,f]=Espetro(x,1/fa);
plot(f,abs(X));
axis([-4000 4000 0 4e-3]);

Ta=1/fa;
N=length(x);
t=[0:Ta:N*Ta-Ta]';

[~,t02]=min(abs(t-0.2));
[~,t04]=min(abs(t-0.4));
[~,t06]=min(abs(t-0.6));
[~,t08]=min(abs(t-0.8));

x02=[zeros(t02,1);x(1:(N-t02))];
x04=[zeros(t04,1);x(1:(N-t04))];
x06=[zeros(t06,1);x(1:(N-t06))];
x08=[zeros(t08,1);x(1:(N-t08))];

y=(x+0.5*x02+0.3*x04+0.2*x06+0.1*x08)/1.2;
sound(y,fa);
figure(402);
[y2,f2]=Espetro(y,1/fa);
plot(f2,abs(y2));
axis([-4000 4000 0 4e-3]);

%% ex05