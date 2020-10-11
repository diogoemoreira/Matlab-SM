T0 = 10;
Ta = 0.01;
t = [0:Ta;(T0-Ta)]';
xt= sin(2*pi*t);
[X,fx]=Espetro(xt,Ta);
%% ex02b
T0 = 5;
Ta = 0.01;  %sampling period
t = [0:Ta:(T0-Ta)]';
yt= sin(10*pi*t)+cos(12*pi*t)+cos(14*pi*t-pi/4);
[Y,fy]=Espetro(yt,Ta);  
%% ex02c
f0 = 1;
Ta = 0.01;
t = [0:Ta:(5-Ta)]';
zt = (square(2*pi*f0*t)+ 1)/2;
[Z,fz] = Espetro(zt,Ta);
%% ex02d
f0=1;
T0=5;
Ta=0.01;
t=[0:Ta:(T0-Ta)]';
qt = (2*pi*f0*t);
[Q,fq] = Espetro(qt,Ta);


function [X,f] = Espetro(x,Ta) % x -> vetor de amostras de x(t) [Nx1] ; Ta -> periodo de amostragem
N=length(x);
% inverso do tempo total do sinal (frequencia do sinal)
fa=1/Ta;
F=fa/N;  %frequencia por N pontos
f= [-fa/2:F:fa/2-F];%tem de ir de -fa/2 ate fa/2
X=fftshift(fft(x))/N; %calculo da DFT de x; é necessario a fftshift(fft( ))/N para calcular a DFT
plot(f,abs(X)); %para plot o y tem de ser modulo de X
xlabel('Frequencia(Hz)');
end

function [X,f] = Espetro2(x,Ta,w)
    N = length(x);
    if w~=0
        X = ffshift(fft(x.*blackman(N)))/N; %para aplicar windowing multiplicar x por blackman(N) em que N sao é o n de pontos de x
    else
        X = fftshift(fft(x))/N;
    end
    F=1/(Ta*N) % inverso do tempo total do sinal (frequencia do sinal)
    fa=1/Ta;
    f = [-fa/2:F:fa/2-F]';
    
    plot(f,abs(X));
    xlabel('Frequency(Hz)');
    ylabel('Magnitude');
    grid;
end

function [x,t] = Reconstroi(X,fa)
    N = length(X);
    Ta = 1/fa;
    t = 0:Ta:Ta*N-Ta; %Ta*N numero de pontos de X
 
    x = ifft(ifftshift(X*N));
end
