function p = plotbezier(B,t, c)
% Opis:
% plotbezier nariše Bezierjevo krivuljo za dane kontrolne točke in
% seznam parametrov
%
% Definicija:
% p = plotbezier(B,t,c)
%
% Vhodni podatki:
% B matrika velikosti n+1 x d, ki predstavlja kontrolne točke
% Bezierjeve krivulje stopnje n v d-dimenzionalnem prostoru,
% t seznam parametrov dolžine k, pri katerih računamo vrednost
% Bezierjeve krivulje,
% c opcijski parameter, ki določa barvo krivulje
%
% Izhodni podatek:
% p grafični objekt, ki določa krivuljo


% c je optional
if ~exist('c','var')
    % third parameter does not exist, so default it to something
    c = "b";
end

figure;
hold on;
if size(B, 2) == 2
    % Kontrilni poligon
    plot(B(:,1), B(:,2), "ko-");

    % Beziejeva krivulja
    b = bezier(B, t);
    p = plot(b(:,1), b(:,2), Color=c);

elseif size(B, 2) == 3
    plot3(B(:,1), B(:,2), B(:,3), "ko-");

    b = bezier(B, t);
    p = plot(b(:,1), b(:,2), b(:,3), Color=c);
end
hold off;

end