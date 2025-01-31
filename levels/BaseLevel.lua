BaseLevel = Class {}

function BaseLevel:init(onWin, groundWidth)
    self.win = onWin

    self.world = love.physics.newWorld(0, GRAVITY)

    self.ground = Ground(self.world, GROUND_HEIGHT, groundWidth)

    -- walls
    local leftWallBody = love.physics.newBody(self.world, 0, 0, 'static')
    leftWallBody:setUserData({ name = 'left-wall' })
    local rightWallBody = love.physics.newBody(self.world, VIRTUAL_WIDTH, 0, 'static')
    rightWallBody:setUserData({ name = 'right-wall' })
    local wallShape = love.physics.newEdgeShape(0, -VIRTUAL_HEIGHT, 0, VIRTUAL_HEIGHT)
    love.physics.newFixture(leftWallBody, wallShape)
    love.physics.newFixture(rightWallBody, wallShape)

    self.ballInBasketTimer = 0
end

function BaseLevel:update(dt)
    self.world:update(dt)

    if self.basket:ballIsInside(self.ball) then
        self.ballInBasketTimer = self.ballInBasketTimer + dt
        if self.ballInBasketTimer > 3 then
            self.win()
        end
    else
        self.ballInBasketTimer = 0
    end
end

function BaseLevel:render()
    self.ground:render()
    love.graphics.setFont(FontPrimarySmall)
    love.graphics.setColor(COLOR3)
    love.graphics.print("Level d. : " .. self.designer, 40, 120)
    love.graphics.setColor(WHITE)
end

function BaseLevel:renderCountDown()
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.setColor(BASKET_COLOR)
    if self.ballInBasketTimer > 0 then
        love.graphics.printf(math.ceil(3 - self.ballInBasketTimer),
            self.basket.body:getX() - self.basket.width / 2, self.basket.body:getY() - 50,
            self.basket.width, 'center')
    end
end
