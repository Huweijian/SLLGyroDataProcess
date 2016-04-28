clear;
load('data2.mat');
time = m(:, 1);
speed = m(:, 2:5);

a1 = 

for j = 1:4
    for i=1 + 1 :length(m) - 1
       tem = abs( speed(i-1, j) + speed(i+1, j));
       if abs( speed(i,j))  > tem
           speed(i, j) = tem /2;
       end
    end
   speed(:, j) = medfilt1( speed(:, j), 11);
%    plot(1:10001, tem,'k',1:10001, speed(:, j),'r');
end

for i=1:length(speed)
    
