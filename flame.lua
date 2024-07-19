flame = {}

flame.new = function()
    local self = {
        particles = {},
        force = 0,
        forceDirection = 0.02,
    }

    function moveFire() 
        if self.force < -0.5 or self.force > rnd(0.5) then
            self.forceDirection = self.forceDirection * -1
        end
        self.force += self.forceDirection
    end

    function self.update()
        moveFire()

        for i = 1, 5 do
            add(self.particles, {
                x = 61 + rnd(3),
                y = 60 + rnd(6),
                radius = rnd(3),
                colour = 10,
                life = rnd(35),
                speed = 1 + rnd(2)
           })
        end
    
        for particle in all(self.particles) do
            particle.y -= 1
            particle.x += self.force
            particle.radius -= 0.1
            particle.life -= 1
    
            if particle.life < 20 then
                particle.colour = 9
            end

            if particle.life < 10 then
                particle.colour = 2
            end
    
            if particle.life < 0 then
                del(self.particles, particle)
            end
        end
    end

    function self.draw()
        for particle in all(self.particles) do
            circfill(
                particle.x,
                particle.y,
                particle.radius,
                particle.colour
            )
        end
    end
    

    return self
end