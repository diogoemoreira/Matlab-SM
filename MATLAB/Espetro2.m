function [x,f1,f2] = Espetro2(x,Ta)
[M,N] = size(x);

x = fftshift(fft2(x)/N/M);
fa = 1/Ta;
delta.f1 = 1/(M*Ta);
delta.f2 = 1/(M*Ta);
f1 = [0:(M-1)]'*delta.f1 - fa/2;
f2 = [0:(N-1)]'*delta.f2 - fa/2;
end

