function plotbernstein(n)

% Nariše Bernsteinove polinome stopnje n

x = linspace(0,1);
clf
hold on
for i = 0:n
b = zeros(1,n+1);
b(i+1) = 1;
plot(x,polyval(bernstein2power(b),x));
end
hold off