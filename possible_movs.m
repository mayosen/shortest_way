function [A, B, err] = possible_movs(conds)
    % Нахождение матрицы смежности и матрицы длин.

    range = conds.speed * conds.battery;
    points = conds.points;
    n = size(points, 1);
    A = zeros(n);               % Возможные перемещения
    B = zeros(n);               % Длина этих перемещений
    problems = repmat(struct('i', 0, 'x', 0, 'y', 0), [n 1]);
    err = false;

    for i = 1:1:n
        for j = i+1:1:n
            dist = sqrt((points(j).x - points(i).x)^2 + ...
                (points(j).y - points(i).y)^2) * conds.scale;

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

        end

        if ~ismember(1, A(i, :))
            problems(i).i = i;
            problems(i).x = points(i).x;
            problems(i).y = points(i).y;
        end

    end

    if any([problems.i] > 0)
        err = true;
        problems = problems([problems.i] > 0);
        disp('Ошибка в построении графа.');
        disp('Обнаружены недостижимые точки:');
        fprintf('Точка №%i: (%i, %i)\n', [problems.i], ...
                [problems.x], [problems.y]);
    end

end


