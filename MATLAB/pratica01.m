%
%AULA 01
%

%% Exercicio1.1:
Ta = 0.01;
tx = [0:Ta:5]; %#ok<NBRAK> este é um array/matriz a comecar em 0 aumentando Ta(0.01) ate 5
x = 2*sin(4*pi*tx);

%% Exercicio1.2:
Ta = 0.01;
ty = [0:Ta:5]; %#ok<NBRAK> este é um array/matriz a comecar em 0 aumentando Ta(0.01) ate 5
y = cos(10*pi*ty);

%% Exercicio1.3:
Ta = 0.01;
tz = [0:Ta:5]; %#ok<NBRAK> este é um array/matriz a comecar em 0 aumentando Ta(0.01) ate 5
x = 2*sin(4*pi*tz);
y = cos(10*pi*tz);
z = x.*y;

%% Exercicio1.4:
Ta = 0.01;
tw = [0:Ta:10]; %#ok<NBRAK> este é um array/matriz a comecar em 0 aumentando Ta(0.01) ate 5
w = 3*sin(pi*tw)+2*sin(6*pi*tw);

%% Exercicio1.5:
Ta = 0.01;
tq1 = [0:Ta:5]'; % este é um array/matriz a comecar em 0 aumentando Ta(0.01) ate 5
tq2 = tq1';

for n = 1:length(tq1) %n vai de 1 ao comprimento de 501
    q(n,:) = 2*sin(2*pi*(2*tq1(n)+tq2));
end
mesh(tq1,tq2,q); %para ver em 3d
%% Exercicio 3:
plot(tx,x,'-r');
hold on %serve para nao apagar o grafico quando cria um novo
plot(ty,y,'--b','LineWidth',2);
plot(tz,z,'-g');
plot(tw,w,'-y');
hold off

%% Exercicio 4:

%% Exercicio 5:
Ta = 1/25;
t = [0:Ta:5];
x1 = [-5:Ta:5];
x2 = [-5:Ta:5]';
tic
for k= 1:length(t)
    for i= 1:length(x1)
        r(i,:)= 2*sin(2*pi*sqrt(x1(i)^2+x2.^2)-2*pi*t(k));
    end
    mesh(x1,x2,r);view(2);drawnow;
    pause(Ta-toc);
end

