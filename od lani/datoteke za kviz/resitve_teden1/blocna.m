function A = blocna(n)

% prvi obdiagonali
obdiagonala = ones(1,n^2-1);
obdiagonala(n:n:n^2-1) = 0;

% diagonala + prvi obdiagonali + n-ti obdiagonali
A = -4*eye(n^2) + diag(obdiagonala,1) + diag(obdiagonala,-1) + diag(ones(1,n^2-n),n) + diag(ones(1,n^2-n),-n);


end

