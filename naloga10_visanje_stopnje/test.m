addpath("C:\School\CAGD\naloga6_visanje_stopnje\")
addpath("C:\School\CAGD\naloga9_racionalne\")

B = [1 0; 1 4; -3 2; -3 -2; 1 -4; 1 0];
w = [1; 1/5; 1/5; 1/5; 1/5; 1];

[B1, w1] = rbezierelv(B,w);
[B2,w2] = rbezierelv(B1,w1);


t = linspace(0,1);
b = rbezier(B,w,t);
N = 20;

clf
hold on
plot(b(:,1),b(:,2),'k','LineWidth',2);
C = jet(N);

for i = 1:N
    [B,w] = rbezierelv(B,w);
    b = bezier(B,t);
    plot(b(:,1),b(:,2),'Color',C(i,:));
end
hold off
axis equal