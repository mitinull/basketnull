Level1 = Class { __includes = BaseLevel }

Level1.designer = 'Mitinull'

function Level1:init(onWin)
    self.win = onWin

    self.world = love.physics.newWorld(0, GRAVITY)

    self.ground = Ground(self.world, GROUND_HEIGHT)

    -- walls
    local leftWallBody = love.physics.newBody(self.world, 0, 0, 'static')
    local rightWallBody = love.physics.newBody(self.world, VIRTUAL_WIDTH, 0, 'static')
    local wallShape = love.physics.newEdgeShape(0, 0, 0, VIRTUAL_HEIGHT)
    love.physics.newFixture(leftWallBody, wallShape)
    love.physics.newFixture(rightWallBody, wallShape)

    self.ball = Ball(self.world, VIRTUAL_WIDTH - 1086, VIRTUAL_HEIGHT / 2, BALL_RADIUS, BALL_BOUNCE, BALL_DAMPING)

    self.player1 = Player(self.world,
        VIRTUAL_WIDTH - 1050,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PLAYER_RADIUS,
        PLAYER_RADIUS, PLAYER_MASS, PLAYER_SPEED, PLAYER_JUMP, PLAYER_GSCALE,
        'left', 'right', 'up')

    self.basket = Basket(self.world, 1200, 1650, 450, 300)

    self.lines = Lines(self.world, {
        { 0,             VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, 200,                 VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { VIRTUAL_WIDTH, VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH - 200, VIRTUAL_HEIGHT - GROUND_HEIGHT },
    })

    self.ballInBasketTimer = 0
end

function Level1:update(dt)
    self.world:update(dt)
    self.player1:update(dt)

    if self.basket:ballIsInside(self.ball) then
        self.ballInBasketTimer = self.ballInBasketTimer + dt
        if self.ballInBasketTimer > 3 then
            self.win()
        end
    else
        self.ballInBasketTimer = 0
    end
end

function Level1:render()
    love.graphics.setColor(COLOR2)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf('PUT THE BALL IN THE BASKET!\nMove with "LEFT", "RIGHT" and "UP". Press "R" to restart.', 0,
        VIRTUAL_HEIGHT / 2 - 190, VIRTUAL_WIDTH, 'center')
    self.ground:render()
    self.ball:render()
    self.player1:render()
    self.basket:render()
    self.lines:render()
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.setColor(BASKET_COLOR)
    if self.ballInBasketTimer > 0 then
        love.graphics.printf(math.ceil(3 - self.ballInBasketTimer),
            self.basket.body:getX() - self.basket.width / 2, self.basket.body:getY() - 50,
            self.basket.width, 'center')
    end
    love.graphics.setColor(WHITE)
end
