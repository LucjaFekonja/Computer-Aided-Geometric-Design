a = 39/101;

p_x  =[-1, 6, a];
p_y = [2, -4, 1];

bx = power2bernstein(p_x);
by = power2bernstein(p_y);

odg1 = sqrt(bx(3)^2 + by(3)^2)



% px2 = [-1, 6, 2*a];
% py2 = [2, -4, 2];
% bx2 = power2bernstein(px2);
% by2 = power2bernstein(py2);

t = 1/2;

bx2 = bx+a;
by2 = by+1;
B2 = [bx2', by2'];
B2 = B2 * [1 0; 0 -1];

x2 = decasteljau(B2(:,1),t);
y2 = decasteljau(B2(:,2),t);


t1 = [bx(3), by(3)];
t2 = [x2(1,3), y2(1,3)];
nal2 = sqrt((t1(1) - t2(1))^2 + (t1(2) - t2(2))^2)


px3 = bernstein2power(bx+a);
nal3 = px3(3)
