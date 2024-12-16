function [Bx,By,Bz] = coons(Bx,By,Bz)
% Opis:
% coons vrne kontrolne točke Coonsove ploskve
%
% Definicija:
% [Bx,By,Bz] = coons(Bx,By,Bz)
%
% Vhodni podatki:
% Bx, By, Bz matrike velikosti n+1 x m+1, ki določajo koordinate
% robnih kontrolnih točk (v konstrukciji Coonsove
% ploskve se upoštevajo kontrolne točke, ki jih določa
% prva in zadnja vrstica ter prvi in zadnji stolpec
% posamezne matrike)
%
% Izhodni podatki:
% Bx, By, Bz matrike velikosti n+1 x m+1, ki določajo koordinate
% kontrolnih točk Coonsove ploskve

m = length(Bx(:, 1)) - 1
n = length(Bx(1, :)) - 1

bx1 = zeros(n+1, m+1);
bx2 = zeros(n+1, m+1);
bx3 = zeros(n+1, m+1);


for j = 1 : n - 1
    for i = 1 : m - 1
        bx1(i+1, j+1) = (1 - j/n) * Bx(i+1, 1) + j/n * Bx(i+1, n+1);
        bx2(i+1, j+1) = (1 - i/m) * Bx(1, j+1) + i/m * Bx(m+1, j+1);
        bx3(i+1, j+1) = (1 - i/m) * (1 - j/n) * Bx(1, 1) + (1 - i/m) * j/n * Bx(1, n+1) + i/m * (1 - j/n) * Bx(m+1, 1) + i/m * j/n * Bx(m+1, n+1);
        Bx(i+1, j+1) = bx1(i+1, j+1) + bx2(i+1, j+1) - bx3(i+1, j+1);

        
        by1(i+1, j+1) = (1 - j/n) * By(i+1, 1) + j/n * By(i+1, n+1);
        by2(i+1, j+1) = (1 - i/m) * By(1, j+1) + i/m * By(m+1, j+1);
        by3(i+1, j+1) = (1 - i/m) * (1 - j/n) * By(1, 1) + (1 - i/m) * j/n * By(1, n+1) + i/m * (1 - j/n) * By(m+1, 1) + i/m * j/n * By(m+1, n+1);
        By(i+1, j+1) = by1(i+1, j+1) + by2(i+1, j+1) - by3(i+1, j+1);


        bz1(i+1, j+1) = (1 - j/n) * Bz(i+1, 1) + j/n * Bz(i+1, n+1);
        bz2(i+1, j+1) = (1 - i/m) * Bz(1, j+1) + i/m * Bz(m+1, j+1);
        bz3(i+1, j+1) = (1 - i/m) * (1 - j/n) * Bz(1, 1) + (1 - i/m) * j/n * Bz(1, n+1) + i/m * (1 - j/n) * Bz(m+1, 1) + i/m * j/n * Bz(m+1, n+1);
        Bz(i+1, j+1) = bz1(i+1, j+1) + bz2(i+1, j+1) - bz3(i+1, j+1);
    end
end