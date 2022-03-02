[U, S, V] = svd(A)
V * (diag(S).^(-1)) .* ((U'*b)(1:n))