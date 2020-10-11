t = 0:0.01:5;
x = sin(pi*t+0.7);
fasex = x(1);
N = length(x);
z = zeros(N);
y = cos(2*pi);starty=1;
for k=1:N-1
   if fasex==y(k) 
       starty = k;
   end
end
z=0;
for k= starty:N
    z=z+y(k);
    if y(1)==y(k+1)
        for k=1:starty-1
            z=z+y(k);
        end
    end
end
plot(t,z);