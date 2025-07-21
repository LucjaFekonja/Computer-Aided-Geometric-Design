f = @(x,y) (1.25 + cos(5.4 * y)) / (6 + 6 * (3 * x - 1)^2);
dxf = @(x,y) - 36 * (3 * x - 1) * (1.25 + cos(5.4 * y)) / (6 + 6 * (3 * x - 1)^2)^2;
dyf = @(x,y) - 5.4 * sin(5.4 * y) / (6 + 6 * (3 * x - 1)^2);


X = [0 0.5 1 0.15 0.7 0.5 0.25 0.4 0.75 0.85 0.55 0 0.2 0.45 0.6 0.25 0.4 ...
     0.65 0.8 0.85 1 1 0.5 0.1 0 0.25 0.75 0.25 0 0.75 0 1 1 0.19 0.32 0.79];

Y = [0 0 0 0.15 0.15 0.2 0.3 0.3 0.4 0.25 0.45 0.5 0.45 0.55 0.65 0.7 0.8 ...
    0.75 0.85 0.65 0.5 1 1 0.85 1 0 0 1 0.25 1 0.75 0.25 0.75 0.19 0.75 0.46];


TRI = delaunay(X', Y');
tri = triangulation(TRI, X', Y');


% Meshgrid
[max_error, mean_error] = plot_spline(tri, f, dxf, dyf, 25)

% Trimeshgrid
figure
[max_error_tri, mean_error_tri] = plot_spline_tri(tri, f, dxf, dyf, 3)

