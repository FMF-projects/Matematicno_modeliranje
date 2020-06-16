function [] = risi_brah(T1,T2)
% narise brahistohrono
% T1 moramo premakniti na (0,0)

T3 = T2 - T1;

[t, k] = isci_theta(T3);

T = linspace(0,t);
x = @(theta) 0.5 .* k.^2 .* (theta - sin(theta)) + T1(1);
y = @(theta) -0.5 .* k.^2 .* (1 - cos(theta)) + T1(2);

X = x(T);
Y = y(T);

plot(X,Y)
grid on

% vrednost abscise to?ke P, v kateri je
% tangenta na b enaka -1
syms theta
dx_sym = diff(x,theta);
dy_sym = diff(y,theta);

dx = matlabFunction(dx_sym);
dy = matlabFunction(dy_sym);

koef = @(theta) dy(theta)/dx(theta);
f = @(theta) koef(theta) + 3/4;
Pt = fsolve(f,2); % to je samo vrednost parametra
%Px = x(Pt);
Py = y(Pt);

% abscisa tocke R, da sta dolzini lokov A1R in RA2 2:1
dx = @(theta) 0.5 .* k.^2 .* (1 - cos(theta));
dy = @(theta) - 0.5 .* k.^2 .* sin(theta);
s = @(theta) sqrt(dx(theta).^2 + dy(theta).^2); 
s1 = @(z) integral(s,0,z) - 2.*integral(s,z,t);
Rt = fsolve(s1,t/2);
Rx = x(Rt);

% najvecja razdalja med lokom in daljico A1A2
p = polyfit([T1(1) T2(1)],[T1(2) T2(2)],1);
d = @(fi) (-1)*sqrt((x(fi) - sin(fi))^2 + (y(fi) - polyval(p,sin(fi)))^2);
dmax = fminbnd(d,0,t)
end

