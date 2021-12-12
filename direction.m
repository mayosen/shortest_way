function [angle] = direction(dx, dy)
% Определение направления движения по азимуту

if dx == 0
    if dy > 0
        angle = 270;
    else
        angle = 90;
    end
elseif dy == 0
    if dx > 0
        angle = 0;
    else
        angle = 180;
    end
elseif dx > 0 && dy > 0
    angle = 360 - atand(dy/dx);
elseif dx > 0 && dy < 0
    angle = 0 + atand(-dy/dx);
else
    angle = 180 - atand(dy/dx);
end  

end


