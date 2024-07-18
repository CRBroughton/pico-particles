sparks = {}

--random int between l,h
function randb(l,h) --exclusive
    return flr(rnd(h-l))+l
end

sparks.new = function()
    local self = {
        particles = {},
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
                y += ySpeed
                ySpeed += 0.1

                randomDIR = rnd()
                if randomDIR > 0.5 then
                    xSpeed += 0.1

                end
                if randomDIR < 0.5 then
                    xSpeed -= 0.1

                end

                if y > 127 then
                    done = true
                end
            end,


            draw = function()
                if (done) return
                line(x, y, x + xSpeed, y + ySpeed, randb(9, 11))
            end


        }
    end

    function spawn()
        for i = 1, self.max do
            self.particles[i] = self.drop()
        end
    end

    function startSparks()
        local random = rnd(5)
        for i = 1, self.max do
            if self.particles[i].start(64, random, 0, random) then
                return
            end
        end
    end

    function self.update()
        startSparks()
        for i = 1, self.max do
            self.particles[i].update()
        end
    end

    function self.draw()
        for i = 1, self.max do
            self.particles[i].draw()
        end
    end

    spawn()
    return self
end