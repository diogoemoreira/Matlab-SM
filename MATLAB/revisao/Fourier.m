function [t,xt] = Fourier(Ta,f0,Np,ak,bk)
% Ta: Período de amostragem, em segundos;
% f0: Frequência do sinal composto, em Hz;
% Np: Número de períodos a considerar para o sinal resultante;
% ak: Vetor (?x1) com os valores de ?? da série;
% bk: Vetor (?x1) com os valores de ?? da série.
T0=1/f0;
N = round(Np/(Ta*f0));
t = 0:Ta:(N-1)*Ta; %tempo da funcao

% Np*T0 dá o tempo total do sinal 
% Np*T0/Ta dá o numero de pontos do sinal a considerar
% OU
% Ta*f0 vai dar o numero de pontos num periodo
% Np/(Ta*f0) vai dar o numero de pontos para os periodos dados

w0 = 2*pi*f0;
xt = zeros(size(t));
for k=1:length(ak)
    xt = xt + ak(k) * cos(k*w0*t) + bk(k) * sin(k*w0*t);  
end

end