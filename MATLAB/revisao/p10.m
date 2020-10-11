%ex01
[Image,ColorMap]=imread('Parede_8bit.bmp');
figure(001);
image(Image);
colormap(ColorMap);
%ex02
Save8bitImage('texto.txt',Image);
%ex03
[N,M,Im]=Load8bitImage('texto.txt');
figure(002);
image(Im);
colormap(ColorMap);
%colormap(ColorMap);
%ex04
Stream=EncodeImage_RLE(Image);
%ex05
Save8bitStream('texto2.txt',N,M,Stream);
%ex06
[N2,M2,Stream2]=Load8bitStream('texto2.txt');
%ex07 
[Im2]=DecodeImage_RLE(N2,M2,Stream2);
figure(003);
image(Im2);
colormap(ColorMap);
%colormap(ColorMap);

%ex08
    %ex01
    [Image0,ColorMap0]=imread('Arca_8bit.bmp');
    figure(101);
    image(Image0);
    colormap(ColorMap0);
    %ex02
    Save8bitImage('texto0.txt',Image0);
    %ex03
    [N0,M0,Im0]=Load8bitImage('texto0.txt');
    figure(102);
    image(Im0);
    colormap(ColorMap0);
    %colormap(ColorMap);
    %ex04
    Stream0=EncodeImage_RLE(Image0);
    %ex05
    Save8bitStream('texto02.txt',N0,M0,Stream0);
    %ex06
    [N02,M02,Stream02]=Load8bitStream('texto02.txt');
    %ex07 
    [Im02]=DecodeImage_RLE(N02,M02,Stream02);
    figure(103);
    image(Im02);
    colormap(ColorMap0);
    %colormap(ColorMap);


function Save8bitImage(Filename,Image) %ex02.1
    fp=fopen(Filename,'wb');
    [N,M]=size(Image);
    fwrite(fp,N,'uint16'); %guarda em 16 bits = 2bytes o N
    fwrite(fp,M,'uint16'); %guarda em 16 bits = 2bytes o M
    fwrite(fp,Image,'uint8'); %guarda nos restantes bytes os valores da imagem
    fclose(fp);
end

function[N,M,Im]= Load8bitImage(Filename)%ex03.1
    fp=fopen(Filename,'rb');
    N=fread(fp,1,'uint16'); %ler os primeiros 16 bits e guarda-los em 1 valor
    M=fread(fp,1,'uint16'); %ler os proximos 16 bits e guarda-los em 1 valor
    Im=fread(fp,[N,M],'uint8'); %guardar os bits restantes numa matriz [N,M]
    Im=uint8(Im); %guardar a imagem com dimensoes corretas
    fclose(fp);
end

function [Stream] = EncodeImage_RLE(Im) %ex04.1
[N,M]=size(Im);
k=1;
Stream(k,1)=Im(1,1);
count=uint8(0); %pois no inicio do ciclo for o primeiro elemento ja vai ser igual e vamos aumentar o count pra 1
for n=1:N
    for m=1:M
        if (Im(n,m)==Stream(k,1))
            if count==255
               k=k+1;
               Stream(k,1)=count; %255 aparencias seguidas
               k=k+1;
               Stream(k,1)=Im(n,m); %colocar o mesmo simbolo pois confirmamos que Im(n,m)==Stream(k,1) no if
               count=0;
            end
            count=count+1; 
        else
            k=k+1;
            Stream(k,1)=count; %meter a contagem para o simbolo anterior
            k=k+1;
            Stream(k,1)=Im(n,m); %colocar o novo simbolo
            count=1; %iniciar a contagem para o novo simbolo
        end
    end
end
k=k+1;
Stream(k,1)=count; %terminar a contagem pro ultimo simbolo
end

function Save8bitStream(Filename,N,M,Stream)
    fp=fopen(Filename,'wb');
    fwrite(fp,N,'uint16');
    fwrite(fp,M,'uint16');
    fwrite(fp,Stream,'uint8');
    fclose(fp);
end

function [N,M,Stream] = Load8bitStream(Filename)
    fp=fopen(Filename,'rb');
    N=fread(fp,1,'uint16'); %first 16 bits have N
    M=fread(fp,1,'uint16'); %next 16 bits have M
    Stream=fread(fp); %read all the remaining bytes
    Stream=uint8(Stream);
    fclose(fp);
end

function [Im] = DecodeImage_RLE(N,M,Stream)
    Im = zeros(N,M);
    k=1; %posicao
    newSymb=1; %variavel de controlo do simbolo
    count=0; %numero de simbolos
    
    for n=1:N
        for m=1:M
            if newSymb==1 %if it is 1 then its a new Symb and we must addd it
               count=Stream(k+1); %contagem do simbolo
               newSymb=0; %significa que tamos a adicionar o simbolo
             end
            Im(n,m)=Stream(k);
            count=count-1;
            if count==0
                %entao é pq ja acabamos de adicionar o simbolo atual e
                %vamos para um novo
                newSymb=1;
                k=k+2; %avancar para o novo simbolo em k temos o simbolo e em k+1 a contagem dele
            end
        end
    end
    Im=uint8(Im);
end