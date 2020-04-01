% f = 1
f = @(r) ones(size(r));
R = 1;
n = 100;

[r,u]=poves_opne(f,R,n);
plot(r, u)
title('$$f(r) = 1$$','interpreter','latex','fontsize',15)

figure
polar3d(flipud(u)*ones(1, 100), 0, 2*pi, 0, R, 0.5);

% f = 1 - r^2
f = @(r) 1-r.^2;
R = 1;
n = 100;
[r,u]=poves_opne(f,R,n);

figure 
plot(r, u)
title('$$f(r) = 1-r^2$$','interpreter','latex','fontsize',15)

figure
polar3d(flipud(u)*ones(1, 100), 0, 2*pi, 0, R, 0.5);


