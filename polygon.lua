-- linear interpolation
-- eg. `lerp({10,20}, .5)` returns 15
function lerp(ab,t) return ab[1] + (ab[2]-ab[1])*t end

-- map a value that ranges from [-1,1] to the given interval
-- eg. use `map(cos(t()), {-3,6})` to oscillate between -3 and 6
function map(v,ab) return lerp(ab, v/2+.5) end

-- like `map` but takes a value between [0,1]
function map2(v,ab) return lerp(ab, v) end

polygon = {}
polygon.new = function()
    local self = {
        frameCount = 0,
        points = {},
        vertices = 3, -- number of polygon self.vertices
        rotationSpeed = 1 / 8, -- rotation speed
        radiusSpeed = 1 / 3,
    }
    function self.update()
        if (btnp(⬅️)) self.vertices -= 1
        if (btnp(➡️)) self.vertices += 1
        self.points = {}

        for a=-1, 1, 1 / self.vertices do
            random = map(cos(t() / 2), { 16, 48 })
            -- add(self.points, {
            --     x = 64 + random * cos(a + t() * self.rotationSpeed),
			--     y = 64 + random * sin(a + t() * self.rotationSpeed),
            -- })
            add(self.points,{
                x = cos(a + t() * self.rotationSpeed),
                y = sin(a + t() * self.rotationSpeed),
            })
        end
    end

    function self.draw()
        for _=1,8000 do
            local a=0x6000+rnd(0x8000)\1
            poke(a, peek(a)*.01)
        end

        self.frameCount += 1
        for radius = 50, 20, -8 do
            for i = 1, #self.points do
                local p1, p2 = self.points[i], self.points[i + 1]
                -- connect last & first point
                if (i == #self.points) p2 = self.points[1]
                line(64 + radius * p1.x, 64 + radius * p1.y, 64 + radius * p2.x,64 + radius * p2.y, self.frameCount%8+8)
            end
        end
   
        color() cursor()
        print("\#0vertices "..self.vertices)
        print("\#0rotspd "..self.rotationSpeed)

    end

    return self
end
