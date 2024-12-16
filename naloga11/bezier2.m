function [bx,by,bz] = bezier2(Bx,By,Bz,u,v)
% Opis:
% bezier2 vrne točke na Bezierjevi ploskvi iz tenzorskega produkta
%
% Definicija:
% [bx,by,bz] = bezier2(Bx,By,Bz,u,v)
%
% Vhodni podatki:
% Bx, By, Bz matrike velikosti n+1 x m+1, ki predstavljajo
% koordinate kontrolnih točk,
% u, v vrstici dolžine M in N, ki predstavljata parametre
% v smereh u in v
%
% Izhodni podatki:
% bx, by, bz matrike velikosti N x M, ki predstavljajo točke na
% Bezierjevi ploskvi: [bx(J,I) by(J,I) bz(J,I)] je
% točka pri parametrih u(I) in v(J)

N = length(v);
M = length(u);
n = length(Bx(:, 1));
m = length(Bx(1, :));

bx = zeros(N, M);
by = zeros(N, M);
bz = zeros(N, M);


% Fiksiramo parameter v
% Izračunajmo kontrolne točke za fiksen v

Bx1 = zeros(N, m);
By1 = zeros(N, m);
Bz1 = zeros(N, m);

for i = 1 : m
    % Za vsak i izračunamo kontrolne točke prvega stolpca
    Bx1(:, i) = bezier(Bx(:, i), v);
    By1(:, i) = bezier(By(:, i), v);
    Bz1(:, i) = bezier(Bz(:, i), v);
end

for j = 1 : N
    bx(j, :) = bezier(Bx1(j, :)', u);
    by(j, :) = bezier(By1(j, :)', u);
    bz(j, :) = bezier(Bz1(j, :)', u);
end