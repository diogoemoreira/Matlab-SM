%% ex02a
Ta = 0.1;
t = [0:Ta;10];
xt= sin(2*pi*t);
Espetro(xt,Ta);
%% ex02b
Ta = 0.1;  %sampling period
t = [0:Ta:5];
yt= sin(10*pi*t)+cos(12*pi*t)+cos(14*pi*t-pi/4);
Espetro(yt,Ta);
%% ex02c
Ta = 1;
t = [





function [X,f] = Espetro(x,Ta)  % x -> vetor de amostras de x(t) [Nx1] ; Ta -> periodo de amostragem
N= length(x);
delta.f=1/(N*Ta);
fa=1/Ta;
f = [0:(N-1)]'*delta.f-fa/2;  % f =[ 0-fa/2:delta.f: fa/2-delta.f ]
X = fftshift(fft(x))/N;
plot(f,abs(X));
xlabel('Frequencia(Hz)');
ylabel('Espetro');
end

