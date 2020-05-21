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
plot(X,w(X));
grid on


% KVIZ O ZVEZNI VERIZNICI
% Homogeno vrv dol�ine 20 na levem koncu 
% obesimo v tocko T0(0,5), na desnem pa v 
% tocko T1(5,3).Odgovorite na naslednja 
% vpra�anja. 

% kviz 1 vprasanje
% Pri x=2 je ordinata tocke na vrvi enaka y=
w(2); 

% kviz 2.vprasanje
% Vrv dose�e najni�jo tocko pri x=
wdx = @(x) sinh((x-D)./C);
xmin = fsolve(wdx,2);

% kviz 3.vprasanje
% Premica y=x preseka vrv pri y=
g = @(x) w(x) - x;
xp1 = fsolve(g,1);
yp1 = w(xp1);

% kviz 4.vprasanje
% Kolik�na je dol�ina dalj�ega dela vrvi, 
% ki nastane, ko jo prepre�emo s premico y=4 ?
h = @(x) w(x) - 4;
xp2 = fsolve(h,1);
s = @(x) sqrt(1 + (wdx(x)).^2);
dolzina = integral(s,xp2,5);

% kviz 5.vprasanje
% Kolik�na bi morala biti ordinata tocke T1, 
% da bi bila najni�ja tocka vrvi pri x=2.5?

% v x=D je ravno minimum funkcije w
k = @(x) izracunaj_D(a,A,b,x,l);
m = @(x) k(x) - 2.5;
B2 = fsolve(m,3);


% DOMACA NALOGA 2: ZVEZNA VERIZNICA
% b=61,l=16,T1=(1,2),T2=(5+b/100,2)

% 1.vprasanje: Dolocite absciso tocke P na veri�nici w, 
% da bosta dol�ini lokov T1P in PT2 v razmerju 2:1. 
s = @(x) sqrt(1 + (wdx(x)).^2);
dolzina1 = @(x) integral(s,a,x);
dolzina2 = @(x) integral(s,x,b);
f = @(x) dolzina1(x) - 2*dolzina2(x);
Px = fzero(f,3);

% 2. vprasanje: Izra?unajte razdaljo med najni�jo tocko na 
% krivulji in njenim te�i�?em.
fx = @(x) x.*s(x);
fy = @(x) w(x).*s(x);
Tx = integral(fx,a,b) / integral(s,a,b);
Ty = integral(fy,a,b) / integral(s,a,b);
% v x=D je ravno minimum funkcije w
razdaljaT = norm([Tx-D Ty-w(D)]);

% 3. vprasanje: Dana je premica x+y?1=0. 
% Kolik�na je razdalja med preseci�cema premice in veri�nice w.
e = @(x) w(x) - 1 + x;
PX = fsolve(e,[1 5]);
razdaljaP = norm([PX(1)-PX(2) w(PX(1))-w(PX(2))]);

% 4. vprasanje: Kolik�na naj bo dol�ina vrvice ?, 
% da bo najni�ja to?ka veri�nice le�ala na abscisni osi?
l_funk = @(x) izracunaj_wmin(a,A,b,B,x);
dolzinaL = fsolve(l_funk,10);
end

