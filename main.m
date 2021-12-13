% coursework "shortest_way"
% var 5

clear, clc, close;

starts.speed = 20;                  % km/h
starts.battery = 5;                 % h
starts.charging = 17;               % min
starts.scale = 30;                  % km
starts.time = datetime('14:00', 'InputFormat', 'HH:mm');

PASSED = 0;

while true
    m = menu('Find a shortest way', ...
        'Load data', ...
        'Build graph', ...
        'View graph', ... 
        "Dijkstra's algorithm", ...
        'View trajectory', ...
        'NMEA', ...
        'Save data', ...
        'Exit');
    
    switch m
        case 1
            starts.points = file_read('coords.txt');
            PASSED = 1;
            
        case 2
            if PASSED < 1
                disp('Выполните предыдущие шаги.');
                continue
            elseif PASSED == 1
                [possibles, lengths] = possible_movs(starts);
                PASSED = 2;
            else
                continue
            end
                                    
        case 3
            if PASSED < 2
                disp('Выполните предыдущие шаги.');
                continue
            end
            
            plot_graph(1, starts, possibles);
            
        case 4
            if PASSED < 2
                disp('Выполните предыдущие шаги.');
                continue
            elseif PASSED == 2
                [opt, cost] = dijkstra(lengths);
                PASSED = 3;
            else
                continue
            end
            
        case 5
            if PASSED < 3
                disp('Выполните предыдущие шаги.');
                continue
            end
            
            close;
            plot_graph(1, starts, possibles);
            hold on;
            trajectory = starts.points(opt);
            plot([trajectory.x], [trajectory.y], 'r-o');
            hold off;
        
        case 6
            if PASSED < 3
                disp('Выполните предыдущие шаги.');
                continue
            end
            
            [messages, takes] = nmea(starts, trajectory);
            PASSED = 4;
        
        case 7
            if PASSED < 4
                disp('Выполните предыдущие шаги.');
                continue
            end
            
            file_write('results.txt', opt, cost, messages, takes);
                        
        case 8
            % close;
            break;
            
    end
    
end



