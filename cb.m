%%
function cb(s, BytesAvailable)
    global t;
    global x;
    global m;
    global ii;
    global Sx  Sy  Sr;
    div = 5;
    showGyro = 0;
    showSpeed = 0;
    saveLog = 0;
    isShowCurve = 1;
    xmid = 0;
    ymid = 0;
    xwide = 5000;
    ywide = 5000;
    
    
    a = fread(s, 25)';
    gx = char2short(a(7), a(8));
    gy = char2short(a(9), a(10));
    gz = char2short(a(11), a(12));
    ax = char2short(a(3), a(4));
    ay = char2short(a(5), a(6));
    az = char2short(a(23), a(24));
    v1 = char2short(a(13), a(14));
	v2 = char2short(a(15), a(16));
    v3 = char2short(a(17), a(18));
    v4 = char2short(a(19), a(20));
    
    time = a(21) + a(22) * 2^8;
    sp = [v1, v2, v3, v4] / 128 / 74.037 * 1000; % mm
    acc = [ax, ay, az] / 32768 * 16;
    gyro = [gx, gy, gz] / 32768 * 2000;
    tem = [time, sp, acc, gyro];
    
    if max(abs(sp - m(end, 2:5))) > 2000
        return;
    end
    
    v2s(sp, time);
    
    m = [m; tem];
    t = [t ii];
    if saveLog &&  length(t)> 10000
        cl;
    end
    x = x + 1;
    if mod(x, div) ~= 0
        return 
    end
    ii=ii+1;
    
    if showGyro == 1
        xx = x / div;
        subplot(121);
        plot(t, m(:, 9:11));
        axis([xx-70 xx+70 -2 2]);
    end
    if showSpeed == 1
        xx = x / div;
        subplot(122)
        plot(t, m(:, 2:5));
        axis([xx-70 xx+70 -15000 15000]);
    end
    
    if isShowCurve && mod(ii, div) == 0;
        hold on;
        plot(Sy, Sx, '*');
        axis([xmid - xwide xmid + xwide ymid - ywide ymid + ywide])
%         [Sx, Sy]
    end;
    
end

