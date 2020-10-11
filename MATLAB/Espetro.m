function [X,f] = Espetro(x,Ta)  % x -> vetor de amostras de x(t) [Nx1] ; Ta -> periodo de amostragem
N= length(x);
F=1/(N*Ta);   % inverso do tempo total do sinal (frequencia do sinal)
fa=1/Ta;
f = [(-fa/2):F:(fa/2-F)]';  % f =[ 0-fa/2 :F: fa/2-F ]
X = fftshift(fft(x))/N;
plot(f,abs(X));
xlabel('Frequencia(Hz)');
ylabel('Espetro');
end