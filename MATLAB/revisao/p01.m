
%% ex01a
Ta = 0.01;
t = 0:0.01:5;
xt = 2*sin(4*pi*t)
plot(t,xt);
%% ex01b
Ta = 0.01;
t = 0:0.01:5;
yt = cos(10*pi*t);
plot(t,yt);
%% ex01c
Ta = 0.01;
t = 0:0.01:5;
xt = 2*sin(4*pi*t);
yt = cos(10*pi*t);
zt = xt'*yt;
plot(t,zt);
%% ex01d
Ta = 0.01;
t = 0:0.01:10;
wt = 3*sin(pi*t)+2*sin(6*pi*t);
plot(t,wt);
%% ex01e
Ta = 0.01;
t = 0:0.01:5;
qt = 2*sin(2*pi*(2*t+t'));
mesh(t,t',qt);

%% ex02
% é so usar o hold on e dps fazer os 3 plots ...

%% ex03
% ... inutil

%% ex04
Ta = 0.01;
t = 0:Ta:5;
qt = 2*sin(2*pi*(2*t+t'));
mesh(t,t',qt);
colormap('gray');

%% ex05
Ta = 1/25;
t = 0:Ta:5;
x1 = [-5:Ta:5]';
x2 = x1';
for k = 1:length(t)
    tic;
    r= 2*sin(2*pi*sqrt(x1.^2+x2.^2)-2*pi*t(k));
    mesh(x1,x2,r);drawnow;
    pause(Ta-toc);
end
