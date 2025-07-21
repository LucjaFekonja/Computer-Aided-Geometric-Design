function [max_error, mean_error] = plot_spline_tri(tri, f, dxf, dyf, d)
% d določi na koliko delov se razdeli vsaka daljica trikotnika

m = size(tri.ConnectivityList, 1);

[TRI, U] = trimeshgrid(d);
n = size(U, 1);

X = zeros(m, n);
Y = zeros(m, n);
Z = zeros(m, n);

for j = 1:m

    indices = tri.ConnectivityList(j, :);
    T = [tri.Points(indices(1), :); tri.Points(indices(2), :); tri.Points(indices(3), :)];
    B = control_points(T,f,dxf,dyf);

    for i = 1 : n
        u = U(i, 1);
        v = U(i, 2);
        w = U(i, 3);

        X(j,i) = U(i, :) * T(:, 1);
        Y(j,i) = U(i, :) * T(:, 2);

        if u == 1
            Z(j,i) = B(1);  % b300
        elseif v == 1
            Z(j,i) = B(6);  % b030
        elseif w == 1
            Z(j,i) = B(9);  % b003
        else
            a = 6*u*v*w / (v^2*w^2 + w^2*u^2 + u^2*v^2);
            Z(j,i) = B * [u^3; 3*u^2*v; 3*u^2*w; 3*u*v^2; 3*u*w^2; v^3; 3*v^2*w; 3*v*w^2; w^3; a*v^2*w^2; a*w^2*u^2; a*u^2*v^2];
        end
    end
end



% Real surface
Xf = zeros(m, n);
Yf = zeros(m, n);
Zf = zeros(m, n);

for j = 1:m

    indices = tri.ConnectivityList(j, :);
    T = [tri.Points(indices(1), :); tri.Points(indices(2), :); tri.Points(indices(3), :)];

    for i = 1 : n
        Xf(j,i) = U(i, :) * T(:, 1);
        Yf(j,i) = U(i, :) * T(:, 2);
        Zf(j,i) = f(Xf(j,i), Yf(j,i));
    end
end


% Error
max_error = max(max(abs(Z - Zf)));
mean_error = mean(mean(abs(Zf - Z)));
Z_error = Zf - Z;



% Ploting
zLimits = [min([Z(:); Zf(:); Z_error(:)]), ...
           max([Z(:); Zf(:); Z_error(:)])];


subplot(1,3,1);
for j = 1:m
    trisurf(TRI, Xf(j,:), Yf(j,:), Zf(j,:), 'EdgeAlpha', 0.8);
    hold on;
end
title("Original")
axis equal;
zlim(zLimits)
hold off;


subplot(1,3,2);
for j = 1:m
    trisurf(TRI, X(j,:), Y(j,:), Z(j,:), 'EdgeAlpha', 0.8);
    % pause(0.2)
    hold on;
end
title("Approximation")
axis equal;
zlim(zLimits)
hold off;


subplot(1,3,3);
for j = 1:m
    trisurf(TRI, X(j,:), Y(j,:), Z_error(j,:), 'EdgeAlpha', 0.8);
    hold on
end
title("Napaka")
axis equal;
zlim(zLimits)
hold off