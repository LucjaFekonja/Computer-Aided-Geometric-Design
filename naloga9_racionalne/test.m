B = [0 0; 2 3; 5 0; 3 -1; 2 -1];
w = [0.5; 0.7; 0.8; 1; 0.6];
rbezier(B,w,linspace(0,1,10));

w1 = w; w1(2) = 2;
rbezier(B,w1,linspace(0,1,10));

w2 = w; w2(2) = 0.2;
rbezier(B,w2,linspace(0,1,10));

t = linspace(0,1);
plotrbezier(B,w,t);
plotrbezier(B,w1,t);
plotrbezier(B,w2,t)