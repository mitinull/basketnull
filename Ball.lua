Ball = Class {}

function Ball:init(world, x, y, radius, bounce)
    self.body = love.physics.newBody(world, x, y, 'dynamic')

    self.shape = love.physics.newCircleShape(radius)

    self.fixture = love.physics.newFixture(self.body, self.shape)

    self.fixture:setRestitution(bounce)
end

function Ball:render()
    love.graphics.setColor(BALL_COLOR)
    love.graphics.circle('fill', self.body:getX(), self.body:getY(), self.shape:getRadius())
    love.graphics.circle('line', self.body:getX(), self.body:getY(), self.shape:getRadius())
    love.graphics.setColor(WHITE)
end
