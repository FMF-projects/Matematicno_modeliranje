bC = [0 1 2 3 4 2 1.5 1; 0 2 -1 1 3 2 1 0];
plotBezier(bC)

% Nasvet: ce boste uporabljali metode fsolve, 
% fminsearch ipd., uporabite nastavitev 
% optimset('TolFun',1e-16), da bodo izracuni, 
% kar se da natancni.

options = optimoptions(@fsolve,'TolFun',1e-16);

t = linspace(0,1,100);
B = zeros(2,length(t));
V = zeros(2,length(t));
for i = 1:length(t)
    B(:,i) = deCasteljau(bC,t(i));
    V(:,i) = bezier_der(bC,t(i));
end


% 1.vprasanje: Krivuljo bk dobite iz b tako, 
% da krivuljo b ustrezno zavrtite in vzporedno 
% premaknete, da velja b(0)=bk(10) in b(1)=bk(0). 
% Koliksna je vrednost ?bk(1/3)?2?
b0 = deCasteljau(bC,0);
b1 = deCasteljau(bC,1);

% premik
premik = b1;
bk = premakni_bezier(bC,premik);
% rotacija
R = @(fi) [cos(fi) -sin(fi); sin(fi) cos(fi)];
f = @(fi) R(fi)*b1 - b0 + premik; % upostevati moramo koordinato pred premikom
fi = fsolve(f,1,options);
bk = rotiraj_bezier(bk,fi);

norma = norm(deCasteljau(bk,1/3));

% 2.vprasanje: Krivuljo b pri samopreseciscu razdelimo 
% na 3 manjse Bezierjeve krivulje, ki jih oznacimo 
% zaporedoma z b1,b2,b3. Dolocite vse 3 krivulje. 
% Koliksna je vrednost ||b2(1/3)||_2, ce je b2 
% parametrizirana z lokalnim parametrom na intervalu [0,1]?

% poiscemo samopresecisce


% 3.vprasanje: Koliksna je dolzina krivulje b?
y = bC(2,4);
d = dolzina(bC,y);


% 4.vprasanje: Koliksna je x-komponenta tezisca krivulje b?
s = @(t) sqrt(sum(bezier_der(bC,t).^2));
fx = @(t) deCasteljau_x(bC,t) .* s(t);

Tx = integral(fx,0,1) / d;



% 5.vprasanje: Ordinato cetrte kontrolne tocke 
% krivulje b dolocite tako, da bo dolzina krivulje
% b cim manjsa. Koliksna je dolzina optimalne krivulje b? 
f = @(y) dolzina(bC,y);
y5 = fminsearch(f,1);

c = bC;
dol = dolzina(c,y5);



