function [w] = zvezna_ver(T1,T2,l,tol)
% izracuna in narise zvezno veriznico. Pri tem so:
% T1 in T2 sta krajisci veriznice oblike T1(a,A) in
% T2(b,B),
% l je dolzina veriznice,
% tol je toleranca, ki doloca natancnost priblizka
% pri navadni iteraciji.

a = T1(1);
A = T1(2);
b = T2(1);
B = T2(2);

z0 = 1;
z = isci_z(T1,T2,l,z0,tol);

v = atanh((B-A)/l) + z;
u = atanh((B-A)/l) - z;

C = (b-a)/(v-u);
D = (a*v - b*u)/(v-u);

lambda = A - C*cosh((a-D)/C);

w = @(x) lambda + C .* cosh((x-D)./C);

X = linspace(a,b);
hold on
plot(X,w(X));
grid on


% 2.kviz
% ukrivljenost v tocki x=2
dx = 1;
ddx = 0;
dy = @(x) sinh((x-D)./C);
ddy = @(x) cosh((x-D)./C) ./ C;
kappa = (dx*ddy(2) - dy(2)*ddx)/(dx^2 + dy(2)^2)^(3/2);

% cas potovanja po veriznici
%formula velja za T1=[0 0]
g = 9.8;
b = T2(1) - T1(1);
B = T2(2) - T1(2);
time_parabola = @(x) sqrt((1+(4*B)/(b^4)*(x-b)^2/(-2*g(-B/b^2*(x-b)^2 + B))))

% tangente na veriznico
koef = @(t) dy(t);
k1 = koef(a);
k2 = koef(b);
p1 = polyfit([a a+1],[A A+k1],1);
p2 = polyfit([b b-1],[B B-k2],1);

tt = linspace(a,b,100);
plot(tt,polyval(p1,t));
plot(tt,polyval(p2,t));
hold off

Px = fzero(@(x) polyval((p1-p2),x),2);
Py = polyval(p1,Px);

S1 = integral(w,a,b)
S2 = 0.5*(4*abs(B))
at = norm(T1 - [Px Py]);
bt = norm(T1 - T2);
ct = norm(T2 - [Px Py]);
s = 0.5 * (at + bt + ct);
S3 = sqrt(s*(s-at)*(s-bt)*(s-ct))
S = S2 + S3 - abs(S1)
end

