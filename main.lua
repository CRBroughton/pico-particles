function _init()
    particles = {}
    force = 0
    forceDirection = 0.02
end

function moveFire()
    if force < -0.5 or force > rnd(0.5) then
        forceDirection = forceDirection * -1
    end
    force += forceDirection
end

function _update60()
    moveFire()

    for i = 1, 5 do
        add(particles, {
            x = 61 + rnd(3),
            y = 60 + rnd(6),
            radius = rnd(3),
            colour = 10,
            life = rnd(35),
            speed = 1 + rnd(2)
       })
    end

    for particle in all(particles) do
        particle.y -= 1
        particle.x += force
        particle.radius -= 0.1
        particle.life -= 1

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