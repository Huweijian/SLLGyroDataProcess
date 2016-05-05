function [] = v2s( B, time )
%V2S Summary of this function goes here
%   Detailed explanation goes here
global A timeOld Sx Sy Sr;
rCar = 82;%79;
% B = B/ 128 / 74.037 * 1000;

    X = A \ (B');
    tm = mod((time - timeOld + 65535), 65535) / 1000; % second
    if timeOld == -1
        timeOld = time;
        return ;
    end;
        
    timeOld = time;
    sx = X(1) * tm; % mm
    sy = X(2) * tm; 
    sr = X(3) * tm / rCar; % rad
    
    Sx = Sx + sx * cos(Sr) + sy * sin(Sr);
    Sy = Sy + sx * sin(Sr) + sy * cos(Sr);
    Sr = Sr + sr;
    Sr = mod(Sr + 2*pi, 2*pi);
%     [Sx Sy]
end

