function b = decasteljau3(B,p) 

n = length(p);

for r = 1:n
    for i = 1 : n-r+1
        for j = 1 : n-r+1
            B(i, j) = p(1) * B(i, j) + p(2) * B(i, j+1) + p(3) * B(i+1, j);
        end
    end
end

b = B(1, 1);