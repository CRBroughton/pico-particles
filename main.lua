function _init()
   particles = {}

    for i = 1, 10 do
        add(particles, {
            x = 40 + rnd(20),
            y = 40 + rnd(20),
            radius = 1,
            colour = 11,
            speed = 1
       })
    end
end

function _update60()
   
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