polygon = {}
polygon.new = function()
    local self = {
        points = {},
        vertices = 3, -- number of polygon self.vertices
    }
    function self.update()
        if (btnp(⬅️)) self.vertices -= 1
        if (btnp(➡️)) self.vertices += 1
        self.points = {}

        for a=-1,1,1 / self.vertices do
            add(self.points, {
                x = 64 + 32 * cos(a),
                y = 64 + 32 * sin(a),
            })
        end
    end

    function self.draw()
        cls()
        for i = 1, #self.points do
            local p1, p2 = self.points[i], self.points[i + 1]
            -- connect last & first point
            if (i == #self.points) p2 = self.points[1]
            line(p1.x, p1.y, p2.x, p2.y, 7)
        end
        color() cursor()
        print("vertices ".. self.vertices)
    end

    return self
end
