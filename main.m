% coursework
% shortest_way

clear, clc, close;

% TODO: Ввод условий из файла
% вариант 5
starts.speed = 20; % km/h
starts.battery_life = 5; % h
% TODO: Перевод время подзарядки в часы или наоборот
starts.charging_time = 17; % min
% TODO: Координаты точки в виде структуры
starts.startpoint.x = 10;
starts.startpoint.y = -8;
starts.endpoint.y = -8;
starts.endpoint.x = 8;
starts.scale = 30; % km

while true
    m = menu('Make a choice', 'Map', 'Exit');

    switch m
        case 1
            % нарисовать карту просто с вершинами, чтобы представить
        case 2
            break;
    end
end
