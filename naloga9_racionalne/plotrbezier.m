function p = plotrbezier(B, w, t)

    %  Farinove točke
    q = zeros(length(w), 2);
    for i = 1 : length(w)-1
        q(i, :) = w(i) / (w(i) + w(i+1)) * B(i, :) + w(i+1) / (w(i) + w(i+1)) * B(i+1, :);
    end

    figure;
    hold on
    % Kontrilni poligon
    plot(B(:,1), B(:,2), "ko-");

    % Racionalna beziejeva krivulja
    b = rbezier(B, w, t);
    p = plot(b(:,1), b(:,2));

    % Farinove točke
    plot(q(:, 1), q(:, 2), "o");
    
    hold off
