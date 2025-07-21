function B = beziercubspline(u, D)
    % Description:
    % beziercubspline computes a composite cubic Bézier curve that is twice
    % continuously differentiable at joints.
    %
    % Input:
    % u - vector of partition parameters, length m+1
    % D - matrix of control points (m+3 rows, 2 columns)
    %
    % Output:
    % B - cell array of length m, where each cell is a 4x2 matrix of control
    %     points for each segment of the composite curve.

    % Number of segments
    m = length(u) - 1;
    
    % Initialize the cell array for control points of each Bézier segment
    B = cell(1, m);
    
    % Compute delta_u for each interval
    delta_u = diff(u);
    
    % Step 1: Boundary conditions for the first and last segments
    B{1} = zeros(4, 2);
    B{m} = zeros(4, 2);
    
    % Fill in the boundary control points using provided formulas
    B{1}(1, :) = D(1, :); 
    B{1}(2, :) = D(2, :); 
    B{1}(3, :) = (delta_u(2) * D(2, :) + delta_u(1) * D(3, :)) / (delta_u(1) + delta_u(2));
    
    % Similarly, compute the last segment's boundary control points
    B{m}(2, :) = (delta_u(m) * D(m+1, :) + delta_u(m-1) * D(m+2, :)) / (delta_u(m-1) + delta_u(m));
    B{m}(3, :) = D(m+2, :);
    B{m}(4, :) = D(m+3, :); 
    
    % Step 2: Calculate the control points for interior segments (i = 2, ..., m-1)
    for i = 1 : m-2
        
        B{i+1} = zeros(4, 2);
        
        % Control points for the segment i using formulas from the task
        B{i+1}(2, :) = ((delta_u(i+1) + delta_u(i+2)) * D(i+2,:) + delta_u(i) * D(i+3,:)) / (delta_u(i) + delta_u(i+1) + delta_u(i+2));
        B{i+1}(3, :) = (delta_u(i+2) * D(i+2,:) + (delta_u(i) + delta_u(i+1)) * D(i+3,:)) / (delta_u(i) + delta_u(i+1) + delta_u(i+2));
        B{i+1}(1, :) = (delta_u(i+1) * B{i}(3, :) + delta_u(i) * B{i+1}(2, :)) / (delta_u(i+1) + delta_u(i));
        B{i}(4, :) = B{i+1}(1, :);
    end

    B{m}(1, :) = (delta_u(m) * B{m-1}(3, :) + delta_u(m-1) * B{m}(2, :)) / (delta_u(m) + delta_u(m-1));
    B{m-1}(4, :) = B{m}(1, :);
end
