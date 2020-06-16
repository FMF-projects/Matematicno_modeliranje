function [I] = monte_carlo1(f,a,b,N)
% aproksimira integral v mejah od a do b
% funkcije f
% metoda povprecne vrednosti

X = a + (b-a) .* rand(1,N);
F = f(X);
I = (b-a) / N * sum(F);
end

