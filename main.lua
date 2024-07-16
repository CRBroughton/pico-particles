function _init()
   particles = {}

    add(particles, {
        x = 63,
        y = 63,
        radius = 3,
        colour = 11,
        speed = 1
   })
end

function _update60()
   
end

function _draw()
    cls()
    for particle in all(particles) do
        circfill(
            particle.x,
            particle.x,
            particle.radius,
            particle.colour
        )
    end
end