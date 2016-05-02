%%
function cb(s, BytesAvailable, p)
    global t;
    global x;
    global m;
    global ii;
    

    div = 5;
    showGyro = 0;
    showSpeed = 1;
    
    a = fread(s, 25)';
    
    ax = char2short(a(7), a(8));
    ay = char2short(a(9), a(10));
    az = char2short(a(11), a(12));
    v1 = char2short(a(13), a(14));
	v2 = char2short(a(15), a(16));
    v3 = char2short(a(17), a(18));
    v4 = char2short(a(19), a(20));
    
    acc = [ax, ay, az]/32768 * 2000;
    sp = [v1, v2, v3, v4];
    
    tem = [acc, sp];
    m = [m; tem];
    t = [t ii];
    if(length(t) > 1000)
        t = t(501:1000);
        m = m(501:1000, :);
    end;
    
    x = x + 1;
    if mod(x, div) ~= 0
        return 
    end
    xx = x / div;
    if showGyro == 1
        subplot(211);
        plot(t, m(:, 1:3));
        axis([xx-70 xx+70 -500 500]);
    end
    if showSpeed == 1
        subplot(212)
        plot(t, m(:, 4:7));
        axis([xx-70 xx+70 -15000 15000]);
    end
    
    ii=ii+1;
end

