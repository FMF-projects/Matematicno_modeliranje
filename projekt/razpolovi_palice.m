function [L,M] = razpolovi_palice(L,M)

L = L ./ 2;
L = [L; L];
L = L(:)';

M = M ./ 2;
M = [M; M];
M = M(:)';
end

