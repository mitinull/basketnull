PlayerBase = Class {}

function PlayerBase:init(world, x, y, leftKey, rightKey, jumpKey, speed, jump, gScale, radius, mass, color, shape)
    self.lk = leftKey
    self.rk = rightKey
    self.jk = jumpKey
    self.speed = speed
    self.jump = jump
    self.gScale = gScale
    self.radius = radius
    self.mass = mass
    self.color = color
    self.sh = shape or 'circle'

    self.body = love.physics.newBody(world, x, y, 'dynamic')

    if self.sh == 'circle' then
        self.shape = love.physics.newCircleShape(self.radius)
    elseif self.sh == 'square' then
        self.shape = love.physics.newRectangleShape(self.radius * 2, self.radius * 2)
    elseif self.sh == 'hexagon' then
        self.shape = love.physics.newPolygonShape(-self.radius, 0, -self.radius / 2, -self.radius * math.sin(math.pi / 3),
            self.radius / 2, -self.radius * math.sin(math.pi / 3), self.radius, 0, self.radius / 2,
            self.radius * math.sin(math.pi / 3),
            -self.radius / 2, self.radius * math.sin(math.pi / 3))
    elseif self.sh == 'octagon' then
        self.shape = love.physics.newPolygonShape(
            -self.radius, 0,
            -self.radius * math.sin(math.pi / 4), -self.radius * math.sin(math.pi / 4),
            0, -self.radius,
            self.radius * math.sin(math.pi / 4), -self.radius * math.sin(math.pi / 4),
            self.radius, 0,
            self.radius * math.sin(math.pi / 4), self.radius * math.sin(math.pi / 4),
            0, self.radius,
            -self.radius * math.sin(math.pi / 4), self.radius * math.sin(math.pi / 4))
        self.body:setAngle(math.rad(45 / 2))
    end

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
    love.graphics.setLineWidth(1)
    love.graphics.setColor(self.color)
    if self.sh == 'circle' then
        love.graphics.circle('fill', self.body:getX(), self.body:getY(), self.shape:getRadius())
        love.graphics.circle('line', self.body:getX(), self.body:getY(), self.shape:getRadius())
    elseif self.sh == 'square' or self.sh == 'hexagon' or self.sh == 'octagon' then
        love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
    end
    love.graphics.setColor(WHITE)
end
