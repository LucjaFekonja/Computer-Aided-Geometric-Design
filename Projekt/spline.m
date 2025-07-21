function S = spline(tri,f,Dxf,Dyf)

n = size(tri.ConnectivityList, 1);
S = cell(n, 1);

for i = 1:n
    indices = tri.ConnectivityList(i, :);
    T = [tri.Points(indices(1), :); tri.Points(indices(2), :); tri.Points(indices(3), :)];
    S{i} = control_points(T,f,Dxf,Dyf);
end