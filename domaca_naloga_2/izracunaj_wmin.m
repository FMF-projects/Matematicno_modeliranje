function [vrednost] = izracunaj_wmin(a,A,b,B,l)

T1 = [a A];
T2 = [b B];

z0 = 1;
tol = 1e-10;
z = isci_z(T1,T2,l,z0,tol);

v = atanh((B-A)/l) + z;
u = atanh((B-A)/l) - z;

C = (b-a)/(v-u);
D = (a*v - b*u)/(v-u);

lambda = A - C*cosh((a-D)/C);
w = @(x) lambda + C .* cosh((x-D)./C);
vrednost = w(D);
end

