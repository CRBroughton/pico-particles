rain = {}

rain.new = function()
    local self = {
        rainDrops = {},
        max = 500,
    }

    function self.drop() 
        local x = 0 
        local xSpeed = 0
        local y = 0
        local ySpeed = 0
        local done = true

        return {
            start = function(newX, newY, newXSpeed, newYSpeed)
                if done then
                    x, y, xSpeed, ySpeed, done = newX, newY, newXSpeed, newYSpeed, false
                    return true
                end
            end,

            update = function()
                if (done) return

                x += xSpeed
                ySpeed += 0.1
                y += ySpeed

                if y > 127 then
                    done = true
                end
            end,

            draw = function()
                if (done) return
                line(x, y, x + xSpeed, y + ySpeed, rnd(2))
            end

            
        }
    end

    function self.spawn()
        for i = 1, self.max do
            self.rainDrops[i] = self.drop()
        end
    end


    function self.raining()
        local random = rnd(5)
        for i = 1, self.max do
            if self.rainDrops[i].start(rnd(127), -random, 0, random) then
                return
            end
        end
    end

    function self.update()
        for i = 1, self.max do
            self.rainDrops[i].update()
        end
    end

    function self.draw()
        for i = 1, self.max do
            self.rainDrops[i].draw()
        end
    end

    self.spawn()
    return self
end