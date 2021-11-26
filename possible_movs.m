function [A, B, C] = possible_movs(conds)
% Нахождение матрицы смежности (возможных перемещений) и матрицы длин

range = conds.speed * conds.battery;
points = conds.points;
n = size(points, 1);
A = zeros(n); % возможные перемещения
B = zeros(n); % их длина в км
C = zeros(n); % время в минутах

for i = 1:1:n
    for j = i+1:1:n
        dist = sqrt((points(j).x - points(i).x)^2 + ...
            (points(j).y - points(i).y)^2) * 30;
        
        if dist <= range
            A(i, j) = 1;
            A(j, i) = 1;
            B(i, j) = dist;
            B(j, i) = dist;
            d = dist / (conds.speed / 60) + conds.charging_time;
            C(i, j) = d;
            C(j, i) = d;
        else
            A(i, j) = 0;
            A(j, i) = 0;
            B(i, j) = Inf;
            B(j, i) = Inf;
            C(i, j) = Inf;
            C(j, i) = Inf;
        end
        
        fprintf('(%2i, %2i) %i %f\n', i, j, A(i, j), B(i, j));
        
    end
    
end

end
