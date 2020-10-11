load('Mensagem.mat');
%ex01/ex02
[Simbolos,Freq] = Alfabeto2(Mensagem);
% ex03

%Q-0000
%W-0001
%S-0010
%D-0011
%X-0100
%C-0101
%Z-0110
%V-0111
%R-1000

%ex04
Numbits = NumeroBits(Mensagem);
%ex06
H=Entropia(Mensagem);
%ex07

%codigo de huffman

%Q-0
%W-100
%S-101
%C-1100
%D-1101
%Z-1110
%X-11111
%R-111100
%V-111101

%TotalBits=816
%816/304=2.68 bits per symbol
