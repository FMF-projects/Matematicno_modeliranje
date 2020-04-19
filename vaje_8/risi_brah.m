function [] = risi_brah(T1,T2)
% narise brahistohrono
% T1 moramo premakniti na (0,0)

T3 = T2 - T1;

[t, k] = isci_theta(T3);

theta = linspace(0,t);
x = @(theta) 0.5 .* k.^2 .* (theta - sin(theta)) + T1(1);
y = @(theta) -0.5 .* k.^2 .* (1 - cos(theta)) + T1(2);

X = x(theta);
Y = y(theta);

plot(X,Y)
grid on


% cas potovanja kroglice po brah
g = 9,81;
tb = k / sqrt(2*g) * t;

% cas potovanja kroglice po premici
% formula velja za T1=[0 0]
b = T2(1) - T1(1);
B = T2(2) - T1(2);
tp = sqrt(2*(b^2 + B^2) / (-g*B));


% pri katerem x doseze brah najnizjo tocko
t_min = fminbnd(y,0,t);
x_min = x(t_min);

% dolzina loka
dx = @(theta) 0.5 .* k.^2 .* (1 - cos(theta));
dy = @(theta) - 0.5 .* k.^2 .* sin(theta);

s = @(theta) sqrt(dx(theta).^2 + dy(theta).^2); 
dolzina = integral(s,0,t);
end

