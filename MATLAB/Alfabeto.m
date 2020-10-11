function [Simb,Freq] = Alfabeto(texto)
    k=1;
    Simb(k)=texto(1);
    Freq(k)=sum(texto==Simb(k))/(length(texto))*100; %numero de elementos no texto iguais ao simbolo e
                                    %depois dividimos pelo total de elementos e metemos em percentagem
    for i=2:length(texto)
        if(Simb==texto(i))==0  %se no array de simbolos nao existir o simbolo em texto(i) entao
            k=k+1; %alterar a posicao em que vamos colocar o novo simbolo
            Simb(k)=texto(i);
            Freq(k)=sum(texto==Simb(k))/length(texto)*100; % *100 para termos a percentagem 0-100%
            %sum(texto==Simb(k))/length(texto) dá nos a frequencia( 0-1 ) de
            %ocorrencia para o simbolo Simb(k)
        end
    end
end