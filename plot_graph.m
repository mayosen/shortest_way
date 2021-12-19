function plot_graph(n, starts, possibles)
% Построение графа

figure(n);
xycoords = [starts.points.x; starts.points.y]';
gplot(possibles, xycoords, 'b-o');
axis([-2 11 -11 2]);
grid on;

% Нанесение номеров точек на граф
for i = 1:length(xycoords) 
    text(xycoords(i, 1) + 0.2, xycoords(i, 2) - 0.2, num2str(i)); 
end

end