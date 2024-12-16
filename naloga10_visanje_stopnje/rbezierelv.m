function [Be,we] = rbezierelv(B,w)
% Opis:
% rbezierelv izvede višanje stopnje racionalne Bezierjeve krivulje
%
% Definicija:
% [Be,we] = rbezierelv(B,w)
%
% Vhodna podatka:
% B matrika velikosti n+1 x d, v kateri vsaka vrstica predstavlja
% d-dimenzionalno kontrolno točko racionalne Bezierjeve krivulje
% stopnje n,
% w seznam uteži racionalne Bezierjeve krivulje
%
% Izhodni podatek:
% Be matrika velikosti n+2 x d, v kateri vsaka vrstica predstavlja
% d-dimenzionalno kontrolno točko racionalne Bezierjeve krvulje
% stopnje n+1, ki ustreza dani racionalni Bezierjevi krivulji,
% we seznam dolžine n+2, v katerem vsak element predstavlja utež
% racionalne Bezierjeve krvulje stopnje n+1, ki ustreza dani
% racionalni Bezierjevi krivulji

% Nove kontrolne točke
b = [w .* B, w];

% višanje stopnje na novi b
be = bezierelv(b,1);

% we so zadnji koeficienti v be (zadnji stolpec)
we = be(:, length(be(1, :)));   

% Be so vsi stolpci be / we, razen zadnjega
Be = be ./ we;
Be = Be(:, 1:length(Be(1, :))-1);



end
