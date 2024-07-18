rain = {}

rain.new = function()
    local self = {
        particles = {}
        
    }

    function self.update()
        for i = 1, 5 do
            add(self.particles, {
                x = 0 + rnd(128),
                y = 0 + rnd(4),
                colour = 1,
                life = 128
            })
        end

        for particle in all(self.particles) do
            particle.y += 1
            particle.life -= 1

            if particle.life <= 0  then
                del(self.particles, particle)
            end
        end
    end

    function self.draw()
        cls()
        for particle in all(self.particles) do
            rectfill(
                particle.x,
                particle.y,
                particle.x,
                particle.y + 2,
                particle.colour
            )
        end
    end

    return self
end