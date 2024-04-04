Lines = Class {}

function Lines:init(world, points, color)
    self.body = love.physics.newBody(world, 0, 0, 'static')


    self.shapes = {}
    for i = 1, #points do
        table.insert(self.shapes, love.physics.newEdgeShape(points[i][1], points[i][2], points[i][3], points[i][4]))
    end

    self.fixtures = {}
    for i = 1, #points do
        table.insert(self.fixtures, love.physics.newFixture(self.body, self.shapes[i]))
    end

    self.color = color or BASKET_COLOR
end

function Lines:render()
    love.graphics.setLineWidth(12)
    love.graphics.setColor(self.color)
    for i = 1, #self.shapes do
        love.graphics.line(self.body:getWorldPoints(self.shapes[i]:getPoints()))
    end
    love.graphics.setColor(WHITE)
end
