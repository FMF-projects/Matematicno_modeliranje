format long
g = 9,8;
l = 10;
tol = 10e-13;

% zacetni odmik v radianih in hitrost
zac = [pi/4; 0];

% koncni cas opazovanja
tk = 7;
t = linspace(0,tk,200);


f =  @(t,y) [y(2); -g/l*sin(y(1))];
[t, Y] = ode45(f,t,zac);










% animacija
for i = 1:length(t)
    
    x = [0 l*sin(theta(i))];
    y = [0 -l*cos(theta(i))];
    
    graf = plot(x,y,'LineWidth',5);
    axis equal
    axis([-l-1 l+1 -l-1 l+1])
end