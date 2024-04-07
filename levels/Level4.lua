Level4 = Class { __includes = BaseState }

Level4.designer = "Mitinull"

function Level4:init(onWin)
    self.win = onWin

    self.world = love.physics.newWorld(0, GRAVITY)

    self.ground = Ground(self.world, GROUND_HEIGHT)

    -- walls
    local leftWallBody = love.physics.newBody(self.world, 0, -VIRTUAL_HEIGHT, 'static')
    local rightWallBody = love.physics.newBody(self.world, VIRTUAL_WIDTH, -VIRTUAL_HEIGHT, 'static')
    local wallShape = love.physics.newEdgeShape(0, 0, 0, VIRTUAL_HEIGHT * 2)
    love.physics.newFixture(leftWallBody, wallShape)
    love.physics.newFixture(rightWallBody, wallShape)

    self.ball = Ball(self.world, VIRTUAL_WIDTH / 4 * 3, VIRTUAL_HEIGHT / 2, BALL_RADIUS, BALL_BOUNCE, BALL_DAMPING)

    self.player1 = Player(self.world,
        VIRTUAL_WIDTH / 3 * 2,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PLAYER_RADIUS,
        PLAYER_RADIUS, PLAYER_MASS, PLAYER_SPEED, PLAYER_JUMP, PLAYER_GSCALE,
        'left', 'right', 'up')

    self.player2 = Player(self.world,
        VIRTUAL_WIDTH / 3,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PLAYER_RADIUS,
        PLAYER_RADIUS, PLAYER_MASS, PLAYER_SPEED, PLAYER_JUMP, PLAYER_GSCALE,
        nil, nil, nil)

    self.basket = MovingBasket(self.world, 900, VIRTUAL_HEIGHT / 2 - 100, 300, 300, 1500, VIRTUAL_HEIGHT / 2 - 100, 2)

    self.ballInBasketTimer = 0

    self.lines = Lines(self.world,
        { { VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2 - 600,             VIRTUAL_WIDTH / 2,   VIRTUAL_HEIGHT - GROUND_HEIGHT },
            { VIRTUAL_WIDTH / 2,   VIRTUAL_HEIGHT / 2 - 600,             600,                 VIRTUAL_HEIGHT / 2 - 400 },
            -- { VIRTUAL_WIDTH / 2 - 400, VIRTUAL_HEIGHT / 2 - 660, 600,                 VIRTUAL_HEIGHT / 2 - 800 },
            { VIRTUAL_WIDTH / 2,   VIRTUAL_HEIGHT / 2 - 600,             VIRTUAL_WIDTH - 600, VIRTUAL_HEIGHT / 2 - 800 },
            { VIRTUAL_WIDTH / 2,   VIRTUAL_HEIGHT / 2 - 600,             VIRTUAL_WIDTH - 600, VIRTUAL_HEIGHT / 2 - 400 },
            { VIRTUAL_WIDTH - 100, VIRTUAL_HEIGHT - GROUND_HEIGHT - 150, VIRTUAL_WIDTH - 600, VIRTUAL_HEIGHT - GROUND_HEIGHT - 150 },
            { VIRTUAL_WIDTH - 300, VIRTUAL_HEIGHT - GROUND_HEIGHT - 400, VIRTUAL_WIDTH - 800, VIRTUAL_HEIGHT - GROUND_HEIGHT - 400 },
            -- { VIRTUAL_WIDTH / 2,   VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH / 2 + 200, VIRTUAL_HEIGHT - GROUND_HEIGHT },
            { 0,                   VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, 200,                 VIRTUAL_HEIGHT - GROUND_HEIGHT },
        })

    self.ballWentLeft = false
end

function Level4:update(dt)
    if not self.ballWentLeft and self.ball.body:getX() < VIRTUAL_WIDTH / 2 then
        self.player1.lk, self.player1.rk, self.player1.jk = nil, nil, nil
        self.player2.lk, self.player2.rk, self.player2.jk = 'left', 'right', 'up'
        self.ballWentLeft = true
    end
    self.world:update(dt)
    self.player1:update(dt)
    self.player2:update(dt)
    self.basket:update(dt)

    if self.basket:ballIsInside(self.ball) then
        self.ballInBasketTimer = self.ballInBasketTimer + dt
        if self.ballInBasketTimer > 3 then
            self.win()
        end
    else
        self.ballInBasketTimer = 0
    end
end

function Level4:render()
    self.ground:render()
    self.ball:render()
    self.player1:render()
    self.player2:render()
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
