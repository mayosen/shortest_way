function [points] = file_read(name)
% Чтение координат точек из файла

data = readlines(name);
n = length(data) - 1;
points = repmat(struct('x', 0, 'y', 0), [n 1]);

for i = 1:1:n
    coords = sscanf(data(i), "%i %i\n");
    points(i) = dot(coords(1), coords(2));
end

end


function [self] = dot(x, y)
% Формирование структуры с координатами точки

self = struct;
self.x = x;
self.y = y;

end


