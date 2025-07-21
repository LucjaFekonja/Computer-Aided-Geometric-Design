f = @(x,y) 3*(1-x).^2.*exp(-x.^2 - (y+1).^2) ...
- 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
- 1/3*exp(-(x+1).^2 - y.^2);
dxf = @(x,y) (exp(-(x + 1)^2 - y^2)*(2*x + 2))/3 ...
+ 3*exp(- (y + 1)^2 - x^2)*(2*x - 2) ...
+ exp(- x^2 - y^2)*(30*x^2 - 2) ...
- 6*x*exp(- (y + 1)^2 - x^2)*(x - 1)^2 ...
- 2*x*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5);
dyf = @(x,y) (2*y*exp(- (x + 1)^2 - y^2))/3 ...
+ 50*y^4*exp(- x^2 - y^2) ...
- 3*exp(- (y + 1)^2 - x^2)*(2*y + 2)*(x - 1)^2 ...
- 2*y*exp(- x^2 - y^2)*(10*x^3 - 2*x + 10*y^5);


% Trikotnik
T = [-1.7 -1; -0.5 -1; -0.5 0];
B = kontrolne(T, f, dxf, dyf);


% Na koliko delov razdelimo stranico trikotnika
d = 50;

[TRI, U] = trimeshgrid(d);
n = size(U, 1);

X = zeros(1, n);
Y = zeros(1, n);
Z = zeros(1, n);

for i = 1 : n
    u = U(i, 1);
    v = U(i, 2);
    w = U(i, 3);

    X(i) = U(i, :) * T(:, 1);
    Y(i) = U(i, :) * T(:, 2);

    if u == 1
        Z(i) = B(1);  % b300
    elseif v == 1
        Z(i) = B(6);  % b030
    elseif w == 1
        Z(i) = B(9);  % b003
    else
        a = 6*u*v*w / (v^2*w^2 + w^2*u^2 + u^2*v^2);
        Z(i) = B * [u^3; 3*u^2*v; 3*u^2*w; 3*u*v^2; 3*u*w^2; v^3; 3*v^2*w; 3*v*w^2; w^3; a*v^2*w^2; a*w^2*u^2; a*u^2*v^2];
    end
end

trisurf(TRI, X, Y, Z);


Xf = zeros(1, n);
Yf = zeros(1, n);
Zf = zeros(1, n);

for i = 1 : n
    Xf(i) = U(i, :) * T(:, 1);
    Yf(i) = U(i, :) * T(:, 2);
    Zf(i) = f(Xf(i), Yf(i));
end

figure
trisurf(TRI, Xf, Yf, Zf);

error = mean(abs(Zf - Z));
