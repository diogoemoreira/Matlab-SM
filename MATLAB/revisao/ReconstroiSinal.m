function [x,T] = ReconstroiSinal(X,f)
N=length(X);
fa=max(abs(f))*2;
Ta=1/fa;
T=0:Ta:Ta*N-Ta;
x=ifft(ifftshift(X*N));

end