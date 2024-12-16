function plotbernsteinbykoef(b)

hold on;
t = linspace(0, 1);
plot(t,polyval(bernstein2power(b),t));

n = length(b)-1;
x = (0:n)/n;
plot(x, b, 'ko-')
hold off;