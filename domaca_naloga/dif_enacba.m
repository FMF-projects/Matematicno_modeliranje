alfa = -50;
beta = 50;
n = 10;

[M, b] = sistem_dif(alfa,beta,n-1);
A = diag(M(2:n-1,1),-1) + diag(M(:,2),0) + diag(M(1:n-2,3),1);

% n=10
% koliko je A(1,1)
A(1,1);
% koliko je A(2,1)
A(2,1);
% koliko je norma b
norm(b);
% koliko je F norma A
norm(A,'fro');


% sled modificirane matrike A pri n=5000
m = 5000;
[M1, b1] = sistem_dif(alfa,beta,m-1);
[y1, M1, b1] = Thomas(M1,b1);
sled = sum(M1(:,2));

% koliko je vrednost y pri x=0
% n naj bo dovolj velik za natancno resitev npr 500 000
p = 500000;
[M2, b2] = sistem_dif(alfa,beta,p-1);
[y2, M2, b2] = Thomas(M2,b2);
% x=0 je na polovici seznama
s = fix(p/2);
y_x0 = y2(s);
