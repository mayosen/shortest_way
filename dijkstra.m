function [optimal, cost] = dijkstra(lengths)
    % Построение оптимального маршрута по алгоритму Дейкстры.

    n = size(lengths, 1);
    D = zeros(n - 1, 1);                % Вектор длин кратчайших путей
    Parents = ones(n - 1, 1);           % Вектор родителей вершин

    Ind = zeros(n, 1);                  % Вектор учтенных вершин
    Ind(1) = 1;

    for i = 2:1:n
        D(i) = lengths(1, i);
    end

    disp('Кратчайшие пути и учтенные вершины:');
    fprintf('D(%i) = ', 1);
    disp(D');
    fprintf('Ind(%i) = ', 1);
    disp(Ind(Ind>0)');

    for i = 1:1:n-1

        % Выбор вершины w такой, 
        % что она не принадлежит Ind и и D(w) минимально
        min_dw = inf;   
        w = -1;

        for j = 1:1:n
            if ismember(j, Ind)
                continue
            elseif D(j) < min_dw
                min_dw = D(j);
                w = j;
            end
        end
        
        Ind(i + 1) = w;

        fprintf('D(%i) = ', i+1);
        disp(D');
        fprintf('Ind(%i) = ', i+1);
        disp(Ind(Ind>0)');

        % Обновление расстояний до вершин
        for k = 1:1:n
            if ismember(k, Ind)
                continue
            else
                weight = D(w) + lengths(w, k);
                if weight < D(k)
                    D(k) = weight;
                    Parents(k) = w;
                end
            end 
        end
    end

    cost = D(n);
    optimal = zeros(n, 1);
    optimal(1) = n;
    i = 2;
    parent = Parents(n);

    while parent ~= 1
        optimal(i) = parent;
        parent = Parents(parent);
        i = i + 1;
    end

    optimal(i) = 1;
    optimal = flip(optimal(optimal > 0));

end


