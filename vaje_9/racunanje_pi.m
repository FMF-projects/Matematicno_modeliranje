function [pi] = racunanje_pi(N)
%aproksimira racunanje stevila pi
% nakljucno izberemo (x,y) in s K
% oznacimo stevilo tistih ki lezi v x^2+y^2<=1

K = 0;
for i=1:N
    x = rand(1,1);
    y = rand(1,1);
    % lahko tudi T = rand(1,2) in potem sum(T.^2)
    if x^2+y^2 <= 1
        K = K + 1;
end
pi = 4*K/N;
end

