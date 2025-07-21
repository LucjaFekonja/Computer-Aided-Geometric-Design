function b = blossom3(B,U)
% Opis:
% blossom3 izračuna razcvet polinoma dveh spremenljivk
%
% Definicija:
% b = blossom3(B,U)
%
% Vhodna podatka:
% B matrika velikosti n+1 x n+1, ki predstavlja koeficiente
% polinoma dveh spremenljivk stopnje n v Bezierjevi obliki
% (element matrike na mestu (i,j), j <= n+2-i, določa
% koeficient polinoma z indeksom (n+2-i-j, j-1, i-1)),
% U matrika velikosti n x 3, v kateri vrstice predstavljavo
% baricentrične koordinate točk glede na domenski trikotnik,
% za katere izvajamo razcvet polinoma
%
% Izhodni podatek:
% b vrednost razcveta polinoma, določenega z matriko B, v
% točkah, določenih z matriko U

n = size(U, 1);

for r = 1:n
    for i = 1 : n-r+1
        for j = 1 : n-r+1
            B(i, j) = U(r, 1) * B(i, j) + U(r, 2) * B(i, j+1) + U(r, 3) * B(i+1, j);
        end
    end
end

b = B(1, 1);

end