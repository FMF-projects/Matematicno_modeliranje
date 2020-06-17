% veriznica
b = 45;
l = 16;
T1 = [1 5];
T2 = [4 3+b/100];

T3 = [1 4];
T4 = [4 5+b/100];

tol = 1e-10;

% 1.naloga
min1 = ver_ymin(T1,T2,l,tol);
min2 = ver_ymin(T3,T4,l,tol);

%o1 = norm(min1 - min2);

% 2.naloga
p = @(x) izracunaj_ver(T1,T2,l,x,tol) - izracunaj_ver(T3,T4,l,x,tol);
Px = fsolve(p,2);
Py = izracunaj_ver(T1,T2,l,Px,tol);

% 3.naloga
s1 = @(x) izracunaj_ver(T1,T2,l,x,tol);
s2 = @(x) izracunaj_ver(T3,T4,l,x,tol);
s3 = @(x) abs(s2(x) - s1(x));
s4 = @(x) abs(s1(x) - s2(x));
S = integral(s3,T1(1),Px) + integral(s4,Px,T2(1));

% 4.naloga
d = @(x) sqrt(1 + (odvod_ver(T1,T2,T3,T4,l,x,tol)).^2);
D = integral(d,T1(1),T2(1));




% bezierjeve krivulje
c = 2;
bC = [0 1 3+c/100 4; 1 2 2 -1];


% 2.naloga
tangenta = bezier_der(bC,0.6);
premica = [1 3/2];
%coskot = dot(tangenta,premica) / (norm(tangenta) * norm(premica));
%kot = acos(coskot);

% 1.naloga
norm = @(t) bezier_normala_x(bC,t) - bezier_normala_y(bC,t);
norm1 = @(t) bezier_der(bezier_der(bC,t),t)

iskani_t = fsolve(norm,0.4)

bezier_normala(bC,iskani_t);


% 3.naloga
dolzinaB = dolzina(bC);


% 4.naloga
b1 = [1 2];
b2 = [3+c/100 2];
p1 = norm(b1 - b2);
p2 = @(t) norm(b1 - deCasteljau(bC,t));
p3 = @(t) norm(b2 - deCasteljau(bC,t));
ss = @(t) 0.5 .* (p1 + p2(t) + p3(t));

%SS = @(t) sqrt(ss(t).*(ss(t)-p1).*(ss(t)-p2(t)).*(ss(t)-p3(t)));
%SSmin = fminsearch(SS, 0.4)






