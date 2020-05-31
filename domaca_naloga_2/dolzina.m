function D = dolzina(b,y)

% ordinata cetrte kontrolne tocke
b(2,4) = y;

s = @(t) sqrt(sum(bezier_der(b,t).^2));
D = integral(s,0,1);
end

