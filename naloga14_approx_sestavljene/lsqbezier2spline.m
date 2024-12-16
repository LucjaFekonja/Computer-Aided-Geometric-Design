function S = lsqbezier2spline(M,N,m,n,P)
% Opis:
% lsqbezier2spline vrne kontrolne točke tenzorskih polinomov, ki
% določajo zvezno odvedljiv zlepek, ki v smislu metode najmanjših
% kvadratov najbolje aproksimira dane podatke
%
% Definicija:
% S = lsqbezier2spline(M,N,m,n,P)
%
% Vhodni podatki:
% M,N parametra, ki določata delitev domene parametrizacije,
% m,n parametra, ki določata stopnjo polinoma nad pravokotnikom
% delitve,
% P matrika podatkov, ki v vsaki vrstici vsebuje parametra z
% intervala [0,1] ter njima pripadajočo vrednost
%
% Izhodni podatek:
% S celica velikosti N x M, v kateri vsak element vsebuje
% matriko s koeficienti polinoma, ki določa zlepek nad
% pravokotnikom delitve domene

% Delitev domene
U = linspace(0, 1, M+1);
V = linspace(0, 1, N+1);

% Celica za shranjevanje koeficientov
S = cell(N, M);

for I = 1:M
    for J = 1:N

        % Ogljišča trenutnega pravokotnika
        U1 = U(I);
        U2 = U(I+1);
        V1 = V(J);
        V2 = V(J+1);

        % Opazovan pravokotnik
        mask = P(:,1) >= U1 & P(:,1) <= U2 & P(:,2) >= V1 & P(:,2) <= V2;
        P_sub = P(mask, :);

        % Novi parametri u in v
        u = (P_sub(:, 1) - U1) / (U2 - U1);
        v = (P_sub(:, 2) - V1) / (V2 - V1);
        f = P_sub(:, 3);

        % Izračunaj aproksimacijo z MNK na tem manjšem pravokotniku
        B = lsqbezier2(m, n, [u, v, f]);
    
        % PRIREDI ROBOVE!!
        if J > 1
            Bj = S{J-1, I};
            B(1, :) = (Bj(n, :) + B(2, :)) / 2;

            % Popravimo zadnji stolpec v S(J-1, I)
            Bj(n+1, :) = B(1, :);
            S{J-1, I} = Bj;
        end

        if I > 1
            Bi = S{J, I-1};
            B(:, 1) = (Bi(:, m) + B(:, 2)) / 2;

            Bi(:, m+1) = B(:, 1);
            S{J, I-1} = Bi;
        end 

        if I > 1 && J > 1
            Bi = S{J, I-1};
            Bj = S{J-1, I};
            Bij = S{J-1, I-1};
            B(1, 1) = (B(2, 2) + Bi(2, m) + Bj(n, 2) + Bij(n, m)) / 4;

            Bi(1, m+1) = B(1, 1);
            S{J, I-1} = Bi;

            Bj(n+1, 1) = B(1, 1);
            S{J-1, I} = Bj;

            Bij(n+1, m+1) = B(1, 1);
            S{J-1, I-1} = Bij;
        end
        
        % Shrani
        S{J, I} = B;

    end
end