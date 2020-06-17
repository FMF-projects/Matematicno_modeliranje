function N = bezier_normala_x(b,t)
% ODVOD_BEZIER izracuna tangentni vektor na Bezierovo 
% krivuljo pri parametru t. Stolpci matrike b so 
% kontrolne tocke Bezierove krivulje.

% izracunamo delte za b_i
n = size(b,2)-1;
delta = zeros(2,n);
for i=1:n
   delta(:,i) = b(:,i+1) - b(:,i);
end

% sedaj uporabimo deCaste... in pomnozimo z n
% ce je t slucajno vektor...
m = length(t);
V = zeros(2,m);
for i=1:m
    V(:,i) = n .* deCasteljau(delta,t(i));
end

N = zeros(1,m);
N(1,:) = V(1,:);
%N(2,:) = -1./V(2,:);
end

