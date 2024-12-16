d=33/101;

D = zeros(8, 2);

for j = 1 : 8
    D(j, :) = [sin(pi * (j-2) / 3) , 2 * cos(pi * (j-2) / 4) + 1];
end

P = D([1 3 4 5 6 8],:);
u = alphaparam(P, d);
nal1 = max(diff(u));


du = diff(u);
