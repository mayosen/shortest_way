function [A] = possible_movs(conds)
% Нахождение матрицы смежности (возможных перемещений)

range = conds.speed * conds.battery / conds.scale;
points = conds.points;
n = size(points, 1);
A = zeros(n);

for i = 1:1:n
    for j = i+1:1:n
        dist = sqrt((points(j).x - points(i).x)^2 + ...
            (points(j).y - points(i).y)^2);
        
        if dist <= range
            A(i, j) = 1;
            A(j, i) = 1;
        else
            A(i, j) = 0;
            A(j, i) = 0;
        end
        
        % fprintf('(%2i, %2i) %i %f\n', i, j, A(i, j), dist);
        
    end
    
end

end
