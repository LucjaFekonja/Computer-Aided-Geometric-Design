function Be = bezierelv(B,k)
% Opis:
% bezierelv izvede višanje stopnje dane Bezierjeve krivulje
%
% Definicija:
% Be = bezierelv(B,k)
%
% Vhodna podatka:
% B matrika velikosti (n+1) x d, v kateri vsaka vrstica
% predstavlja d-dimenzionalno kontrolno točko Bezierjeve
% krivulje stopnje n,
% k število, ki določa, za koliko želimo zvišati stopnjo
% dane Bezierjeve krivulje
%
% Izhodni podatek:
% Be matrika velikosti (n+k+1) x d, v kateri vsaka vrstica
% predstavlja d-dimenzionalno kontrolno točko Bezierjeve
% krvulje stopnje n+k, ki ustreza dani Bezierjevi krivulji

if k == 0
    Be = B;

else
    n = length(B(:,1))-1;
    m = length(B(1,:));
    Be = zeros(n+1, m);

    for i = 1:m
        Be(1, i) = B(1,i);
        Be(n+2, i) = B(n+1, i);

        for j = 2 : n+1
            Be(j, i) = (1 - (j-1)/(n+1)) * B(j,i) + (j-1)/(n+1) * B(j-1,i);
        end

    end

    Be = bezierelv(Be, k-1);
end