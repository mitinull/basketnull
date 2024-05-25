Level0_3 = Class { __includes = BaseLevel }

Level0_3.designer = "Mitinull"

function Level0_3.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.ball = Ball(self.world, 300, 300, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH - 1050,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.basket = Basket(self.world, 1000, VIRTUAL_HEIGHT - GROUND_HEIGHT - 108, 400, 200)

    self.lines = Lines(self.world, {
        { 0, VIRTUAL_HEIGHT / 2 + 50, VIRTUAL_WIDTH - 300, VIRTUAL_HEIGHT / 2 + 350 },
    })

    self.ramps = Lines(self.world, {
        { 1000 - 200, VIRTUAL_HEIGHT - GROUND_HEIGHT - 150, 1000 - 350, VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { 1000 + 200, VIRTUAL_HEIGHT - GROUND_HEIGHT - 150, 1000 + 350, VIRTUAL_HEIGHT - GROUND_HEIGHT },
    }, COLOR5)
end

function Level0_3.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
end

function Level0_3:render()
    BaseLevel.render(self)
    love.graphics.setColor(BASKET_COLOR[1], BASKET_COLOR[2], BASKET_COLOR[3], .4)
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimarySemiSamall)
    love.graphics.printf(
        "As you wait for better days, don't forget to enjoy today,\n in case they've already started.", 0,
        VIRTUAL_HEIGHT / 2 - 350, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(COLOR5)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(
        'PLEASE WAIT...', 0,
        VIRTUAL_HEIGHT / 2 - 500, VIRTUAL_WIDTH, 'center')
    self.lines:render()
    self.ramps:render()
    self.ball:render()
    self.player1:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
