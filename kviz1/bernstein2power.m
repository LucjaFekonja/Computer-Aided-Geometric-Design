function p = bernstein2power(b)
% Opis:
% bernstein2power pretvori polinom, predstavljen s koeficienti v
% Bernsteinovi bazi, v polinom, predstavljen v potenčni bazi
%
% Definicija:
% p = bernstein2power(b)
%
% Vhodni podatek:
% b seznam koeficientov dolžine n+1, ki po vrsti pripadajo razvoju
% polinoma stopnje n v Bernsteinovi bazi od 0-tega do n-tega
% Bernsteinovega baznega polinoma
%
% Izhodni podatek:
% b seznam koeficientov dolžine n+1, ki po vrsti pripadajo razvoju
% polinoma stopnje n v potenčni bazi od x^n do 1

n = length(b)-1;
p = zeros(1, n+1);

% Za vsak i razvij x^i v Bernsteinovo bazo = vrstica v matriki
for i = 0 : n
    % Za vsak j izračunaj (j choose i) / (n choose i)
    for j = i : n
        p(n-j+1) = p(n-j+1) + b(i+1) * (-1)^(i+j) * nchoosek(n, j) * nchoosek(j, i);
    end
end

   