function min = ver_ymin(T1,T2,l,tol)
% RISI_VER narise zvezno veriznico. Pri tem so:
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

w = @(x) lambda + C .* cosh((x-D)./C); %(4)

X = linspace(a,b);
plot(X,w(X));
grid on

% Vrv doseže najnižjo to?ko pri x=
wdx = @(x) sinh((x-D)./C);
xmin = fsolve(wdx,2);
ymin = w(xmin);

xmin2 = izracunaj_D(a,A,b,B,l);
ymin2 = w(xmin);

min = [xmin ymin];
end


