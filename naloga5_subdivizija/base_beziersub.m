function BS = base_beziersub(B,t)
% Opis:
% beziersub izvede subdivizijo Bezierjeve krivulje
%
% Definicija:
% BS = beziersub(B,t)
%
% Vhodni podatki:
% B matrika kontrolnih točk Bezierjeve krivulje, v kateri
% vsaka vrstica predstavlja eno kontrolno točko,
% t parameter subdivizije Bezierjeve krivulje
%
% Izhodni podatek:
% BS celica, ki vsebuje kontrolne točke dveh krivulj, ki jih
% dobimo s subdivizijo prvotne Bezierjeve krivulje

n = length(B(:, 1));
m = length(B(1, :));

BS1 = zeros(n, m);
BS2 = zeros(n, m);

for i = 1 : length(B(1, :))
    D = decasteljau(B(:, i),t);
    bs1 = D(1, :)';                % 1. vrstica decasteljauva
    bs2 = flip(diag(flip(D)));     % diagonala

    BS1(:, i) = bs1;
    BS2(:, i) = bs2;
end

BS = {BS1, BS2};

end