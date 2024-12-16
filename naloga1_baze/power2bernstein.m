function b = power2bernstein(p)
% Opis:
% power2bernstein pretvori polinom, predstavljen s koeficienti v
% potenčni bazi, v polinom, predstavljen v Bernsteinovi bazi
%
% Definicija:
% b = power2bernstein(p)
%
% Vhodni podatek:
% p seznam koeficientov dolžine n+1, ki po vrsti pripadajo razvoju
% polinoma stopnje n v potenčni bazi od x^n do 1
%
% Izhodni podatek:
% b seznam koeficientov dolžine n+1, ki po vrsti pripadajo razvoju
% polinoma stopnje n v Bernsteinovi bazi od 0-tega do n-tega
% Bernsteinovega baznega polinoma

n = length(p)-1;
b = zeros(1, n+1);

% Za vsak i razvij x^i v Bernsteinovo bazo = vrstica v matriki
for i = 0 : n
    % Za vsak j izračunaj (j choose i) / (n choose i)
    for j = i : n
        b(j+1) = b(j+1) + p(n-i+1) * nchoosek(j, i) / nchoosek(n, i);
    end
end

   