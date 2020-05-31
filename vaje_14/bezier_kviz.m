c = [0 1 2 4; 0 -1 -1 2];
plotBezier(c);

% 1. abscisa tocke c(0.5)?
T = deCasteljau(c,0.5);
o1 = T(1);

% 2. vrednost ||c_t(0.5)||_2
v = bezier_der(c,0.5);
V = deCasteljau(v,0.5);
o2 = norm(V);

% 3. oddaljenost tocke c(0.5) od izhodisca
o3 = norm(T);

% 4. ukrivljenost krivulje c v c(0.5)
vv = bezier_der2(c,0.5);
VV = deCasteljau(vv,0.5);
kappa = norm((V(1).*VV(2) + VV(1).*V(2)) ./ (sqrt(V(1).^2 + V(2).^2)).^3);
o4 = kappa;

%n = size(c,2);
%cc = zeros(2,n-1);
%t = linspace(0,1);
%for i=1:n-1
%    cc(:,i) = bezier_der(c,t)';
%end
%vvv = bezier_der(cc,0.5);
%VVV = deCasteljau(vvv,0.5);
%kappa1 = norm((V(1).*VVV(2) + VVV(1).*V(2)) ./ (sqrt(V(1).^2 + V(2).^2)).^3);
%o42 = kappa1;

% 5. en korak subdivizije na c s parametrom 0.4
% vsota ordinat kontrolnih tock, ki dolocajo 
% prvi del krivulje
[c1, c2] = sub_demo(c,0.4);
o5 = sum(c1(2,:));

% 6. abscisa presecisca c s premico y=1-x?


% 8. za kateri t bo tangetni vektor vzporeden z x-osjo
f = @(t) bezier_der_y(c,t);
t8 = fsolve(f,0.5);
o8 = t8;

% 9. razdalje tocke A(2,0.5) do krivulje c?
A = [2 0.5];
t = linspace(0,1,100000);
R = [];
for i = 1:length(t)
    D = deCasteljau(c,t(i));
    r_do_A = sqrt((D(1)-A(1)).^2 + (D(2)-A(2)).^2);
    R = [R r_do_A];
end
o9 = min(R);



