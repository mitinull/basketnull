Basket = Class {}

function Basket:init(world, x, y, width, height, type)
    self.world = world
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.body = love.physics.newBody(world, x, y, type or 'static')
    self.body:setUserData({ name = 'basket' })

    self.leftShape = love.physics.newEdgeShape(-width / 2, -height / 2, -width / 2, height / 2)
    self.rightShape = love.physics.newEdgeShape(width / 2, -height / 2, width / 2, height / 2)
    self.bottomShape = love.physics.newEdgeShape(-width / 2, height / 2, width / 2, height / 2)

    self.leftFixture = love.physics.newFixture(self.body, self.leftShape)
    self.rightFixture = love.physics.newFixture(self.body, self.rightShape)
    self.bottomFixture = love.physics.newFixture(self.body, self.bottomShape)
end

function Basket:ballIsInside(ball)
    -- Get the relative position of the ball in the basket's local coordinate system
    local angle = self.body:getAngle()
    local cosAngle = math.cos(angle)
    local sinAngle = math.sin(angle)

    -- Compute the relative position
    local dx = ball.body:getX() - self.body:getX()
    local dy = ball.body:getY() - self.body:getY()
    local localX = cosAngle * dx + sinAngle * dy
    local localY = -sinAngle * dx + cosAngle * dy

    -- Check if the ball is inside the rotated basket
    return localX > -self.width / 2 and localX < self.width / 2 and
        localY > -self.height / 2 and localY < self.height / 2
end

function Basket:render()
    love.graphics.setLineWidth(12)
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.line(self.body:getWorldPoints(self.leftShape:getPoints()))
    love.graphics.line(self.body:getWorldPoints(self.bottomShape:getPoints()))
    love.graphics.line(self.body:getWorldPoints(self.rightShape:getPoints()))
    love.graphics.setColor(WHITE)
end
