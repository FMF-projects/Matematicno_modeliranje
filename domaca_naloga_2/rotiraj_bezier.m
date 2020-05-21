function a = rotiraj_bezier(b,phi)
% ROTIRAJ_BEZIER rotira Bezierovo krivuljo, podano s kontrolnimi
% tockami b, za kot phi okrog prve kontrolne tocke. Izrise tudi
% zacetno in rotirano krivuljo ter oba kontrolna poligona.

% matrika rotacije
R = [cos(phi) -sin(phi); sin(phi) cos(phi)];

% premaknemo v izhodisce, rotiramo in premaknemo nazaj
premik = b(:,1);
a = b - premik;
a = R*a;
a = a + premik;

% narisemo
hold on
%plotBezier(a);
%plotBezier(b);
%grid on
hold off

end

