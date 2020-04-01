f = @(x) sin(x) .* exp(sqrt(x));
g1 = @(x) cos(x);
g2 = @(x) sin(x);
h3 = @(x) x;
k = @(x,y) (x.^2 + y.^2) ./ (1 + x + y);

t1 = linspace(1,3,300);
%plot(t1,f(t1))

t2 = linspace(0,2*pi,300);
%plot(g1(t2),g2(t2))

t3 = linspace(0,10*pi,500);
%plot3(g1(t3),g2(t3),h3(t3))

[X,Y] = meshgrid(0:0.01:1, 0:0.01:1);
surf(X,Y,k(X,Y))

grid on
axis equal
