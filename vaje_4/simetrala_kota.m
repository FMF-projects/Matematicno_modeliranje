function [A, s] = simetrala_kota(X,Y)
    % X,Y vektorja x,y koordinat treh tock
    A = [X(2);Y(2)];
    s = [X;Y] * [1;-2;1];
end