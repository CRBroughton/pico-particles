-- linear interpolation
-- eg. `lerp({10,20}, .5)` returns 15
function lerp(ab,t) return ab[1] + (ab[2]-ab[1])*t end

-- map a value that ranges from [-1,1] to the given interval
-- eg. use `map(cos(t()), {-3,6})` to oscillate between -3 and 6
function map(v,ab) return lerp(ab, v/2+.5) end

polygon = {}
polygon.new = function()
    local self = {
        frameCount = 0,
        points = {},
        vertices = 3, -- number of polygon self.vertices
        rotationSpeed = 1 / 8, -- rotation speed
    }
    function self.update()
        if (btnp(⬅️)) self.vertices -= 1
        if (btnp(➡️)) self.vertices += 1
        self.points = {}

        for a=-1, 1, 1 / self.vertices do
            random = map(cos(t() / 2), { 16, 48 })
            add(self.points, {
                x = 64 + random * cos(a + t() * self.rotationSpeed),
			    y = 64 + random * sin(a + t() * self.rotationSpeed),
            })
        end
    end

    function self.draw()
        cls()
        self.frameCount += 1
        for i = 1, #self.points do
            local p1, p2 = self.points[i], self.points[i + 1]
            -- connect last & first point
            if (i == #self.points) p2 = self.points[1]
            line(p1.x, p1.y, p2.x, p2.y, self.frameCount%8+8)
        end
        color() cursor()
        print("vertices ".. self.vertices)
    end

    return self
end
