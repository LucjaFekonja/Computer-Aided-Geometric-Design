function b = bezier(B,t)
% Opis:
% bezier vrne točke na Bezierjevi krivulji pri danih parametrih
%
% Definicija:
% b = bezier(B,t)
%
% Vhodna podatka:
% B matrika velikosti n+1 x d, ki predstavlja kontrolne točke
% Bezierjeve krivulje stopnje n v d-dimenzionalnem prostoru,
% t seznam parametrov dolžine k, pri katerih računamo vrednost
% Bezierjeve krivulje
%
% Izhodni podatek:
% b matrika velikosti k x d, kjer i-ta vrstica predstavlja točko
% na Bezierjevi krivulji pri parametru iz t na i-tem mestu

n = size(B, 1) - 1; 
d = size(B, 2);     
k = length(t);      

b = zeros(k, d);

for i = 1:k
    for j = 1:d
        % Izračunaj de Casteljaujevo shemo za vsako dimenzijo posebej
        D = decasteljau(B(:, j), t(i));
        % Vzemi točko Bezierjeve krivulje, ki je v (1,n+1) poziciji sheme
        b(i, j) = D(1, n+1);
    end
end

end
