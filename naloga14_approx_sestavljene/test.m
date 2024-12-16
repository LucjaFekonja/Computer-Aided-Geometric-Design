addpath("C:\School\CAGD\naloga13_approx_mnk\")
addpath("C:\School\CAGD\naloga11\")
addpath("C:\School\CAGD\naloga2_decasteljau\")

% podatki
[X,Y,Z] = peaks(50);
P = [(X(:)+3)/6 (Y(:)+3)/6 Z(:)];

% izračun koeficientov zlepka
M = 5; N = 4; m = 3; n = 4;
Sz = lsqbezier2spline(M,N,m,n,P);

s22 = Sz{2, 2};
s12 = Sz{1,2};


% izračun točk na sestavljeni ploskvi
[bx,by,bz] = deal(zeros(50));

% pomožni parametri
U = linspace(0,1,M+1);
V = linspace(0,1,N+1);

[u,v] = deal(linspace(0,1,50));
[Bx0,By0] = meshgrid(linspace(0,1,m+1),linspace(0,1,n+1));

for I = 1:M

    % točke na lokalnem intervalu
    ur = U(I) <= u & u <= U(I+1);

    for J = 1:N
        % točke na lokalnem intervalu
        vr = V(J) <= v & v <= V(J+1);

        % lokalni parametri
        ul = (u(ur)-U(I))/(U(I+1)-U(I));
        vl = (v(vr)-V(J))/(V(J+1)-V(J));

        % kontrolne točke
        Bx = 6*((U(I+1)-U(I))*Bx0+U(I))-3;
        By = 6*((V(J+1)-V(J))*By0+V(J))-3;
        Bz = Sz{J,I};

        % izračun točk
        [bx(vr,ur),by(vr,ur),bz(vr,ur)] = bezier2(Bx,By,Bz,ul,vl);
    end
end

% maksimalna absolutna napaka
norm(Z(:)-bz(:),Inf)


% izris
surf(X,Y,Z);
surf(bx,by,bz);