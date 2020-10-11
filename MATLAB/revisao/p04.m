%% ex02 a
Ta = 0.01;
T = 1;
t= [0:Ta:10-1];
xt= sin(2*pi*t);  % a frequencia é 1
[X,f] = Espetro(xt,Ta,0);
%% ex02 b
Ta = 0.01;
t = [0:Ta:5-Ta];
yt = sin(10*pi*t)+cos(12*pi*t)+cos(14*pi*t-pi/4);
[Y,f] = Espetro(yt,Ta,0);
%% ex02 c
Ta = 0.01;
f0 = 1;
t = [0:Ta:(5-Ta)]';
zt = (square(2*pi*f0*t)+ 1)/2;
[Z,fz] = Espetro(zt,Ta,0);
%% ex03
Ta = 0.01;
f0 = 1;
t = [0:Ta:(5-Ta)]';
zt = (square(2*pi*f0*t)+ 1)/2;
[Z,fz] = Espetro(zt,Ta,1);
%% ex04
N = 500; % nº de amostras
Ta = 0.001;
t = [0:Ta:5-Ta];
x = zeros(size(t));
for k=1:20
f = rand(1,1)*20; %frequencia de 1 a 20 
fase = random('uniform',-pi,pi,1,1);  %% 1,1 final é pra só ter um valor (1x1), -pi,pi é o intervalo q dos valores (-pi:pi)
w = 2*pi*f;
x = x + sin(w*t + fase);
end
figure(1);
[X,t] = Espetro(x,Ta,0);
figure(2);
[X2,t2] = Espetro(x,Ta,1);
%%

%% Functions

function[X,f] = Espetro(x,Ta,w)
% x : sinal [Nx1]
% Ta: periodo de amostragem
N = length(x);  
fa = 1/Ta;
F=fa/N;  % inverso do tempo total do sinal (frequencia do sinal)
f = [-fa/2:F:(fa/2-F)];
if w==0
    X = fft(x)/N;
else
    X = fft(x.*blackman(N))/N;
end
X = fftshift(X);
plot(f,abs(X));
xlabel('frequencia(Hz)');
ylabel('Espetro');
end

function [x,t] = Reconstroi(X,Ta)
    N = length(X);
    Ta = 1/fa;
    t = 0:Ta:Ta*N-Ta;
 
    X = X*N;
    X = ifftshift(X);
    x = ifft(X);
end

