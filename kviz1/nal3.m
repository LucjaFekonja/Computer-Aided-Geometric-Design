c=328/101;

B = [0, -1, 1; 3, 2, -2; 2, 5, c; 4, 2, 1];
t = 1/2;

Bsub = beziersub(B, t, 1);

dB1 = diff(Bsub{1}).^2;
l1 = sqrt(sum(dB1(1, :))) + sqrt(sum(dB1(2, :))) + sqrt(sum(dB1(3, :)));
    
dB2 = diff(Bsub{2}).^2;
l2 = sqrt(sum(dB2(1, :))) + sqrt(sum(dB2(2, :))) + sqrt(sum(dB2(3, :)));

odg1 = l1/l2;



B2 = bezierelv(B, 4);
odg2 = len_control(B2);



db = @(t) sqrt(sum(bezierder(B, 1, t).^2));
odg3 = integral(db, 0, 1, 'ArrayValued',true)

