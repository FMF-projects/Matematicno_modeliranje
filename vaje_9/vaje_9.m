P = mojrand(1,100,13,0,31,1);
%histogram(P);

pi = racunanje_pi(100000);

f = @(x) x;
I1 = monte_carlo1(f,0,1,10000);

g = @(x,y,z) x + y + z;
I2 = monte_carlo3(g,0,1,0,1,0,1,10000);

x = randhat(10000);
histogram(x);


