Level0_4 = Class { __includes = BaseLevel }

Level0_4.designer = "Mitinull"

function Level0_4.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.ball = Ball(self.world, 300, 300, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH - 1050,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.basket = Basket(self.world, 1000, VIRTUAL_HEIGHT - GROUND_HEIGHT - 108, 400, 200)

    self.lines = Lines(self.world, {
        { VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT - GROUND_HEIGHT },
    })

    self.ramps = Lines(self.world, {
        { 0, VIRTUAL_HEIGHT - GROUND_HEIGHT - 300, 300, VIRTUAL_HEIGHT - GROUND_HEIGHT },
    }, COLOR5)

    self.stairs = Lines(self.world, {
        { VIRTUAL_WIDTH / 2 + 300,  VIRTUAL_HEIGHT / 2 + 200, VIRTUAL_WIDTH / 2 + 600,  VIRTUAL_HEIGHT / 2 + 200 },
        { VIRTUAL_WIDTH / 2 + 800,  VIRTUAL_HEIGHT / 2 + 450, VIRTUAL_WIDTH / 2 + 1100, VIRTUAL_HEIGHT / 2 + 450 },
        { VIRTUAL_WIDTH / 2 + 1300, VIRTUAL_HEIGHT / 2 + 700, VIRTUAL_WIDTH / 2 + 1600, VIRTUAL_HEIGHT / 2 + 700 },
    }, COLOR5)
end

function Level0_4.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
end

function Level0_4:render()
    BaseLevel.render(self)
    love.graphics.setColor(BASKET_COLOR[1], BASKET_COLOR[2], BASKET_COLOR[3], .4)
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(
        'Press "R" to try again!', 0,
        VIRTUAL_HEIGHT / 2 - 450, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(COLOR5)
    love.graphics.setFont(FontPrimarySemiSamall)
    love.graphics.printf(
        '“Be yourself; everyone else is already taken.”', 0,
        VIRTUAL_HEIGHT / 2 - 600, VIRTUAL_WIDTH, 'center')
    self.lines:render()
    self.ramps:render()
    self.stairs:render()
    self.ball:render()
    self.player1:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
