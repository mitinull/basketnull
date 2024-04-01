Player = Class {}

function Player:init(world, x, y, radius, bounce, speed, leftKey, rightKey)
    self.s = speed
    self.lk = leftKey
    self.rk = rightKey

    self.body = love.physics.newBody(world, x, y, 'kinematic')

    self.shape = love.physics.newCircleShape(radius)

    self.fixture = love.physics.newFixture(self.body, self.shape)

    self.fixture:setRestitution(bounce)
end

function Player:update(dt)
    if love.keyboard.isDown(self.lk) then
        self.body:setX(self.body:getX() - self.s * dt)
    end

    if love.keyboard.isDown(self.rk) then
        self.body:setX(self.body:getX() + self.s * dt)
    end
end

function Player:render()
    love.graphics.setColor(PLAYER_COLOR)
    love.graphics.circle('fill', self.body:getX(), self.body:getY(), self.shape:getRadius())
    love.graphics.circle('line', self.body:getX(), self.body:getY(), self.shape:getRadius())
    love.graphics.setColor(WHITE)
end
