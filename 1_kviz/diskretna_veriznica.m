b = 80;
A = [0 0];
B = [2 0];

M = [1 + b/100, 0.6, 0.6, 1 + b/100];
L = [1 1 1 1];

g = 9.8;

W = [-1 -1];
zac = [A(1) B(1); A(2) B(2)];
X = ver_uv(W,zac,L,M)

plot(X(1,:),X(2,:))
grid on
hold on

% vsota razdalj krajisc do tezisca
tezisce = 0;
for i=1:4
   t = M(i)*(X(2,i) + X(2,i+1))/2;
   tezisce = tezisce + t;
end
Tx = 1;
Ty = tezisce /5;

vsota = 0;
for i=1:5
    r = sqrt((Tx - X(1,i))^2 + (Ty - X(2,i))^2);
    vsota = vsota + r;
end
vsota;


% enacba parabole skozi obesisci

% potencialna energija
P = 0;
for i=1:4
   w = M(i)*g*0.5*(X(2,i) + X(2,i+1));
   P = P + w;
end

M1 = [(1 + b/100)/2, (1 + b/100)/2, 0.3, 0.3, 0.3, 0.3, (1 + b/100)/2, (1 + b/100)/2];
L1 = [0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5];

X1 = ver_uv(W,zac,L1,M1);
P1 = 0;
for i=1:7
   w1 = M1(i)*g*0.5*(X1(2,i) + X1(2,i+1));
   P1 = P1 + w1;
end
razlika = abs(P-P1);


% ploscina trapeza
m1 = min(X(2,:));
m2 = max(X(2,:));
y = @(x) (m1 + m2) / 2;

y1 = polyfit([A(1) X(1,2)], [A(2) X(2,2)], 1);
y2 = polyfit([B(1) X(1,4)], [B(2) X(2,4)], 1);

Px1 = fzero(@(x) polyval(y1-y,x),3);
Py1 = polyval(y1,Px);

Px2 = fzero(@(x) polyval(y2-y,x),3);
Py2 = polyval(y2,Px);





