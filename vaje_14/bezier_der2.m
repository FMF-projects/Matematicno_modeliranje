function v = bezier_der2(b,t)
% ODVOD_BEZIER izracuna drugi odvod na Bezierovo 
% krivuljo pri parametru t. Stolpci matrike b so 
% kontrolne tocke Bezierove krivulje.

% izracunamo delte za b_i
n = size(b,2)-1;
delta = [];
for i=1:n
   d = b(:,i+1) - b(:,i);
   delta = [delta d];
end

m = size(b,2)-2;
delta2 = [];
for i=1:m
   d = delta(:,i+1) - delta(:,i);
   delta2 = [delta2 d];
end

% sedaj uporabimo deCaste... in pomnozimo z n in m
v = n * m * deCasteljau(delta2,t);
end

