f = @(x) sin(x).*exp(sqrt(x));
g1 = @(x) cos(x);
g2 = @(x) sin(x);
k = @(x,y) (x.^2 + y.^2) / (1 + x + y);

xf = linspace(1,3,200);
xg = linspace(0,2*pi,200);
xh = linspace(0,10*pi,1000);
xk = linspace(0,1,200);
yk = linspace(0,1,200);


hold on
axis equal
plot(xf,f(xf));
plot(g1(xg), g2(xg));
hold off


figure
plot3(g1(xh), g2(xh), xh);


[X,Y] = meshgrid(xk,yk);
Z = k(xk,yk);
surf(X,Y,Z);
