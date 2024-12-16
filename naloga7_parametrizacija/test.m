P = [-5 0; -2 -1; 0 3; 3 0; 7 -1];

ue = alphaparam(P,0);
uc = alphaparam(P,0.5);
ut = alphaparam(P,1);


z = zeros(1,5);
plot(ue,z,'ro-','MarkerEdgeColor','k','MarkerFaceColor','k');

figure
plot(uc,z,'go-','MarkerEdgeColor','k','MarkerFaceColor','k');

figure
plot(ut,z,'bo-','MarkerEdgeColor','k','MarkerFaceColor','k');

D = [-5 0; -4 1; -2 -1; 0 3; 3 0; 5 2; 7 -1];
P = D([1 3 4 5 7],:);
ue = alphaparam(P,0)