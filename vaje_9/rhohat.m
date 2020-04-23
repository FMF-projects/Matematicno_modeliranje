function [rho] = rhohat(x)
% vrne vrednost funkcije rho

rho1 = @(x) x + 1;
rho2 = @(x) 1 - x;

if -1<=x && x<=0
    rho = rho1(x);
elseif 0<x && x<=1 
    rho = rho2(x);
else
    rho = 0;
end

