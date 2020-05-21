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


% cas potovanja kroglice po brah
g = 9.8;
time_brah = k / sqrt(2*g) * t;

% vrednost abscise to?ke P, v kateri je
% tangenta na b enaka -1
syms theta
dx_sym = diff(x,theta);
dy_sym = diff(y,theta);

dx = matlabFunction(dx_sym);
dy = matlabFunction(dy_sym);

koef = @(theta) dy(theta)/dx(theta);
f = @(theta) koef(theta) + 1;
Pt = fsolve(f,2); % to je samo vrednost parametra
Px = x(Pt);

% ploscina trikotnika, ki ga omejujejo tangenta v P
% in koordinatni osi
koeficient = koef(Pt);
Py = y(Pt);

p1 = polyfit([Px Px+1],[Py Py+koeficient],1);
p2 = polyfit([0 1],[0 0],1);

x_intersect = fzero(@(x) polyval(p1-p2,x),3);
ploscina = diff(polyval(polyint(p1),[0 x_intersect]));






% cas potovanja kroglice po premici
% formula velja za T1=[0 0]
b = T2(1) - T1(1);
B = T2(2) - T1(2);
time_premica = sqrt(2*(b^2 + B^2) / (-g*B));


% pri katerem x doseze brah najnizjo tocko
t_min = fminbnd(y,0,t);
x_min = x(t_min);

% dolzina loka
dx = @(theta) 0.5 .* k.^2 .* (1 - cos(theta));
dy = @(theta) - 0.5 .* k.^2 .* sin(theta);

s = @(theta) sqrt(dx(theta).^2 + dy(theta).^2); 
dolzina = integral(s,0,t);
end

