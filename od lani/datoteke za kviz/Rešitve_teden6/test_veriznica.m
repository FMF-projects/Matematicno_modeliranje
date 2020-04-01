% test: diskretna verizinica
% a)
zac = [0 6;0 0];

L = [2 1 1 1 1 2];

M = [1 0.5 1 1 0.5 1];


risi_veriznica(zac,L,M);

% b)
zac = [0 6;0 3];

L = ones(1,10);

M = ones(1,10);


figure
risi_veriznica(zac,L,M);

