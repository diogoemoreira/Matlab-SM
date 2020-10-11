function [x,t] = ReconstroiSinal(X,f)
    N = length(X);
    fa=max(abs(f))*2;
    Ta=1/fa;
    t = [0:Ta:Ta*(N-1)]';
 
    x = ifft(ifftshift(X*N));
end