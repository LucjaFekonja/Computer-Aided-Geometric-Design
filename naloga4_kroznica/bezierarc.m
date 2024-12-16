function B = bezierarc(fi,m)
% Opis:
% bezierarc izračuna kontrole točke Bezierjeve krivulje, ki
% predstavlja interpolacijo krožnega loka po izbrani metodi
%
% Definicija:
% B = bezierarc(fi,m)
%
% Vhodna podatka:
% fi kot, ki določa krozni lok v območju (-fi,fi),
% m metoda interpolacije:
% 1 = kvadratični G1 interpolant,
% 2 = kubični C1 interpolant,
% 3 = kubični G1 interpolant s C0 interpolacijo v srednji točki
%
% Izhodni podatek:
% B tabela velikosti 3 x 2 ali 4 x 2, v kateri vsaka vrstica
% predstavlja kontrolno točko Bezierjeve krivulje

if m == 1
    B = [cos(fi), -sin(fi); 1/cos(fi), 0; cos(fi), sin(fi)];

elseif m == 2
    % d1 = d2 = 1
    B = [cos(fi), -sin(fi); 
        cos(fi) + sin(fi)/3, -sin(fi) + cos(fi)/3; 
        cos(fi) + sin(fi)/3, sin(fi) - cos(fi)/3; 
        cos(fi), sin(fi)];

elseif m == 3
    % d = 4 * (1/sin(fi) - cot(fi));
    B = [cos(fi), -sin(fi); 
        4/3 - cos(fi) / 3,   4 * cot(fi) / 3 - 4 / (3 * sin(fi)) + sin(fi) / 3; 
        4/3 - cos(fi) / 3,  -4 * cot(fi) / 3 + 4 / (3 * sin(fi)) - sin(fi) / 3
        cos(fi), sin(fi)];

end

end