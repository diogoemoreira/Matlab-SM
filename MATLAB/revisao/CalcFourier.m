function [ak,bk] = CalcFourier(Ta,T0,x,K)
%- Ta: Período de amostragem, em segundos;
%- T0: Período do sinal, em segundos;
%- x: Vetor (?x1) com as amostras sucessivas do sinal a decompor (deverá ser passado
%um número inteiro de períodos deste sinal, não devendo o último período ficar
%truncado);
%- k: Número de harmónicas a considerar na decomposição.
f= 1/T0;
N = T0/Ta;
k = 1:K;
for n= 1:N
   ak = 2/N * x(n)*cos(2*pi*k*f*n*Ta);
end

end

