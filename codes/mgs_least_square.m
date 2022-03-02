n = 12
m = 50
t = linspace(0, 1, m)
A = fliplr(vander(t))(:,1:n) % 50 x 12

b = cos(4*t) % 1 x 50
b = reshape(b, [m,1])
x = mgs_ls(A, b)

function [res] =  mgs_ls(X, Y)
    [n,p] = size(X);
    Q = zeros(n,p);
    R = zeros(p,p);
    for k = 1:p
        Q(:,k) = X(:,k);
        for i = 1:k-1
            R(i,k) = Q(:,i)'*Q(:,k);
            Q(:,k) = Q(:,k) - R(i,k)*Q(:,i);
        end
        R(k,k) = norm(Q(:,k))';
        Q(:,k) = Q(:,k)/R(k,k);
    end
    res = R\(Q'*Y)
end

//    1.0000e+00
//    6.3773e-07
//   -8.0000e+00
//    2.6494e-04
//    1.0665e+01
//    6.2850e-03
//   -5.7040e+00
//    2.8870e-02
//    1.5706e+00
//    9.6520e-02
//   -4.1196e-01
//    9.4844e-02