f = @(x) sin(x) .* exp((x)^1/2);

X = 1:0.02:3;

v = meshgrid(f, X);
plot(v)

