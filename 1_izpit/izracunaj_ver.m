function W = izracunaj_ver(T1,T2,l,x,tol)
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
W = w(x);
end

