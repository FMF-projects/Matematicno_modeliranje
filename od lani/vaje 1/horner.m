function [vred] = horner(a,x)
%vrne vrednost polinoma p z koef iz a v tocki x

vred = a(1);
n = length(a);
for i=2:n
    vred = vred * x + a(i);
end
end

