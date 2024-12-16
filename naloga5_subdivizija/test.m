B = [0 0; 2 3; 4 2; 5 -1];

t = linspace(0,1);
subt = 0.5;

for k = 1:3
    subplot(1,3,k);
    plotbezier(B,t);
    BS = beziersub(B,subt,k);

    for d = 1:length(BS)
        plotbezier(BS{d},t);
    end
end
