function B = control_points(T, f, Dxf, Dyf)

% Po C1 trikotniški interpolacijski shemi izračunamo kontrolne točke na
% trikotniku T

V1x = T(1,1);
V2x = T(2,1);
V3x = T(3,1);
V1y = T(1,2);
V2y = T(2,2);
V3y = T(3,2);

f_e1 = @(x,y) (V3x - V2x) * Dxf(x,y) + (V3y - V2y) * Dyf(x,y);
f_e2 = @(x,y) (V1x - V3x) * Dxf(x,y) + (V1y - V3y) * Dyf(x,y);
f_e3 = @(x,y) (V2x - V1x) * Dxf(x,y) + (V2y - V1y) * Dyf(x,y); 

b300 = f(V1x, V1y);
b210 = f(V1x, V1y) + f_e3(V1x, V1y) / 3;
b201 = f(V1x, V1y) - f_e2(V1x, V1y) / 3;

b030 = f(V2x, V2y);
b021 = f(V2x, V2y) + f_e1(V2x, V2y) / 3;
b120 = f(V2x, V2y) - f_e3(V2x, V2y) / 3;

b003 = f(V3x, V3y);
b102 = f(V3x, V3y) + f_e2(V3x, V3y) / 3;
b012 = f(V3x, V3y) - f_e1(V3x, V3y) / 3;

e1 = [V3x - V2x; V3y - V2y];
e2 = [V1x - V3x; V1y - V3y];
e3 = [V2x - V1x; V2y - V1y];

h1 = - dot(e3, e1) / dot(e1, e1);
b111_1 = (b120 + b102 + h1 * (2 * b012 - b021 - b003) + (1 - h1) * (2 * b021 - b012 - b030)) / 2;

h2 = - dot(e1, e2) / dot(e2, e2);
b111_2 = (b210 + b012 + h2 * (2 * b201 - b102 - b300) + (1 - h2) * (2 * b102 - b201 - b003)) / 2;

h3 = - dot(e2, e3) / dot(e3 ,e3);
b111_3 = (b201 + b021 + h3 * (2 * b120 - b210 - b030) + (1 - h3) * (2 * b210 - b120 - b300)) / 2;

B = [b300 b210 b201 b120 b102 b030 b021 b012 b003 b111_1 b111_2 b111_3];