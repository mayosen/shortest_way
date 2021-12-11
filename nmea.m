function nmea(starts, trajectory)
% Вывод NMEA-сообщений

% TODO: сделаем-ка тут проверку длины пути
% будем суммировать и в конце выведем
time = starts.time;
charging = starts.charging_time;

format = '$UTHDG,%02i,%3.1f,%5.2f,%c,%3.1f,%c\n';
angle_prev = 0;

for i = 1:1:length(trajectory)
    hours = str2num(datestr(time, 'HH'));
    minutes = str2num(datestr(time, 'mm'));
    
    % расчет длины до ближайшей вершины
    % выходит за пределы массива скорее всего
    x1 = trajectory(i).x;
    y1 = trajectory(i).y;
    x2 = trajectory(i+1).x;
    y2 = trajectory(i+1).y;
    dist = sqrt((x1 - x2)^2 + (y1 - y2)^2) * 30;
    
    angle = 270 + atand((x2 - x1)/(y2 - y1));  
    
    % остаток от деления на 360?
    % еще проблема, что atand возращает углы от -90 до 90
    
    if (angle == angle_prev) || (i == 1)
        turn = 'T';
    else
        turn = 'N';
    end
    
    
    fprintf(format, hours, minutes, dist, turn, angle, 'N');
    
    angle_prev = angle;


end


end





