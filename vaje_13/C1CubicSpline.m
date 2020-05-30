function b = C1CubicSpline(u,p,v)
% C1CUBICSPLINE izracuna kontrolne tocke C^1 
% kubicnega zlepka,ki interpolira dane tocke in 
% pripadajoce tangentne vektorje.
% u je vektor delilnih tock (vozlov),
% p je matrika interpolacijskih tock,
% v je matrika tangentnih vektorjev v sticnih tockah

n = length(u)-1;
b = zeros(2,3*n+1);
for i=1:n
    b(:,3*i-2) = p(:,i);
    b(:,3*i+1) = p(:,i+1);
    
    b(:,3*i-1) = b(:,3*i-2) + 1/3*(u(i+1)-u(i))*v(:,i);
    b(:,3*i) = b(:,3*i+1) - 1/3*(u(i+1)-u(i))*v(:,i+1);

    % narisemo odsek Bezierove krivulje
    hold on;
    plotBezier(b(:,3*i-2:3*i+1));
end
end

