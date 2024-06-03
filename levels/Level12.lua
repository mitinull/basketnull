Level12 = Class { __includes = BaseLevel }

Level12.designer = "Mitinull"

function Level12.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.ball = Ball(self.world, VIRTUAL_WIDTH / 2 + 600, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH / 2 + 600,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.player2 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH / 2 - 600,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, nil, nil, nill)

    self.basket = MovingBasket(self.world, 900, VIRTUAL_HEIGHT / 2 + 300, 400, 300, 1500, VIRTUAL_HEIGHT / 2 + 300, 2)

    self.lines = Lines(self.world,
        {
            { VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2 - 350, VIRTUAL_WIDTH / 2,   VIRTUAL_HEIGHT - GROUND_HEIGHT },
            { VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2 - 350, 600,                 VIRTUAL_HEIGHT / 2 - 50 },
            { VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2 - 350, VIRTUAL_WIDTH - 600, VIRTUAL_HEIGHT / 2 - 650 },
            { VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2 - 350, VIRTUAL_WIDTH - 600, VIRTUAL_HEIGHT / 2 - 50 },
        })

    self.steps = Lines(self.world,
        {
            { 0,                   VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, 200,                 VIRTUAL_HEIGHT - GROUND_HEIGHT },
            { VIRTUAL_WIDTH - 200, VIRTUAL_HEIGHT - GROUND_HEIGHT - 250, VIRTUAL_WIDTH - 800, VIRTUAL_HEIGHT - GROUND_HEIGHT - 250 },
        },
        COLOR5
    )
end

function Level12.update(self, dt)
    if self.player1.lk ~= nil and not self.ballWentLeft and self.ball.body:getX() < VIRTUAL_WIDTH / 2 then
        self.player1.lk, self.player1.rk, self.player1.jk = nil, nil, nil
        self.player2.lk, self.player2.rk, self.player2.jk = 'left', 'right', 'up'
        self.ballWentLeft = true
    end
    BaseLevel.update(self, dt)
    self.player1:update(dt)
    self.player2:update(dt)
    self.basket:update(dt)
end

function Level12:render()
    BaseLevel.render(self)
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(
        "YOU CAN DO IT!", VIRTUAL_WIDTH / 2 + 175,
        VIRTUAL_HEIGHT / 2 + 200, VIRTUAL_WIDTH, 'left')
    love.graphics.setFont(FontPrimarySemiSmall)
    love.graphics.setColor(COLOR3)
    love.graphics.printf(
        'Press the "R" key to restart.',
        VIRTUAL_WIDTH / 2 + 175,
        VIRTUAL_HEIGHT / 2 + 325, VIRTUAL_WIDTH, 'left')
    self.ball:render()
    self.player1:render()
    self.player2:render()
    self.basket:render()
    self.lines:render()
    self.steps:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
