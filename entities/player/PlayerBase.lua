PlayerBase = Class {}

local function isPlayerCollidingWithLine(playerBody, playerShape, linesBody, lineShape)
    -- Get world coordinates of the line segment
    local x1, y1, x2, y2 = linesBody:getWorldPoints(lineShape:getPoints())
    -- Get player's position and radius
    local px, py = playerBody:getPosition()
    local pr = playerShape:getRadius()

    -- offsets
    local offset1 = 60 -- player collision offset
    local offset2 = 50 -- line should be this much bellow player's y to be able to jump

    -- Vector from line start to end
    local lineDX, lineDY = x2 - x1, y2 - y1
    local lineLengthSquared = lineDX * lineDX + lineDY * lineDY

    -- Avoid division by zero in case of a degenerate line (zero length)
    if lineLengthSquared == 0 then
        return (px - x1) ^ 2 + (py - y1) ^ 2 <= pr * pr
    end

    -- Projection factor "t" (clamped between 0 and 1 to stay within the segment)
    local t = ((px - x1) * lineDX + (py - y1) * lineDY) / lineLengthSquared
    t = math.max(0, math.min(1, t)) -- Clamping to stay in segment range

    -- Compute the closest point on the segment
    local closestX = x1 + t * lineDX
    local closestY = y1 + t * lineDY

    -- Compute distance from circle center to the closest point
    local distSquared = (px - closestX) ^ 2 + (py - closestY) ^ 2

    -- If the distance is less than or equal to the radius squared, collision occurs
    return distSquared <= pr * pr + offset1 and closestY > py + offset2
end


function PlayerBase:init(world, x, y, leftKey, rightKey, jumpKey, speed, jump, gScale, radius, mass, color, shape, sfr)
    self.world = world
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
    self.face = 'kid'

    self.body = love.physics.newBody(world, x, y, 'dynamic')
    self.body:setUserData({ name = 'player' })

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

    if self.face == 'kid' then
        self.faceSprite = love.graphics.newImage('sprites/face2.png')
    end

    self.fixture = love.physics.newFixture(self.body, self.shape)

    self.body:setMass(self.mass)
    self.body:setGravityScale(self.gScale)
    self.body:setFixedRotation(sfr or false)
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

    if self.jk and love.keyboard.wasPressed(self.jk) then
        local canJump = false

        if (math.abs(dy) < .01) then
            canJump = true
        else
            -- jump on lines and ramps
            for _, body in ipairs(self.world:getBodies()) do
                local name = body:getUserData().name

                if name == 'lines' then
                    local lines = body:getUserData().shapes
                    for _, line in ipairs(lines) do
                        if isPlayerCollidingWithLine(self.body, self.shape, body, line) then
                            canJump = true
                        end
                    end
                end
            end
        end

        if canJump then
            self.body:setLinearVelocity(0, -self.jump)
        end
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
    love.graphics.draw(self.faceSprite, self.body:getX(), self.body:getY(), 0, .3, .3, 316, 300)
end
