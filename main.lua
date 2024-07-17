function _init()
    count = 0
    newFlame = flame.new()
    polygon = polygon.new()
end

function _update60()
    newFlame.update()
    polygon.update()

    if btnp('5') then
        count = count + 1
    end

    if count > 3 then
        count = 0
    end
end

function _draw()
    if count > 0 and count < 2 then
        newFlame.draw()
    end

    if count > 2 then
        polygon.draw()
    end
end