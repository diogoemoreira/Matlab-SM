%% ex03
Ta = 0.01;
f0 = 1;
Np = 6;
for k=0:100
ak=zeros(k,1);
bk=zeros(k,1);
bk(1:2:k)=4./((1:2:k)'*pi);
[t,xt] = Fourier(Ta,f0,Np,ak,bk);
end
plot(t,xt);
grid on;
xlabel('Time(s)');
ylabel('x(t)');

%% ex05
