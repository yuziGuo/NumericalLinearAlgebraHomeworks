function [W, R] = house(A)
    [m, n] = size(A)
    W = zeros(m, n)
    e1 = eye(m, 1)
    for k=1:n
        x = A(k:m, k)
        % We use e1_sub together with x to decide reflector,
        % as the dimension of subspace (submatrix) is reduced in each loop,
        % e1_sub comes shorter and shorter.
        e1_sub = e1(1:m-k+1)
        % Reflector; Normal plane
        vk = sign(x(1))*norm(x,2) * e1_sub + x
        vk = vk / norm(vk,2)
        % Map the submatrix. To improve efficiency, 
        % it's important to calculate (vk'*A(k:m,k:n) first.
        A(k:m,k:n) = A(k:m,k:n) - 2*vk*(vk'*A(k:m,k:n)) 
        % Record the sub-vectors who define the mappings
        W(k:m,k) = vk
    end
end