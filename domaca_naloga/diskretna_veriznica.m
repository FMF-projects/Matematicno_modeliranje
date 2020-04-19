b = 37;
A = [0 0];
B = [3 0];

M = [2 + b/100, 3.4, 0.8, 1 + b/100, 0.6, 3.1];
L = [1 1 1 1 1 1];

W = [-1 -1];
zac = [A(1) B(1); A(2) B(2)];
X = ver_uv(W,zac,L,M);

plot(X(1,:),X(2,:))
grid on
hold on

% vsota koordinat najnizje tocke
[y_min, id] = min(X(2,:));
vsota_1 = y_min + X(1,id);

% vsota koordinat presecisca daljic AK5 in K1B
K1 = X(:,2);
K5 = X(:,6);
y1 = polyfit([A(1) K5(1)], [A(2) K5(2)], 1);
y2 = polyfit([B(1) K1(1)], [B(2) K1(2)], 1);

Px = fzero(@(x) polyval(y1-y2,x),3);
Py = polyval(y1,Px);

plot([A(1) K5(1)], [A(2) K5(2)])
plot([B(1) K1(1)], [B(2) K1(2)])
hold off

vsota_2 = Px + Py;


% dolzina zadnjega clenka, da bo tretji
% clenek vzporeden z abscisno osjo
f = @(l) dolzina_zadnjega(l,W,zac,L,M);
dolzina = fzero(f,1);

L1 = [L(1:5) dolzina];
%risi_veriznica(zac,L1,M)


% abscisa, da dobimo 2 enaki ploscini
% ce prerezemo dobljeni veckotnik
S = @(x) ploscini(x,X);
x0 = (A(1) + B(1)) / 2;
abscisa = fzero(S,x0);

