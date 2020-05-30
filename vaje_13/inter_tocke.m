function u = inter_tocke(a,p)
% konstruira seznam interpolacijskih tock
% u_j = u_j-1 + ||p_j - p_j-1||^a

n = size(p,2);
u = zeros(1,n);

for i=2:n
   u(i) = u(i-1) + norm(p(:,i) - p(:,i-1))^a;
end
end

