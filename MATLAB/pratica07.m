%% ex01
clear;
load Guitar01.mat;
%sound(x,fa);
%ex02
figure(101);
[X,f]=Espetro(x,1/fa);
axis([-4000 4000 0 4e-3]);
%ex03
H=zeros(size(f));
H(f<500)=1;
H(f<100)=0;
H(f<-100)=1;
H(f<-500)=0;
W=H.*X;
[w,~]=ReconstroiSinal(W,f);  % tem alguma coisa mal
figure(102);
[w2,f2]=Espetro(w,fa);
axis([-4000 4000 0 4e-3]);

%% ex04
load Guitar01.mat;
figure(401);
[X,fx]=Espetro(x,1/fa);
axis([-4000 4000 0 4e-3]);

N=length(x);
t=[0:N-1]'*(1/fa);
[~,i02]=min(abs(t-0.2));
[~,i04]=min(abs(t-0.4));
[~,i06]=min(abs(t-0.6));
[~,i08]=min(abs(t-0.8));

x02=[zeros(i02,1);x(1:(N-i02))];
x04=[zeros(i04,1);x(1:(N-i04))];
x06=[zeros(i06,1);x(1:(N-i06))];
x08=[zeros(i08,1);x(1:(N-i08))];

y=(x+0.5*x02+0.3*x04+0.2*x06+0.1*x08)/1.2;
sound(y,fa);
figure(402);
[y2,fy]=Espetro(y,1/fa);
axis([-4000 4000 0 4e-3]);
%% ex05
clear
load Guitar01.mat;
figure(401);
[X,fx]=Espetro(x,1/fa);
axis([-4000 4000 0 4e-3]);

z = 0.1 * tanh(1000*x);

sound(z,fa);
figure(402);
[z2,fz]=Espetro(z,1/fa);
axis([-4000 4000 0 4e-3]);
%% ex06
clear
load Guitar01.mat;
figure(401);
[X,fx]=Espetro(x,1/fa);
axis([-4000 4000 0 4e-3]);

t=[0:length(x)-1]'*(1/fa);
N=length(x);
[m,i02]=min(abs(t-0.2));
[m,i04]=min(abs(t-0.4));
[m,i06]=min(abs(t-0.6));
[m,i08]=min(abs(t-0.8));

x02=[zeros(i02,1);x(1:(N-i02))];
x04=[zeros(i04,1);x(1:(N-i04))];
x06=[zeros(i06,1);x(1:(N-i06))];
x08=[zeros(i08,1);x(1:(N-i08))];

y=(x+0.5*x02+0.3*x04+0.2*x06+0.1*x08)/1.2;
figure(402);
[y2,fy]=Espetro(y,1/fa);

z = 0.1 * tanh(1000*y);

sound(z,fa);
figure(402);
[z2,fz]=Espetro(z,1/fa);
axis([-4000 4000 0 4e-3]);

%% ex07
clear
load Guitar01.mat;
fa=fa/2;
figure(401);
[X,fx]=Espetro(x,1/fa);
t=[0:length(x)-1]'*(1/fa);
N=length(x);
[m,i02]=min(abs(t-0.2));
[m,i04]=min(abs(t-0.4));
[m,i06]=min(abs(t-0.6));
[m,i08]=min(abs(t-0.8));

x02=[zeros(i02,1);x(1:(N-i02))];
x04=[zeros(i04,1);x(1:(N-i04))];
x06=[zeros(i06,1);x(1:(N-i06))];
x08=[zeros(i08,1);x(1:(N-i08))];

y=(x+0.5*x02+0.3*x04+0.2*x06+0.1*x08)/1.2;
figure(402);
[y2,fy]=Espetro(y,1/fa);

z = 0.1 * tanh(1000*y);

sound(z,fa);
figure(402);
[z2,fz]=Espetro(z,1/fa);

