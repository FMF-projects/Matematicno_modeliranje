function animacija(X,Y)
% ANIMACIJA prikaze, kako se spremeni oblika 
% diskretne simetricne veriznice z liho mnogo 
% cleni, ko vse clene razpolovimo.
% 
% X ... koordinate krajisc palic pred razpolovitvijo
% Y ... koordinate krajisc palic po razpolovitvi
% length(Y) = 2 * length(X)

% Seznamu X dodamo koordinate sredisc vseh palic
n = size(Y,2);
S = (X(:,1:end-1) + X(:,2:end)) ./ 2;
S = [S [0 0]'];
X = [X(1,:) X(2,:); S(1,:) S(2,:)];
X = X(:);
X = [X(1:n)'; X(n+2:end-1)'];

k = 100; % stevilo korakov v animaciji
Z = Y - X;
H = Z ./ k; 
for i=1:k
   W = X + i.*H;
   plot(W(1,:),W(2,:), '-o')
   grid on
   pause(.05)
end
end

