fireworks = {}

fireworks.new = function ()
    local self = {
        fireworks = {}
    }

    function spawn()
        local x = 0
        local xSpeed = 0
        local y = 0
        local ySpeed = 0
        local explode = false

        return {
            start = function(newX, newY, newXSpeed, newYSpeed)
                if done then
                    x, y, xSpeed, ySpeed, done = newX, newY, newXSpeed, newYSpeed, false
                    return true
                end
            end,

            update = function ()

            end
        }
    end

    function self.update()
        for i = 1, 10 do
            self.fireworks[i].update()
        end
    end

    function self.draw()

    end

    spawn()
    return self
end