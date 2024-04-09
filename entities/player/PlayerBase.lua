PlayerBase = Class {}

function PlayerBase:init(world, x, y, leftKey, rightKey, jumpKey, speed, jump, gScale, radius, mass, color)
    self.lk = leftKey
    self.rk = rightKey
    self.jk = jumpKey
    self.speed = speed
    self.jump = jump
    self.gScale = gScale
    self.radius = radius
    self.mass = mass
    self.color = color

    self.body = love.physics.newBody(world, x, y, 'dynamic')

    self.shape = love.physics.newCircleShape(self.radius)

    self.fixture = love.physics.newFixture(self.body, self.shape)

    self.body:setMass(self.mass)
    self.body:setGravityScale(self.gScale)
end

function PlayerBase:update(dt)
    local dx, dy = self.body:getLinearVelocity()
    self.body:setLinearVelocity(0, dy)

    if self.lk and love.keyboard.isDown(self.lk) then
        self.body:setLinearVelocity(-self.speed, dy)
    end

    if self.rk and love.keyboard.isDown(self.rk) then
        self.body:setLinearVelocity(self.speed, dy)
    end

    if self.jk and love.keyboard.wasPressed(self.jk) and math.abs(dy) < .01 then
        self.body:setLinearVelocity(0, -self.jump)
    end
end

function PlayerBase:render()
    love.graphics.setColor(self.color)
    love.graphics.circle('fill', self.body:getX(), self.body:getY(), self.shape:getRadius())
    love.graphics.circle('line', self.body:getX(), self.body:getY(), self.shape:getRadius())
    love.graphics.setColor(WHITE)
end
