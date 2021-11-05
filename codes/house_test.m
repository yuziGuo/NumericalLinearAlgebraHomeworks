m = 8
n = 4
x = (-m/2:m/2-1)'/(m/2)
A = [x.^0  x.^1  x.^2 x.^3]
W, R = house(A)