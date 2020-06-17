function risi_ver(T1,T2,l,tol)
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


% KVIZ O ZVEZNI VERIZNICI
% Homogeno vrv dolžine 20 na levem koncu 
% obesimo v to?ko T0(0,5), na desnem pa v 
% to?ko T1(5,3).Odgovorite na naslednja 
% vprašanja. 

% kviz 1 vprasanje
% Pri x=2 je ordinata to?ke na vrvi enaka y=
w(2); 

% kviz 2.vprasanje
% Vrv doseže najnižjo to?ko pri x=
wdx = @(x) sinh((x-D)./C);
xmin = fsolve(wdx,2);
ymin = w(xmin);

% kviz 3.vprasanje
% Premica y=x preseka vrv pri y=
g = @(x) w(x) - x;
xp1 = fsolve(g,1);
yp1 = w(xp1);

% kviz 4.vprasanje
% Kolikšna je dolžina daljšega dela vrvi, 
% ki nastane, ko jo preprežemo s premico y=4 ?
h = @(x) w(x) - 4;
xp2 = fsolve(h,1);
s = @(x) sqrt(1 + (wdx(x)).^2);
dolzina = integral(s,xp2,5);

% kviz 5.vprasanje
% Kolikšna bi morala biti ordinata to?ke T1, 
% da bi bila najnižja to?ka vrvi pri x=2.5?

% v x=D je ravno minimum funkcije w
%k = @(x) izracunaj_D(a,A,b,x,l);
%m = @(x) k(x) - 2.5;
%B2 = fsolve(m,3);
end

