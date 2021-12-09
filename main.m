% coursework: shortest_way
% вариант 5

clear, clc, close;

% TODO: Ввод условий из файла
% TODO: Перевод время подзарядки в часы или наоборот
starts.speed = 20; % km/h
starts.battery = 5; % h
starts.charging_time = 17; % min
starts.scale = 30; % km

n = 10;
points = repmat(struct('x', 0, 'y', 0), [n 1]);
points(1) = dot(10, -8);
points(2) = dot(6, -8);
points(3) = dot(8, -7);
points(4) = dot(3, -7);
points(5) = dot(6, -5);
points(6) = dot(3, -4);
points(7) = dot(6, -2);
points(8) = dot(3, -1);
points(9) = dot(5, 0);
points(10) = dot(2, 1);

starts.points = points;
clear points;

PASSED = 0;  % пройдено шагов (они обязательны)

% пример оптимальной траектории для тестов
% opt = [1 3 5 7 9 10];
opt = zeros(n, 1);

while true
    m = menu('Find a shortest way', '1. Adjacency and Length Matrix', ...
        '2. View all points', '3. Bellman–Ford algorithm', ...
        "4. Dijkstra's algorithm", '5. Optimal trajectory', 'Exit');

    switch m
        case 1
            [possibles, lengths] = possible_movs(starts);
                        
            if PASSED < 3
                PASSED = 1;
            end
            
        case 2
            if PASSED < 1
                disp('Выполните предыдущие функции.');
                continue
            end
            
            figure(1);
            xycoords = [starts.points.x; starts.points.y]';
            gplot(possibles, xycoords, 'b-o');
            axis([-2 11 -11 2]);
            grid on;
            
            if PASSED < 3
                PASSED = 2;
            end
            
        case 3
            % TODO: Алгоритм Беллмана-Форда
            if PASSED < 2
                disp('Выполните предыдущие функции.');
                continue
            end
            
            % [opt, cost] = bellman_ford(lengths);
            
            if PASSED < 3
                PASSED = 3;
            end
            
        case 4
            if PASSED < 2
                disp('Выполните предыдущие функции.');
                continue
            end
            
            [opt, cost] = dijkstra(lengths);
            
            if PASSED < 3
                PASSED = 3;
            end
            
        case 5
            if PASSED < 3
                disp('Выполните предыдущие функции.');
                continue
            end
            
            hold on;
            trajectory = starts.points(opt);
            plot([trajectory.x], [trajectory.y], 'r-o');
            hold off;
            
        case 6
            close;
            break;
            
    end
    
end

