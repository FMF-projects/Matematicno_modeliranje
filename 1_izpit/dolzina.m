function D = dolzina(b)

s = @(t) sqrt(sum(bezier_der(b,t).^2));
D = integral(s,0,1);
end

