function plotbezier3(Bx, By, Bz, d)

[TRI,U] = trimeshgrid(d);
b = bezier3(Bx, By, Bz, U);

nan_vals = isnan(Bx);
x = Bx (~nan_vals);
y = By (~nan_vals);
z = Bz (~nan_vals);

[T, ~] = trimeshgrid(size(Bx, 1)-1);

figure;
trimesh(T, x, y, z, "FaceAlpha", 0, "EdgeColor", "k");
hold on
trisurf(TRI, b(:, 1), b(:, 2), b(:, 3));
hold off