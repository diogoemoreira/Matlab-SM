function [Simbolos,Freq] = Alfabeto2(texto)
s = length(texto);
k=1;
Simbolos(1,1)= texto(1);
Freq(k,1)=sum(texto==Simbolos(1))/s*100;
for i=2:length(texto)
    if sum(Simbolos==texto(i))==0  %se nao existir no array Simbolos
        %adicionar novo simbolo
        k=k+1;
        Simbolos(k,1)=texto(i);
        Freq(k,1)=sum(texto==Simbolos(k))/s*100;
    end
end

end