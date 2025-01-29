Level21 = Class { __includes = BaseLevel }

Level21.designer = "Mitinull"

function Level21.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.ball = Ball(self.world, VIRTUAL_WIDTH / 2 - 900, VIRTUAL_HEIGHT * 2 / 3 - BALL_RADIUS, BALL_RADIUS, .5,
        BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH / 2,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.basket = Basket(self.world, VIRTUAL_WIDTH / 2 + 500, VIRTUAL_HEIGHT - GROUND_HEIGHT - 125 - 5, 250, 250)
    self.basket.body:setAngle(math.rad(90))

    self.lines = Lines(self.world, {
        { VIRTUAL_WIDTH / 2 - 900, VIRTUAL_HEIGHT * 2 / 3, VIRTUAL_WIDTH / 2 + 200, VIRTUAL_HEIGHT * 2 / 3 }
    })
end

function Level21.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
end

function Level21:render()
    BaseLevel.render(self)
    love.graphics.setColor(BASKET_COLOR[1], BASKET_COLOR[2], BASKET_COLOR[3], .4)
    love.graphics.setColor(COLOR3)
    love.graphics.setFont(FontPrimarySmall)
    love.graphics.printf(
        'Press "R" to restart.',
        VIRTUAL_WIDTH / 2 - 900,
        VIRTUAL_HEIGHT / 2 - 110, VIRTUAL_WIDTH, 'left')
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(
        "In the life nothing matters;\nIt's the game that flatters.", VIRTUAL_WIDTH / 2 - 900,
        VIRTUAL_HEIGHT / 2 - 400, VIRTUAL_WIDTH, 'left')
    self.lines:render()
    self.ball:render()
    self.player1:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
