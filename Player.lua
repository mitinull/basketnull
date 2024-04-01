Player = Class {}

function Player:init(world, x, y, radius, mass, speed, jump, leftKey, rightKey, jumpKey)
    self.s = speed
    self.j = jump
    self.lk = leftKey
    self.rk = rightKey
    self.jk = jumpKey

    self.body = love.physics.newBody(world, x, y, 'dynamic')

    self.shape = love.physics.newCircleShape(radius)

    self.fixture = love.physics.newFixture(self.body, self.shape)

    self.body:setMass(mass)

    -- self.fixture:setRestitution(bounce)
end

function Player:update(dt)
    local dx, dy = self.body:getLinearVelocity()
    self.body:setLinearVelocity(0, dy)

    if love.keyboard.isDown(self.lk) then
        self.body:setLinearVelocity(-self.s, dy)
    end

    if love.keyboard.isDown(self.rk) then
        self.body:setLinearVelocity(self.s, dy)
    end

    if love.keyboard.wasPressed(self.jk) and math.abs(dy) < .01 then
        self.body:setLinearVelocity(0, -self.j)
    end
end

function Player:render()
    love.graphics.setColor(PLAYER_COLOR)
    love.graphics.circle('fill', self.body:getX(), self.body:getY(), self.shape:getRadius())
    love.graphics.circle('line', self.body:getX(), self.body:getY(), self.shape:getRadius())
    love.graphics.setColor(WHITE)
end
