fireworks = {}

fireworks.new = function ()
    local self = {
        rockets = {}
    }

    function self.drop()
        local x = -50
        local xSpeed = 0
        local y = -128
        local ySpeed = 0
        local explode = true

        return {
            start = function(newX, newY, newXSpeed, newYSpeed)
                if explode then
                    x, y, xSpeed, ySpeed, explode = newX, newY, newXSpeed, newYSpeed, false
                    return true
                end
            end,

            update = function()
                if (explode) return
                y -= 1

                if y < 30 then
                    explode = true
                end
            end,

            draw = function()
                if (explode) return
                line(x, y, x + xSpeed, y + ySpeed, 6)
            end
        }
    end

    function startFireworks()
        local random = rnd(5)
        for i = 1, 10 do
            if self.rockets[i].start(64, 100, 0, random) then
                return
            end
        end
    end
    function self.update()
        startFireworks()
        for i = 1, 10 do
            self.rockets[i].update()
        end
    end

    function self.draw()
        for i = 1, 10 do
            self.rockets[i].draw()

        end
    end


    function spawn()
        for i = 1, 10 do
            self.rockets[i] = self.drop()
        end
    end
    spawn()
    return self
end