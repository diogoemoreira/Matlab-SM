function [X,f] = Espetro(x,Ta)
N=length(x);
fa=1/Ta;
f=[-fa/2: fa/N :(fa/2)-(fa/N)];
X=fftshift(fft(x))/N;
end