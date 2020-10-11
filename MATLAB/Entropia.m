function H = Entropia(texto)
%Freq(k)/100*N; n de ocorrencias para o simbolo Simb(k)
[Simb,Freq]=Alfabeto2(texto);
H=0;
for k=1:length(Simb)
    pk=Freq(k)/100; %Frequencia sem ser em percentagem -> 0 a 1
    H=H+pk*log2(1/pk);
end
end