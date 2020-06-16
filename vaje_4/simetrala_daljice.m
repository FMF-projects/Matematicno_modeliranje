function [A,s] = simetrala_daljice(X,Y)
    % X vektor x koordinat, Y vektor Y koordinat
    A = 1/2 * [X;Y] * [1;1];
    s = ([X;Y] * [1;-1])' * [0 -1; 1 0];
end