function B = lsqbezier2(m,n,P)
% Opis:
% lsqbezier2 vrne koeficiente tenzorskega polinoma, ki po metodi
% najmanjših kvadratov najbolje aproksimira dane podatke
%
% Definicija:
% B = lsqbezier2(m,n,P)
%
% Vhodni podatki:
% m,n parametra, ki določata stopnjo polinoma,
% P matrika podatkov, ki v vsaki vrstici vsebuje parametra z
% intervala [0,1] ter njima pripadajočo vrednost
%
% Izhodni podatek:
% B matrika velikosti n+1 x m+1 s koeficienti polinoma, ki po
% metodi najmanjših kvadratov najbolje aproksimira podatke

K = size(P, 1);
B = zeros(K, (m+1) * (n+1));
f = P(:, 3);

for k = 1:K
    u = P(k, 1);
    v = P(k, 2);

    l = 1;
    for i = 0:m
        for j = 0:n
            Bm = nchoosek(m, i) * u^i * (1-u)^(m-i);
            Bn = nchoosek(n, j) * v^j * (1-v)^(n-j);

            B(k, l) = Bm * Bn;
            l = l+1;
        end
    end
end

x = B \ f;
B = reshape(x, [n+1, m+1]);

end