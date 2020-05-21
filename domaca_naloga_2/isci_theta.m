function [theta, k] = isci_theta(T2)
% doloci theta
% predpostavka je, da je T1 = (0,0),
% T2 pa je kon?na to?ka

b = T2(1);
B = T2(2);
f = @(x) 1 - cos(x) + B/b .* (x - sin(x));

theta = fzero(f,1);

k = sqrt(2*b / (theta - sin(theta)));
end

