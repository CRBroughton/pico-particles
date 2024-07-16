function _init()
    particles = {}
    force = -3
    forced = 1
end

function _update60()
    force += 0.1 * forced
    if force > 3 or force < -3 then
        forced = forced * -1
    end

    for i = 1, 20 do
        add(particles, {
            x = 40 + rnd(20),
            y = 90 + rnd(10),
            radius = rnd(3),
            colour = 10,
            life = 10,
            speed = 1 + rnd(2)
       })
    end

    for particle in all(particles) do
        particle.y -= particle.speed
        particle.life -= 1
        particle.radius -= 0.1
        particle.x += force

        if particle.life < 5 then
            particle.colour = 9
        end

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