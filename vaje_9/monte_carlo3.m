function [I] = monte_carlo3(f,a1,b1,a2,b2,a3,b3,N)
% aproksimira trojni integral funkcije f

I = 0;
for i=1:N
   x = a1 + (b1-a1) * rand();
   y = a2 + (b2-a2) * rand();
   z = a3 + (b3-a3) * rand();
   I = I + f(x,y,z);
end
I = (b1-a1)*(b2-a2)*(b3-a3)/N * I;

end