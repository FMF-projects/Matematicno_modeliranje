function v = bezier_der(b,t)
% ODVOD_BEZIER izracuna tangentni vektor na Bezierovo 
% krivuljo pri parametru t. Stolpci matrike b so 
% kontrolne tocke Bezierove krivulje.

% izracunamo delte za b_i
n = size(b,2)-1;
delta = [];
for i=1:n
   d = b(:,i+1) - b(:,i);
   delta = [delta d];
end

% sedaj uporabimo deCaste... in pomnozimo z n
v = n * deCasteljau(delta,t);
end

