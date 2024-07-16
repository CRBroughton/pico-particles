function _init()
   particles = {}


end

function _update60()
    for i = 1, 10 do
        add(particles, {
            x = 40 + rnd(20),
            y = 80 + rnd(20),
            radius = rnd(3),
            colour = 11,
            life = 5,
            speed = 1 + rnd(2)
       })
    end

    for particle in all(particles) do
       particle.y -= particle.speed
       particle.life -= 1

        if particle.life < 0 then
            del(particles, particle)
        end
    end
end

function _draw()
    cls()
    for particle in all(particles) do
        circfill(
            particle.x,
            particle.y,
            particle.radius,
            particle.colour
        )
    end
end