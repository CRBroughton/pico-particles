function _init()
    count = 0
    newFlame = flame.new()
    polygon = polygon.new()
    rain = rain.new()
end

function _update60()
    newFlame.update()
    polygon.update()
    rain.raining()
    rain.update()

    if btnp('5') then
        count = count + 1
    end
end

function _draw()
    if count == 0 then
        cls()
        newFlame.draw()
    end

    if count == 1 then
        polygon.draw()
    end

    if count == 2 then
        cls()
        rain.draw()
    end

    if count > 2 then
        count = 0
    end
end