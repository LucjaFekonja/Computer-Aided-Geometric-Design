function b = rbezier(B,w,t)
% Opis:
% rbezier vrne točke na racionalni Bezierovi krivulji, izračunane z
% de Casteljaujevim postopkom za racionalne krivulje
%
% Definicija:
% b = rbezier(B,w,t)
%
% Vhod:
% B matrika velikosti n+1 x d, v kateri vsaka vrstica predstavlja
% eno kontrolno točko racionalne Bezierjeve krivulje stopnje n
% v prostoru dimenzije d,
% w seznam uteži racionalne Bezierjeve krivulje,
% t seznam parametrov dolžine N, za katere se računajo točke na
% racionalni Bezierjevi krivulji
%
% Izhod:
% b matrika velikosti N x d, v kateri i-ta vrstica predstavlja
% točko na racionalni Bezierjevi krivulji pri i-tem parametru
% iz seznama t

n = length(B(:, 1)) - 1;
d = length(B(1, :));
N = length(t);

b = zeros(N, d);

for j = 1 : N
    bi = B;
    wi = w;
    for r = 1 : n
        wr = wi;
        for i = 1 : n-r+1
            wi(i) = (1 - t(j)) * wr(i) + t(j) * wr(i+1);
            bi(i,:) = (1 - t(j)) * wr(i) / wi(i) * bi(i, :)  + t(j) * wr(i+1) / wi(i) * bi(i+1, :);
        end
    end
    b(j, :) = bi(1, :);
       
end