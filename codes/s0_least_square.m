n = 12
m = 50
t = linspace(0, 1, m)
A = fliplr(vander(t))(:,1:n) % 50 x 12

b = cos(4*t) % 1 x 50
b = reshape(b, [m,1])