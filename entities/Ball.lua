Ball = Class {}

function Ball:init(world, x, y, radius, bounce, damping, color)
    self.color = color or BALL_COLOR

    self.body = love.physics.newBody(world, x, y, 'dynamic')

    self.shape = love.physics.newCircleShape(radius)

    self.fixture = love.physics.newFixture(self.body, self.shape)

    self.fixture:setRestitution(bounce)
    self.body:setAngularDamping(damping)
end

function Ball:render()
    love.graphics.setLineWidth(1)
    love.graphics.setColor(self.color)
    love.graphics.circle('fill', self.body:getX(), self.body:getY(), self.shape:getRadius())
    love.graphics.circle('line', self.body:getX(), self.body:getY(), self.shape:getRadius())
    love.graphics.setColor(WHITE)
end
