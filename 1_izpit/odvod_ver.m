function Wdx = odvod_ver(T1,T2,T3,T4,l,x,tol)
% RISI_VER narise zvezno veriznico. Pri tem so:
% T1 in T2 sta krajisci veriznice oblike T1(a,A) in
% T2(b,B),
% l je dolzina veriznice,
% tol je toleranca, ki doloca natancnost priblizka
% pri navadni iteraciji.

a1 = T1(1);
A1 = T1(2);
b1 = T2(1);
B1 = T2(2);

z0 = 1;
z1 = isci_z(T1,T2,l,z0,tol);

v1 = atanh((B1-A1)/l) + z1;
u1 = atanh((B1-A1)/l) - z1;

C1 = (b1-a1)/(v1-u1);
D1 = (a1*v1 - b1*u1)/(v1-u1);

lambda1 = A1 - C1*cosh((a1-D1)/C1); 

w1 = @(x) lambda1 + C1 .* cosh((x-D1)./C1); %(4)
wdx1 = @(x) sinh((x-D1)./C1);


a2 = T3(1);
A2 = T3(2);
b2 = T4(1);
B2 = T4(2);

z2 = isci_z(T3,T4,l,z0,tol);

v2 = atanh((B2-A2)/l) + z2;
u2 = atanh((B2-A2)/l) - z2;

C2 = (b2-a2)/(v2-u2);
D2 = (a2*v2 - b2*u2)/(v2-u2);

lambda2 = A2 - C2*cosh((a2-D2)/C2); 

w2 = @(x) lambda2 + C2 .* cosh((x-D2)./C2); %(4)
wdx2 = @(x) sinh((x-D2)./C2);

if w1(x) > w2(x)
    Wdx = wdx1(x);
else
    Wdx = wdx2(x);
end
end

