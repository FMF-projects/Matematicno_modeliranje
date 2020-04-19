function [y] = dolzina_zadnjega(l,W,zac,L,M)
    L1 = [L(1:5) l];
    X = ver_uv(W,zac,L1,M);
    y = X(2,3) - X(2,4); % krajisci clenka
end

