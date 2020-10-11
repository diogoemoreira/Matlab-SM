%% ex 1.4
Ta = 0.01;
f0 = 1;
Np = 6;
k = [0:Ta:5]';
ak = (2*sin(pi*k)-sin(2*pi*k))/(pi*k);
bk = (-2*cos(pi*k)+cos(2*pi*k)+1)/(pi*k);
[t,xt] = SerieDeFourier(Ta,f0,Np,ak,bk);    %Ta,f0,Np -> escalares ; ak,bk -> vetores(K*1)
