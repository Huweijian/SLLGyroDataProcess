clear;

clImage = 0;

load('data_quite.mat');
m = m(2:length(m), :);
time = m(:, 1);
speed = m(:, 2:5);
acc = m(:, 6:8);
gyro = m(:, 9:11);

set(gcf,'position', [150, 150, 500, 500]);
div = 5;
rWheel = 56.5/2;
speed = speed / 128 / 74.037 * 1000  ;  %mm/s 

cWheel = 2*pi*rWheel;


a1 = 55;
a2 = -55;
a3 = -128;
a4 = 128;
A = [   sind(a1), cosd(a1), 1;
        sind(a2), cosd(a2), 1;
        sind(a3), cosd(a3), 1;
        sind(a4), cosd(a4), 1];
ang = [a1, a2, a3, a4];

for j = 1:4
    for i=1 + 1 :length(speed) - 1
       tem = abs( speed(i-1, j) + speed(i+1, j));
       if abs( speed(i,j))  > tem
           speed(i, j) = tem /2;
       end
    end
   speed(:, j) = medfilt1( speed(:, j), 11);
%    plot(1:10001, tem,'k',1:10001, speed(:, j),'r');
end

Sx = 0;
Sy = 0;
Sr = 0;
for i=1:length(speed) - 1
    vx = 0;
    vy = 0;
    vr = 0;
    B = [speed(i,1); speed(i,2); speed(i,3); speed(i,4)];
    X = A \ B;
    tm = mod((time(i+1) - time(i) + 65535), 65535) / 1000; % second
    sx = X(1) * tm; % mm
    sy = X(2) * tm; 
    sr = X(3) * tm / rCar; % rad
    
    Sx = Sx + sx * cos(Sr) + sy * sin(Sr);
    Sy = Sy + sx * sin(Sr) + sy * cos(Sr);
    Sr = Sr + sr;
    Sr = mod(Sr + 2*pi, 2*pi);
%     [sx sy sr]
%     h = mDrawCar(Sx, Sy, Sr);
    hold on;
    if mod(i, div) == 0
        h = plot(Sx, Sy);
    end;
    axis([-7000 1000 -4000 4000]);
    if clImage && mod(i, clImage) == 0
        cla(h);
    end
    pause(0.001);
end
    
    
    
