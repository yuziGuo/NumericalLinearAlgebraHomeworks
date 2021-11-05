m = 8
n = 4
x = (-m/2:m/2-1)'/(m/2)
A = [x.^0  x.^1  x.^2 x.^3]
% W = house(A)

% function [W] = house(A)
% [m, n] = size(A)
W = zeros(m, n)
e1 = eye(m, 1)
for k=1:n
    x = A(k:m, k)
    e1_sub = e1(1:m-k+1)
    vk = sign(x(1))*norm(x,2) * e1_sub + x
    vk = vk / norm(vk,2)
    A(k:m,k:n) = A(k:m,k:n) - 2*vk*(vk'*A(k:m,k:n))  % HouseHolder mapping; 
    W(k:m,k) = vk
end

R=A(1:n,:)