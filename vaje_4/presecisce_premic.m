function C = presecisce_premic(A,s,B,v)
    % A,B tocki; s,v smerna vektorja
    x = [s -v]\(B-A);
    C = A + x(1)*s;
end