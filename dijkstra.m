function [opt, cost] = dijkstra(lengths)
% Алгоритм Дейкстры
  
n = size(lengths, 1);
D = zeros(n - 1, 1);                % Вектор длин кратчайших путей
P = ones(n - 1, 1);                 % Вектор родителей вершин

Ind = zeros(n, 1);                  % Вектор учтенных вершин
Ind(1) = 1;

for i = 2:1:n
    D(i) = lengths(1, i);
end

fprintf('D(%02i) = ', 1);
fprintf('%6.1f ', D);
fprintf('\nInd(%02i) = ', 1);
fprintf('%i ', Ind(Ind>0));
fprintf('\n\n');

for i = 1:1:n-1
    
    % выбор вершины w, такой что она не принадлежит Ind и 
    % и D(w) минимально
    min_dw = inf;   
    w = -1;
    
    for j = 1:1:n
        if ismember(j, Ind)
            continue
        elseif D(j) < min_dw
            min_dw = D(j);
            w = j;
        else
            continue
        end
    end
    Ind(i + 1) = w;
    
    fprintf('D(%02i) = ', i + 1);
    fprintf('%6.1f ', D);
    fprintf('\nInd(%02i) = ', i + 1);
    fprintf('%i ', Ind(Ind>0));
    fprintf('\n\n');
    
    % обновление расстояний до вершин
    for k = 1:1:n
        if ismember(k, Ind)
            continue
        else
            weight = D(w) + lengths(w, k);
            if weight < D(k)
                D(k) = weight;
                P(k) = w;
            % иначе вес оставляем прежним
            end
        end 
    end
    
end

cost = D(n);

opt = zeros(n, 1);
opt(1) = n;
parent = P(n);

i = 2;
while parent ~= 1
    opt(i) = parent;
    parent = P(parent);
    i = i + 1;
end

opt(i) = 1;
opt = flip(opt(opt > 0));

end






