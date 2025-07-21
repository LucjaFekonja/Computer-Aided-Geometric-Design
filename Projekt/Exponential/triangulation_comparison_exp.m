f = @(x, y) 0.75 * exp(-((9*x-2)^2 + (9*y-2)^2)/4) + ...
            0.75 * exp(-(9*x+1)^2 / 49 - (9*y+1)/10) + ...
            0.5 * exp(-((9*x-7)^2 + (9*y-3)^2)/4) - ...
            0.2 * exp(-(9*x-4)^2 - (9*y-7)^2);

dxf = @(x,y) - 0.75 * 9 * (9*x-2) * exp(-((9*x-2)^2 + (9*y-2)^2)/4) / 2 - ...
             0.75 * 18 * (9*x+1) * exp(-(9*x+1)^2 / 49 - (9*y+1)/10) / 49 - ...
             0.5 * 9 * (9*x-7) * exp(-((9*x-7)^2 + (9*y-3)^2)/4) / 2 + ...
             0.2 * 18 * (9*x-4) * exp(-(9*x-4)^2 - (9*y-7)^2);

dyf = @(x,y) - 0.75 * 9 * (9*y-2) * exp(-((9*x-2)^2 + (9*y-2)^2)/4) / 2 - ...
             0.75 * 9 * (9*y+1) * exp(-(9*x+1)^2 / 49 - (9*y+1)/10) / 10 - ...
             0.5 * 9 * (9*y-3) * exp(-((9*x-7)^2 + (9*y-3)^2)/4) / 2 + ...
             0.2 * 18 * (9*y-7) * exp(-(9*x-4)^2 - (9*y-7)^2);

[X,Y] = meshgrid(linspace(0,1,5));

% bad triangulation
TRI_bad = triangulate(5);
tri_bad = triangulation(TRI_bad,X(:),Y(:));
figure
triplot(tri_bad);

figure
[max_error_bad, mean_error_bad] = plot_spline(tri_bad, f, dxf, dyf, 25)

% Delaunay triangulation
TRI_delaunay = delaunay(X,Y);
tri_delaunay = triangulation(TRI_delaunay,X(:),Y(:));
figure
triplot(tri_delaunay);

figure
[max_error_delaunay, mean_error_delaunay] = plot_spline(tri_delaunay, f, dxf, dyf, 25)

