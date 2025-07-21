function b = decasteljau3(B,p) 

b = blossom3(B, ones(size(B, 1)-1, 1) .* p);

end