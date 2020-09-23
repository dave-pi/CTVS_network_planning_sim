%
% rho=findrhob(n,p)
%
% Finds an intensity rho such that B(n,rho)=p.  
%
% Note: Must have 0<p<1.  Returns NaN if p is not in this range.
%
function rho=findrhob(p,N)
    for A = 0:0.01:1e6
           n = erlangbinv(p, A);
       if n > N
           break
       end
    end
    rho = A-0.01;
end