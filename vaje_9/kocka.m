% simulacija metov klasicnih kock
n = 1000; % st metov
m = 8; % st kock

p = zeros(n,1);
for i=1:n
    for j=1:m
        p(i) = p(i) + randi(6);
    end
end

histogram(p)