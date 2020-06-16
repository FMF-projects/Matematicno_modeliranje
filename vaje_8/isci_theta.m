function [theta, k] = isci_theta(T2)
% doloci theta

b = T2(1);
B = T2(2);
f = @(x) 1 - cos(x) + B/b .* (x - sin(x)); %stran 2

theta = fzero(f,1);

k = sqrt(2*b / (theta - sin(theta))); %stran 3
end

