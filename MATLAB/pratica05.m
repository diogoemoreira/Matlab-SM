% sinc(x) = sin(pi*x)/pi*x
%% 01
Ta = 0.2;
t = [0:Ta:(5-Ta)]';
x = sin(2*pi*t);
figure(101);
ReconstroiSinal(x,Ta);

%% 03
Im = imread('Parede.jpg');
%Im(:,:,1) % -> Red
%Im(:,:,2) % -> Green
%Im(:,:,3) % -> Blue
[a,b,c] = size(Im);
jump = 2;
NewIm = Im(1:jump:end,1:jump:end,:);
image(NewIm);

%% 02 a
Ta = 0.01;
x1 = [0:Ta:5];
x2 = x1';
y = zeros(length(x1),length(x2));
for n=1:length(x1)
    y(n,:) = cos(2*pi*(x1(n) - 2*x2));
end
mesh(x1,x2,y); axis equal;

%% 02 b
Ta = 0.01;
x1 = [-5:Ta:5];
x2 = x1';
y = zeros(length(x1),length(x2));
for n=1:length(x1)
    y(n,:) = cos(2*pi*sqrt(x1(n)^2 + x2.^2));
end
mesh(x1,x2,y); view(2); axis equal;