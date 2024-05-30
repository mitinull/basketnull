Level0_5 = Class { __includes = BaseLevel }

Level0_5.designer = "Mitinull"

function Level0_5.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.ball = Ball(self.world, 300, VIRTUAL_HEIGHT / 2 + 300 - BALL_RADIUS, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH - 750,
        VIRTUAL_HEIGHT / 2 + 300 - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.player2 = PlayerOctagonMedium(self.world,
        750,
        VIRTUAL_HEIGHT / 2 + 300 - PlayerMediumRed.radius, 'a', 'd', nil, COLOR9)

    self.basket = Basket(self.world, 750, VIRTUAL_HEIGHT - GROUND_HEIGHT - 110, 200, 200)
    self.basket.body:setAngle(math.rad(-90))

    self.lines = Lines(self.world, {
        { 0,             VIRTUAL_HEIGHT / 2 + 400, 1500,                 VIRTUAL_HEIGHT / 2 + 400 },
        { VIRTUAL_WIDTH, VIRTUAL_HEIGHT / 2 + 400, VIRTUAL_WIDTH - 1000, VIRTUAL_HEIGHT / 2 + 400 },
    })

    self.ramps = Lines(self.world, {
        { 850, VIRTUAL_HEIGHT - GROUND_HEIGHT - 100, 1000, VIRTUAL_HEIGHT - GROUND_HEIGHT },
    }, COLOR5)
end

function Level0_5.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
    self.player2:update(dt)
end

function Level0_5:render()
    BaseLevel.render(self)
    love.graphics.setColor(BASKET_COLOR[1], BASKET_COLOR[2], BASKET_COLOR[3], .4)
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(
        "I'm glad there is you!", 0,
        VIRTUAL_HEIGHT / 2 - 350, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(COLOR5)
    love.graphics.setFont(FontPrimarySmall)
    love.graphics.printf(
        'In this world of overrated pleasures\nand underrated treasures,', 0,
        VIRTUAL_HEIGHT / 2 - 500, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(COLOR9)
    love.graphics.setFont(FontPrimarySemiSmall)
    love.graphics.printf(
        'Move the blue player with "A" and "D".', 0,
        VIRTUAL_HEIGHT / 2 - 150, VIRTUAL_WIDTH, 'center')
    self.lines:render()
    self.ramps:render()
    self.ball:render()
    self.player1:render()
    self.player2:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
