function Numbits = NumeroBits(texto)

[Simb,Freq]=Alfabeto2(texto);
[Freq,i]=sort(Freq,'descend'); %i é os indices dos simbolos ordenados por frequencia
Simb=Simb(i); %ordenar os simbolos pela sua frequencia (descendente)
Numbits=0;
N=length(texto);
for k=1:length(Simb)
    Numbits=Numbits+k*(Freq(k)/100*N); %k pois cada simbolo tem mais um bit q o anterior  
    %Freq(k)*N/100 é o numero de ocorrencias do simbolo
    %pois Freq(k)=sum(texto==Simb(k))/length(texto)*100
    % k= Nºbits para o simbolo Simb(n)
end

end
