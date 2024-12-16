function u = vectorbary(P,T)
% Opis:
% vectorbary vrne baricentrične koordinate vektorja P-0 glede na dan trikotnik
%
% Definicija:
% u = vectorbary(P,T)
%
% Vhodna podatka:
% P vrstica, ki predstavlja kartezične koordinate točke v ravnini,
% T matrika s tremi vrsticami, v kateri vsaka vrstica predstavlja
% kartezične koordinate oglišč trikotnika
%
% Izhodni podatek:
% u vrstica dolžine 3, ki predstavlja baricentrične koordinate
% vektorja, podane s P, glede na trikotnik, podan s T


% Lahko bi imeli 
% v = P1 - P2 = 
%   = (u2 * V1 + v2 * V2 * w2 * V3) - (u1 * V1 + v1 * V2 * w1 * V3) = 
%   = (u2 - u1) V1 + (v2 - v1) V2 + (w2 - w1) V3
% Kjer so (ui, vi, wi) baricentrične koordinate točke P1
% in V1, V2, V3 ogljišča trikotnika

A = [1 1 1; T(1, :)' T(2, :)' T(3, :)'];
u = (A \ [0; P'])';

end