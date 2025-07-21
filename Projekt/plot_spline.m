function [max_error, mean_error] = plot_spline(tri, f, dxf, dyf, N)

a = min(min(tri.Points));
b = max(max(tri.Points));

% Dejanska funkcija
[Xf, Yf] = meshgrid(linspace(a, b, N));
Zf = zeros(N);
for i = 1:N
    for j = 1:N
        Zf(i,j) = f(Xf(i,j), Yf(i,j));
    end
end


% Aproksimacija
S = spline(tri,f,dxf,dyf);
[X,Y] = meshgrid(linspace(a,b,N));
[txy,U] = pointLocation(tri,[X(:) Y(:)]);
SXY = zeros(N);

k = 1;
for i = 1:N
    for j = 1:N
        u = U(k, 1);
        v = U(k, 2);
        w = U(k, 3);
        B = (S{txy(k)});

        if u == 1
            SXY(j,i) = B(1);  % b300
        elseif v == 1
            SXY(j,i) = B(6);  % b030
        elseif w == 1
            SXY(j,i) = B(9);  % b003
        else
            a = 6*u*v*w / (v^2*w^2 + w^2*u^2 + u^2*v^2);
            SXY(j,i) = B * [u^3; 3*u^2*v; 3*u^2*w; 3*u*v^2; 3*u*w^2; v^3; 3*v^2*w; 3*v*w^2; w^3; a*v^2*w^2; a*w^2*u^2; a*u^2*v^2];
        end

        k = k+1;
    end
end


% Error
max_error = max(max(abs(Zf - SXY)));
mean_error = mean(mean(abs(Zf - SXY)));


% Plottnig
zLimits = [min([Zf(:); SXY(:); Zf(:) - SXY(:)]), ...
           max([Zf(:); SXY(:); Zf(:) - SXY(:)])];

subplot(1,3,1)
surf(Xf, Yf, Zf, 'EdgeAlpha', 0.8)
title("Original")
axis equal;
zlim(zLimits)

subplot(1,3,2);
surf(X,Y,SXY, 'EdgeAlpha', 0.8);
title("Aproksimacija")
axis equal;
zlim(zLimits)

subplot(1,3,3)
surf(Xf, Yf, Zf - SXY, 'EdgeAlpha', 0.8)
title("Napaka")
axis equal;
zlim(zLimits)
