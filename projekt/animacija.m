function animacija(X,Y)

% dodamo tocke sredisc palc
n = size(Y,2);
S = (X(:,1:end-1) + X(:,2:end)) ./ 2;
S = [S [0 0]'];
X = [X(1,:) X(2,:); S(1,:) S(2,:)];
X = X(:);
X = [X(1:n)'; X(n+2:end-1)'];

k = 100;
Z = Y - X;
H = Z ./ k;
for i=1:k
   W = X + i.*H;
   plot(W(1,:),W(2,:), '-o')
   pause(.05)
end





end

