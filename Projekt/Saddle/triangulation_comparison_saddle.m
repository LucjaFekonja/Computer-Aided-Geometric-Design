f = @(x,y) (1.25 + cos(5.4 * y)) / (6 + 6 * (3 * x - 1)^2);
dxf = @(x,y) - 36 * (3 * x - 1) * (1.25 + cos(5.4 * y)) / (6 + 6 * (3 * x - 1)^2)^2;
dyf = @(x,y) - 5.4 * sin(5.4 * y) / (6 + 6 * (3 * x - 1)^2);

[X,Y] = meshgrid(linspace(0,1,5));

% bad triangulation
TRI_bad = triangulate(5);
tri_bad = triangulation(TRI_bad,X(:),Y(:));
figure
triplot(tri_bad);

figure
[max_error_bad, mean_error_bad] = plot_spline(tri_bad, f, dxf, dyf, 25);

% Delaunay triangulation
TRI_delaunay = delaunay(X,Y);
tri_delaunay = triangulation(TRI_delaunay,X(:),Y(:));
figure
triplot(tri_delaunay);

figure
[max_error_delaunay, mean_error_delaunay] = plot_spline(tri_delaunay, f, dxf, dyf, 25);

