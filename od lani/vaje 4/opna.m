function [ output_args ] = opna(R,n)
% izracuna obliko tanke opne, napete na krozno zanko, 
% ki se povesi pod vplivom zunanje sile
% R...polmer krozne zanke
% n...število delilnih toèk

h = R/n;
r = linspace(0,R,n+1);
a = ones(n-1,1);
b = -2*ones(n,1);
c = ones(n-1,1);

for i=1:n-2
    a(i) = 1 - h/(2*r(i));
    c(i+1) = 1 + h/(2*r(i));    
end

a(n-1) = 1 - h/(2*r(n-1));
c(1) = 2;

end

