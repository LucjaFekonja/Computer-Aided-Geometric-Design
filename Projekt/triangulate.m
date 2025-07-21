function TRI = triangulate(N)

TRI = [];
k = 1;
for i = 1:N-1
    for j = 1:N-1
        TRI(k,:) = [N*i - (N-j), N*i - (N-j) + 1, i*N+1];
        TRI(k + 1,:) = [i*N, i*N+j, i*N+j+1];
        k = k+2;
        
    end
end

end