X = @(r,fi) r.*cos(fi);
Y = @(r,fi) r.*sin(fi);
Z = @(r,fi) r.*fi;

[r, fi] = meshgrid(1:0.1:2, 0:0.1:10*pi);
surf(X(r,fi), Y(r,fi), Z(r,fi))

