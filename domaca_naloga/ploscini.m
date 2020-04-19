function [S] = ploscini(x,X)

Y = [];
n = length(X);
% skonstruiramo premice med vozlisci
for i=1:n-1
   y = polyfit([X(1,i) X(1,i+1)], [X(2,i) X(2,i+1)], 1); 
   Y = [Y y'];
end

% izracunamo obe ploscini
S1 = 0;
S2 = 0;
prvic = 0; % prvic ko je x < X(1,i)
for i=2:n
    premica = @(x) Y(1,i-1) * x + Y(2,i-1);
    if x > X(1,i)
        s = integral(premica,X(1,i-1),X(1,i));
        S1 = S1 + s;
    else 
        if prvic == 0
            prvic = 1;
            s1 = integral(premica,X(1,i-1),x);
            S1 = S1 + s1;
            s2 = integral(premica,x,X(1,i));
            S2 = S2 + s2;
        else
            s = integral(premica,X(1,i-1),X(1,i));
            S2 = S2 + s;
        end
    end
end
S = S1 - S2;
end

