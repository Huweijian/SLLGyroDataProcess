function[] = mDrawCar(x, y, theta)

angleFlat = 50;
radius = 0.5;


xx = [];
yy = [];
for i=theta + angleFlat:10:theta + 360 - angleFlat
    xx = [xx, x + radius * cos(i/360*2*pi)];
    yy = [yy, y + radius * sin(i/360*2*pi)];
end
xx = [xx, xx(1)];
yy = [yy, yy(1)];
plot(xx, yy);
hold on;
plot(x, y, '*');
xxx = [x, x + 2*radius * cos(theta/360*2*pi)];
yyy = [y, y + 2*radius * sin(theta/360*2*pi)];
plot(xxx, yyy);

axis([0 20 0 20]);
set(gcf,'position', [300, 300, 500, 500]);