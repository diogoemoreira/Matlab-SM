%% ex01
N=1000;
Ta=0.001;
figure(1);
[x,t]=GeraSinal(N,Ta);
%% ex02
figure(2);
[x2,f]=Espetro(x,Ta,0);
%% ex03
H = zeros(size(f));
H(f<2)=1;
H(f<-2)=0;

figure(31);
plot(f,H);

xlim([-10,10]);
ylim([0,2]);
xf = H.*x;
[xn,tn] = Reconstroi(x,t);
figure(32);
plot(t,x);
hold on;
plot(tn,xn);
%% ex04
G = 1-H;
figure(41);
plot(f,G);
xlim([-10,10]);
ylim([0,2]);
Xf = G.*x;
[xr,tr] = Reconstroi(xf,f);
plot(tr,xr);
%% ex05
Pxn = Potencia(xn);
Pxr = Potencia(xr);
SNR = Pxn/Pxr;  % SNR = Potencia do Sinal util/Potencia do ruido
SNRdB = 10*log10(SNR);
fprintf('O SNR e de %.3f (%.2f dB).\n0',SNR,SNRdB);
%fprintf('E o ENOB e de %.2f');

%% functions
function [x,t]=GeraSinal(N,Ta)
%N-amostras do sinal
%Ta-periodo de amostragem do sinal
t=0:Ta:Ta*N-Ta;

n1=random('normal',0,pi,1,N); %distribuiçao normal,media 0,desvio padrao pi,N elementos
n2=random('normal',0,pi,1,N);

phi1=zeros(N,1);
phi2=zeros(N,1);
for k=2:N
    phi1(k)=phi1(k-1)+((n1(k-1)+n1(k))/2) * Ta; %integracao da variavel aleatoria n1
    phi2(k)=phi2(k-1)+((n2(k-1)+n2(k))/2) * Ta; %integracao da variavel aleatoria n2
end
rt=0.5*sin(20*pi*t+10*phi1)+0.5*(24*pi*t+10*phi2);
x=sin(2*pi*t)+rt;

plot(t,x);
end

function[X,f] = Espetro(x,Ta,w)
% x : sinal [Nx1]
% Ta: periodo de amostragem
N = length(x);
F=1/(N*Ta);   % inverso do tempo total do sinal (frequencia do sinal)
fa = 1/Ta;
f = [-fa/2:F:(fa/2-F)];
if w==0
    X = fft(x)/N;
else
    X = fft(x.*blackman(N))/N;
end
X = fftshift(X);
plot(f,abs(X));
xlabel('frequencia(Hz)');
ylabel('Espetro');
end

function [x,t] = Reconstroi(X,f)
    N = length(X);
    fa = max(abs(f))*2;
    Ta = 1/fa;
    t = [0:(N-1)]*Ta;
    x = ifft(ifftshift(X*N));
end