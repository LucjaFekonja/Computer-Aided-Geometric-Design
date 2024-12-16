function D = decasteljau(b,t)
% Opis:
% decasteljau vrne shemo de Casteljaujevega postopka za dan seznam
% koordinat b pri danem parametru t
%
% Definicija:
% D = decasteljau(b,t)
%
% Vhodna podatka:
% b seznam koordinat kontrolnih točk Bezierjeve krivulje
% stopnje n,
% t parameter, pri katerem računamo koordinato Bezierjeve
% krivulje
%
% Izhodni podatek:
% D tabela velikosti n+1 x n+1, ki predstavlja de Casteljaujevo
% shemo za koordinate b pri parametru t (element na mestu
% (1,n+1) je koordinata Bezierjeve krivulje pri parametru t,
% elementi na mestih (i,j) za i > n-j+2 so NaN)

n = length(b);
D = NaN(n+1);
D(1:n, 1) = b;

% Izračun b^r ... r-ti korak
for r = 2:n
    for i = 1:n-1
        D(i, r) = (1-t) * D(i, r-1) + t * D(i+1, r-1);
        if i > n-r+1
            D(i, r) = NaN;
        end
    end
end

D = D(1:n, 1:n);