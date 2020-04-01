function [] = cvet(a,b,n)
%narise n rotacij elipse s polosema a in b
% kot rotacija je 2*pi/n

% rotacijska matrika [cos(x) -sin(x); sin(x) cos(x)];

rot = 2*pi / n;
t = linspace(0,2*pi,200);
x = a*cos(t);
y = b*sin(t);

axis equal
hold on
plot(x,y);
for i = 1:(n-1)
    
    fi = i*rot;
    x1 = cos(fi)*x - sin(fi)*y;
    y1 = sin(fi)*x + cos(fi)*y;
    plot(x1,y1);
end
hold off

end

