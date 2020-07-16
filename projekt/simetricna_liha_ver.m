zac = [0 6; 0 0];

hold on
L = [2 1 2 1 2];
M = [1 0.5 1 0.5 1];
X = risi_veriznica(zac,L,M)

L1 = [1 1 0.5 0.5 1 1 0.5 0.5 1 1];
M1 = [0.5 0.5 0.25 0.25 0.5 0.5 0.25 0.25 0.5 0.5];
X1 = risi_veriznica(zac,L1,M1)
hold off

animacija(X,X1)