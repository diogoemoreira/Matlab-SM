function [ak,bk] = CalcFourier(Ta,T0,x,K)
%- Ta: Per�odo de amostragem, em segundos;
%- T0: Per�odo do sinal, em segundos;
%- x: Vetor (?x1) com as amostras sucessivas do sinal a decompor (dever� ser passado
%um n�mero inteiro de per�odos deste sinal, n�o devendo o �ltimo per�odo ficar
%truncado);
%- k: N�mero de harm�nicas a considerar na decomposi��o.
f= 1/T0;
N = T0/Ta;
k = 1:K;
for n= 1:N
   ak = 2/N * x(n)*cos(2*pi*k*f*n*Ta);
end

end

