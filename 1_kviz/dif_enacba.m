alfa = -32;
beta = 32;
n = 20;

[M, b] = sistem_dif(alfa,beta,n-1);
A = diag(M(2:n-1,1),-1) + diag(M(:,2),0) + diag(M(1:n-2,3),1);

% n = 100, aritmeticna sredina vektorja b
ar = sum(b) / length(b);

% n = 20, prva norma A?
norma = norm(A,1);

% n = 20, det A po thomasu
[y1, M1, b1] = Thomas(M,b);
A1 = diag(M1(2:n-1,1),-1) + diag(M1(:,2),0) + diag(M1(1:n-2,3),1);
d = det(A1)

% n = 20, maksimalna abs sprememba pri b
d_b = abs(b - b1);
d_max = max(d_b);

% n = 400000, vrednost funkcije y pri x = 1
m = 400000;
[M2, b2] = sistem_dif(alfa,beta,m-1);
[y2, M2, b2] = Thomas(M2,b2);
s = 206250;
y_x1 = y2(s);

% spremenimo enacbo z 0.1y(x), prva norma A, n=20
norma2 = norm(A,1);

% spremenimo y'(a), n=25, vsota abs vred prve vrstice A

