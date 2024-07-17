function _init()
    newFlame = flame.new()
end

function _update60()
    newFlame.update()
end

function _draw()
    cls()
    newFlame.draw()
end