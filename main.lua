function _init()
   particles = {}

    for i = 1, 10 do
        add(particles, {
            x = 40 + rnd(20),
            y = 80 + rnd(20),
            radius = rnd(3),
            colour = 11,
            speed = rnd(2)
       })
    end
end

function _update60()
    for particle in all(particles) do
       particle.y -= particle.speed
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