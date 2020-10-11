%% ex01
[Image,ColorMap]=imread('Parede_8bit.bmp');
image(Image);
colormap(ColorMap);
% ex02/03
Save8bitImage('texto.txt',Image);
[N,M,Im]=Load8bitImage('texto.txt');
figure(102);
image(Im);
colormap(ColorMap);
% ex04
Stream = EncodeImage_RLE(Image);
% ex05
Save8bitStream('texto2.txt',720,1391,Stream);
%[N,M,Im]=Load8bitStream('texto2.txt'); %not done


function Save8bitImage(FileName,Image)
    [N,M]=size(Image);
    if isfile(FileName)
        fp=fopen(FileName,'wb');
        fwrite(fp,N,'uint16');
        fwrite(fp,M,'uint16');
        fwrite(fp,Image,'uint8');
        %for n=1:N
            %for m=1:M
                %fwrite(fp,Image(n,m),'uint8')
            %end
        %end
        fclose(fp);
    else
        printf("file doesn't exist");
    end
end

function [N,M,Im] = Load8bitImage(FileName)
    if isfile(FileName)
        fp=fopen(FileName,'rb'); %abrir ficheiro pra leitura em bits
        %se mandarmos ler 1 elemento o primeiro é o N e o segundo o M(dimensoes da matriz)
        N=fread(fp,1,'uint16'); %guardamos em 1 pois é o tamanho N da matriz(NxM)
        M=fread(fp,1,'uint16'); %guardamos em 1 pois é o tamanho M da matriz(NxM)
        Im=fread(fp,[N,M],'uint8'); %guardamos em [N,M] pois é a matriz de tamanho NxM
        Im=uint8(Im); %imagem em 8 bits
        fclose(fp); %fechar ficheiro
    else
        printf("file doesn't exist");
    end
end

function [Stream] = EncodeImage_RLE(Image)
    [N,M]=size(Image);
    k=1;
    Stream(k,1)=Image(1,1);
    count=uint8(0);
    for n=1:N %percorrer linha a linha
        for m= 1:M %percorrer coluna a coluna
            if Image(n,m)==Stream(k,1) %se aparecer o mesmo simbolo que o anterior
                if count ==255 %como um byte so consegue chegar a 255 fechar a 255 e abrir um novo para o mesmo simbolo a 1
                    k=k+1; %se chegar a 255 colocamos a contagem a seguir ao simbolo
                    Stream(k,1)=count; %colocar a contagem(255) para o simbolo
                    k=k+1; %colocamos o simbolo a seguir ao 255
                    Stream(k,1)=Image(n,m); %colocar o simbolo a seguir se for o mesmo metemos na mesma
                    count=0; %a 0 pq a seguir ao if incrementamos o count
                end
                count = count+1; 
            else %se o simbolo nao for o mesmo
                k=k+1; %aumentamos o k em 1 para colcar a contagem do simbolo a seguir a ele
                Stream(k,1)=count; %colocar a contagem para o simbolo anterior
                k=k+1; %aumentar o k para colocar o proximo simbolo a ser contado
                Stream(k,1)=Image(n,m); %colocar o novo simbolo
                count=1; %iniciar a contagem para o novo simbolo
            end
        end
    end
    k=k+1;
    Stream(k,1)=count; %escrever a contagem do ultimo simbolo
end

function Save8bitStream(FileName,N,M,Stream)
    fp=fopen(FileName,'wb');
    fwrite(fp,N,'uint16'); %primeiro escrevemos o N
    fwrite(fp,M,'uint16'); %e depois é que escrevemos o M
    fwrite(fp,Stream,'uint8'); %por ultimo escrevemos a matriz(NxM)
    fclose(fp);
end