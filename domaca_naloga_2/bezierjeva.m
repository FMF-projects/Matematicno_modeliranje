bC = [0 1 2 3 4 2 1.5 1; 0 2 -1 1 3 2 1 0];

% Nasvet: ce boste uporabljali metode fsolve, 
% fminsearch ipd., uporabite nastavitev 
% optimset('TolFun',1e-16), da bodo izracuni, 
% kar se da natancni.

options = optimoptions(@fsolve,'TolFun',1e-16);

t = linspace(0,1,10000000);
B = zeros(2,length(t));
V = zeros(2,length(t));
for i = 1:length(t)
    B(:,i) = deCasteljau(bC,t(i));
    V(:,i) = bezier_der(bC,t(i));
end

% 1.vprasanje: Krivuljo bk dobite iz b tako, 
% da krivuljo b ustrezno zavrtite in vzporedno 
% premaknete, da velja b(0)=bk(1) in b(1)=bk(0). 
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
% Koliksna je vrednost ?b2(1/3)?2, ce je b2 
% parametrizirana z lokalnim parametrom na intervalu [0,1]?

% poiskati moramo samopresecisce
[C ia ib] = unique(B','rows','stable');
i = true(size(B',1),1);
i(ia)=false;

% 3.vprasanje: Koliksna je dolzina krivulje b?
%vzela 10^7
dolzina = 0;
for i=1:size(B,2)-1
    d = sqrt((B(1,i)-B(1,i+1)).^2 + (B(2,i)-B(2,i+1)).^2);
    dolzina = dolzina + d;
end
dolzina;


% 4.vprasanje: Koliksna je x-komponenta tezisca krivulje b?
Tx = sum(B(1,:)) / length(t);





