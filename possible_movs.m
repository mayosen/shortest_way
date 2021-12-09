function [A, B] = possible_movs(conds)
% Нахождение матрицы смежности (возможных перемещений) и матрицы длин

range = conds.speed * conds.battery;
fprintf('range = %f\n', range);
points = conds.points;
n = size(points, 1);
A = zeros(n); % возможные перемещения
B = zeros(n); % длина этих перемещений

for i = 1:1:n
    for j = i+1:1:n
        dist = sqrt((points(j).x - points(i).x)^2 + ...
            (points(j).y - points(i).y)^2) * 30;
        
        if dist <= range
            A(i, j) = 1;
            A(j, i) = 1;
            B(i, j) = dist;
            B(j, i) = dist;
        else
            A(i, j) = 0;
            A(j, i) = 0;
            B(i, j) = Inf;
            B(j, i) = Inf;
        end
        
        fprintf('(%2i, %2i) %i %f\n', i, j, A(i, j), B(i, j));
        
    end
    
end

end
