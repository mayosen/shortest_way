function [messages, takes] = nmea(starts, trajectory)
% Вывод NMEA-сообщений

format = '$UTHDG,%02i,%02i,%2.1f,%c,%2.1f,%c\n';
time = starts.time;

prev_angle = 0;
n = length(trajectory);
takes = time;
messages = strings(n, 1);

for i = 1:1:n-1
    dx = trajectory(i+1).x - trajectory(i).x;
    dy = trajectory(i+1).y - trajectory(i).y;
    dist = sqrt((dx)^2 + (dy)^2) * starts.scale;
    
    angle = direction(dx, dy);  
    
    if angle ~= prev_angle || i == 1
        turn = 'T';
    else 
        turn = 'N';
    end
    
    prev_angle = angle;
    
    mes = sprintf(format, hour(time), minute(time), dist, ....
                  turn, angle, 'N');
    messages(i) = mes;
    fprintf(mes);
    
    time = time + minutes(dist * 60 / starts.speed) + ...
           minutes(starts.charging);

end

takes = time - takes;

mes = sprintf(format, hour(time), minute(time), 0, 'N', 0, 'E');
messages(n) = mes;
fprintf(mes);

end





