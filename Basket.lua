Basket = Class {}

function Basket:init(world, x, y, scale)
    self.body = love.physics.newBody(world, x, y, 'static')

    self.leftShape = love.physics.newEdgeShape(-scale, -scale, -scale, scale)
    self.rightShape = love.physics.newEdgeShape(scale, -scale, scale, scale)
    self.bottomShape = love.physics.newEdgeShape(-scale, scale, scale, scale)

    self.leftFixture = love.physics.newFixture(self.body, self.leftShape)
    self.rightFixture = love.physics.newFixture(self.body, self.rightShape)
    self.bottomFixture = love.physics.newFixture(self.body, self.bottomShape)
end

function Basket:render()
    love.graphics.setLineWidth(2)
    love.graphics.line(self.body:getWorldPoints(self.leftShape:getPoints()))
    love.graphics.line(self.body:getWorldPoints(self.bottomShape:getPoints()))
    love.graphics.line(self.body:getWorldPoints(self.rightShape:getPoints()))
end
