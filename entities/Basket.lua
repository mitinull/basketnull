Basket = Class {}

function Basket:init(world, x, y, width, height, type)
    self.world = world
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.body = love.physics.newBody(world, x, y, type or 'static')

    self.leftShape = love.physics.newEdgeShape(-width / 2, -height / 2, -width / 2, height / 2)
    self.rightShape = love.physics.newEdgeShape(width / 2, -height / 2, width / 2, height / 2)
    self.bottomShape = love.physics.newEdgeShape(-width / 2, height / 2, width / 2, height / 2)

    self.leftFixture = love.physics.newFixture(self.body, self.leftShape)
    self.rightFixture = love.physics.newFixture(self.body, self.rightShape)
    self.bottomFixture = love.physics.newFixture(self.body, self.bottomShape)
end

function Basket:ballIsInside(ball)
    return ball.body:getX() < self.body:getX() + self.width / 2 and
        ball.body:getX() > self.body:getX() - self.width / 2 and
        ball.body:getY() < self.body:getY() + self.height / 2 and
        ball.body:getY() > self.body:getY() - self.height / 2
end

function Basket:render()
    love.graphics.setLineWidth(12)
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.line(self.body:getWorldPoints(self.leftShape:getPoints()))
    love.graphics.line(self.body:getWorldPoints(self.bottomShape:getPoints()))
    love.graphics.line(self.body:getWorldPoints(self.rightShape:getPoints()))
    love.graphics.setColor(WHITE)
end
