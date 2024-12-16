b=75/101;

B = bezierarc(b, 3);
[db, dB]  = bezierder(B, 1, 1/4);
odg1 = sqrt(db(1)^2 + db(2)^2);

tn = dB(2, :);
odg2 = sqrt(tn(1)^2 + tn(2)^2)


t = linspace(0,1,1001);
K = zeros(1, length(t))
% K = @(t) det([bezierder(B, 1, t), bezierder(B, 2, t);]) / norm(bezierder(B, 1, t))^3;
for i = 1:length(t)
    K(i) = det([bezierder(B, 1, t(i)); bezierder(B, 2, t(i));]) / norm(bezierder(B, 1, t(i)))^3;
end

odg3 = max(1 - K)