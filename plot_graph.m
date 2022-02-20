function plot_graph(n, starts, possibles, offset)
    % Построение графа.

    figure(n);
    xycoords = [starts.points.x; starts.points.y]';
    gplot(possibles, xycoords, 'b-o');
    axis([min([starts.points.x]) - offset, ...
        max([starts.points.x]) + offset, ...
        min([starts.points.y]) - offset, ...
        max([starts.points.y]) + offset]);
    grid on;

    % Нанесение номеров точек на граф
    for i = 1:length(xycoords) 
        text(xycoords(i, 1) + 0.2, xycoords(i, 2) - 0.2, num2str(i)); 
    end

end


