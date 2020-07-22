function [L,M] = razpolovi_palice(L,M)
% RAZPOLOVI_PALICE razpolovi dolzine in mase palic 
% diskretne veriznice in jih uredi v ustrezni vrsti red
%
% L ... vrstica z dolzinami palic.
% M ... vrstica z masami palic.
% 
% primer:
% L = [1 2 1] ---> L = [0.5 0.5 1 1 0.5 0.5]
% M = [2 4 2] ---> M = [1 1 2 2 1 1]

L = L ./ 2;
L = [L; L];
L = L(:)';

M = M ./ 2;
M = [M; M];
M = M(:)';
end