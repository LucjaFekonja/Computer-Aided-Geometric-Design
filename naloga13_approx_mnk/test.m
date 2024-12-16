[X,Y,Z] = peaks(50);
P = [(X(:)+3)/6 (Y(:)+3)/6 Z(:)];

% izračun kontrolnih točk Bezierjeve ploskve
m = 6; n = 5;
[Bx,By] = meshgrid(linspace(-3,3,m+1),linspace(-3,3,n+1));
Bz = lsqbezier2(m,n,P);

% izračun vrednosti v točkah mreže
[u,v] = deal(linspace(0,1,7));
[~,~,bz] = bezier2(Bx,By,Bz,u,v);

% maksimalna absolutna napaka v točkah mreže
[u,v] = deal(linspace(0,1,50));
[~,~,bz] = bezier2(Bx,By,Bz,u,v);
norm(bz(:)-P(:,3),Inf);

% izračun za višjo stopnjo
m = 9; n = 10;
[Bx,By] = meshgrid(linspace(-3,3,m+1),linspace(-3,3,n+1));
Bz = lsqbezier2(m,n,P);
[bx,by,bz] = bezier2(Bx,By,Bz,u,v);
norm(bz(:)-P(:,3),Inf)

% Nariši
figure;
surf(X,Y,Z);
figure;
surf(bx,by,bz);