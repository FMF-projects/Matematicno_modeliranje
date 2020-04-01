function [] = cvet(a,b,n)
%narise cvet iz rotiranih elips

kot = 2*pi/n;
t = linspace(0,2*pi,100);

X = @(x) a * cos(x);
Y = @(x) b * sin(x);

hold on
for i=1:n
    fi = kot * i;
    A = X(t).*cos(fi) - Y(t).*sin(fi);
    B = X(t).*sin(fi) + Y(t).*cos(fi);
    plot(A,B)
end
hold off
axis equal
end

