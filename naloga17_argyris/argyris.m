function B = argyris(T,f,Df,Hf)
% Opis:
% argyris izračuna Bezierjeve ordinate polinoma dveh spremenljivk
% stopnje 5, ki interpolira vrednosti, prve in druge odvode podane
% funkcije f v ogliščih trikotnika ter odvode funkcije f v središčih
% stranic trikotnika v smereh, pravokotnih na posamezno stranico
%
% Definicija:
% B = argyris(T,f,Df,Hf)
%
% Vhodni podatki:
% T tabela velikosti 3 x 2, v kateri vsaka vrstica predstavlja
% oglišče trikonika, nad katerim je definiran polinom,
% f funkcija, ki jo interpoliramo,
% Df gradient funkcije, ki jo interpoliramo,
% Hf Hessejeva matrika funkcije, ki jo interpoliramo
%
% Izhodni podatek:
% B matrika velikosti 6 x 6, ki predstavlja koeficiente polinoma
% dveh spremenljivk stopnje 5 v Bezierjevi obliki (element
% matrike na mestu (i,j), j <= 7-i, določa koeficient polinoma
% z indeksom (7-i-j, j-1, i-1)), ki interpolira funkcijo f

B = zeros(6, 6);

V1 = T(1,:);
V2 = T(2,:);
V3 = T(3,:);

% Ogljišče V1
B(1:3, 1:3) = pomozna(V1, V2, V3, f, Df, Hf);

% Ogljišče V2
b2 = pomozna(V2, V1, V3, f, Df, Hf);
B(1, 4:6) = flip(b2(1, 1:3));
B(2, 4:5) = flip(b2(2, 1:2));
B(3, 4) = b2(3, 1);

% Ogljišče V3
b3 = pomozna(V3, V1, V2, f, Df, Hf);
B(4:6, 1) = flip(b3(1, :)');
B(4:5, 2) = flip(b3(2, 1:2)');
B(4, 3) = b3(3, 1);

% b221
V12 = [mean([V1(1), V2(1)]), mean([V1(2), V2(2)])];
n = [-(V2(2) - V1(2)), V2(1) - V1(1)];
n12 = n / norm(n);
theta = vectorbary(n12, T);
pascal_vec = diag(flip(pascal(5)));

B(2,3) = 8/(15 * theta(3)) * dot(Df(V12(1), V12(2)), n12) - ...
         1/6 * sum(pascal_vec' .* B(2,1:5)) - ...
         1/6 * theta(1)/theta(3) * sum(pascal_vec' .* B(1, 1:5)) - ...
         1/6 * theta(2)/theta(3) * sum(pascal_vec' .* flip(B(1, 2:6)));

% b212
V13 = [mean([V1(1), V3(1)]), mean([V1(2), V3(2)])];
n = [-(V3(2) - V1(2)), V3(1) - V1(1)];
n13 = n / norm(n);
theta = vectorbary(n13, T);

B(3,2) = 8/(15 * theta(2)) * dot(Df(V13(1), V13(2)), n13) - ...
         1/6 * sum(pascal_vec .* B(1:5,2)) - ...
         1/6 * theta(3)/theta(2) * sum(pascal_vec .* flip(B(2:6, 1))) - ...
         1/6 * theta(1)/theta(2) * sum(pascal_vec .* B(1:5, 1));


% b122
V23 = [mean([V2(1), V3(1)]), mean([V2(2), V3(2)])];
n = [-(V2(2) - V3(2)), V2(1) - V3(1)];
n23 = n / norm(n);
theta = vectorbary(n23, T);

d5 = diag(flip(B(1:5, 1:5)));
d = diag(flip(B));
B(3,3) = 8/(15 * theta(1)) * dot(Df(V23(1), V23(2)), n23) - ...
         1/6 * sum(pascal_vec .* d5) - ...
         1/6 * theta(3)/theta(1) * sum(pascal_vec .* d(1:5)) - ...
         1/6 * theta(2)/theta(1) * sum(pascal_vec .* flip(d(2:6)));

end




function B = pomozna(V1, V2, V3, f, Df, Hf)
B = zeros(3, 3);

B(1,1) = f(V1(1), V1(2));
B(1,2) = f(V1(1), V1(2)) + 1/5 * dot(Df(V1(1), V1(2)), V2 - V1);
B(2,1) = f(V1(1), V1(2)) + 1/5 * dot(Df(V1(1), V1(2)), V3 - V1);
B(1,3) = f(V1(1), V1(2)) + 2/5 * dot(Df(V1(1), V1(2)), V2 - V1) + 1/20 * dot(V2 - V1, Hf(V1(1), V1(2)) * (V2 - V1)');
B(2,2) = f(V1(1), V1(2)) + 1/5 * dot(Df(V1(1), V1(2)), V2 - V1) + 1/5 * dot(Df(V1(1), V1(2)), V3 - V1) + 1/20 * dot(V3 - V1, Hf(V1(1), V1(2)) * (V2 - V1)');
B(3,1) = f(V1(1), V1(2)) + 2/5 * dot(Df(V1(1), V1(2)), V3 - V1) + 1/20 * dot(V3 - V1, Hf(V1(1), V1(2)) * (V3 - V1)');

end
