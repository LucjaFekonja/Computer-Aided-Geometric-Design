
addpath("C:\School\CAGD\naloga2_decasteljau\")

% kontrolne točke Bezierjeve ploskve
Bx = [0 3 5 6; 1 4 5 7; 0 3 5 6];
By = [-1 -2 -1 -2; 1 2 1 2; 5 5 6 5];
Bz = [-3 -2 0 -5; 3 6 3 2; -1 4 -2 8];

% izračun točk na ploskvi nad mrežo parametrov velikosti 7 x 7
[u,v] = deal(linspace(0,1,7));
[bx, by, bz] = bezier2(Bx,By,Bz,u,v)


[u,v] = deal(linspace(0,1,50));
plotbezier2(Bx,By,Bz,u,v);