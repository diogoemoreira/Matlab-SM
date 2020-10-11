function [xt,t] = SerieDeFourier(Ta,f0,Np,ak,bk)  %Ta,f0,Np -> escalares ; ak,bk -> vetores(K*1)
    N = round(Np/(Ta*f0));
    t = [0:(N-1)]'*Ta;
    xt = zeros(size(t));
    w0 = 2*pi*f0;
    for k= 1:length(ak)
        xt = xt + ak(k) * cos(w0*(k-1)*t) + bk(k)*sin(w0*(k-1)*t);  %temos de usar k-1 pois ak(k) comeca com k=0
    end

end