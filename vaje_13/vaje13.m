p1 = [3 6 9 12 6; 1 -2 4 6 -5];
v = [1 1 1 1 -1; 1 -1 -3 -1 1];
bezier_der(p1,0.5);

p2 = [1 2 3 4 2; 1 -2 4 6 -5];
% enakomerna parametrizacija
a1 = 0;
u1 = inter_tocke(a1,p2);
%C1CubicSpline(u1,p2,v);

% tetivna parametrizacija
a2 = 1; 
u2 = inter_tocke(a2,p2);
%C1CubicSpline(u2,p2,v);

% centripentalna parametrizacija
a3 = 0.5;
u3 = inter_tocke(a3,p2);
%C1CubicSpline(u3,p2,v);





