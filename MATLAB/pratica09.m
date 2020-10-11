%% ex01
%a
p=[14 64 5 10 7]/100;
Entropia=p'*log2(1./p);
%b
%           *,100
%          /     \
%      *,36        B,64
%      /  \
%  A,14   *,22
%         /  \
%     D,10   *,12
%            /  \  
%         C,5    E,7
%
% B-1,A-00,D-010,C-0110,E-0111

%c
N=1000;
nBits=[2 1 4 3 4];
BpSimb=(N*p*nBits')/N;
% ex02
[NumBits,NumBPS]=GeraMensagem(p,length(p),nBits);

%ex03
%B-1,A-000,D-001,C-010,E-011

%% antes do teste
M=imread('Floresta.bmp');
[Simb,Freq]=AlfabetoImagem(M);
%
function[Simb,Freq]=AlfabetoImagem(M)
    %M=imread('Floresta.bmp');
    [m,n]=size(M);
    Simb=unique(M);
    K=length(Simb);
    Freq=zeros(K,1);
    for k=1:K
       Freq(k)=sum(sum(M==Simb(k)))/(m*n) *100;
    end
end

function [NumBits,NumBPS]=GeraMensagem(f,CompMsg,nBits)
%CompMsg - numero total de simb
%f-frequencia de ocorrencia de cada simbolo [Nx1]
%nBits- numero de bits com que e codificado cada elemento [Nx1]
    %pd=makedist('Multinomial','probabilities',f/sum(f)); %Alternativa
    %Msg=random(pd,CompMsg,1);
    N=length(f);
    Msg=randsample(1:N,CompMsg,true,f/sum(f));
    NumBits=sum(nBits(Msg));
    NumBPS=NumBits/CompMsg;
    %o true na funcao randsample é pra nao haver repeticao
    %f/sum(f) serve para lhe dar as percentagens de cada simbolo
   
end


