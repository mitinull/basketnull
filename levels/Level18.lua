Level18 = Class { __includes = BaseLevel }

Level18.designer = "Mitinull"

function Level18.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.ball = Ball(self.world, VIRTUAL_WIDTH / 3 * 2, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH / 3 * 2,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', nil)

    self.player2 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH / 3,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, nil, nil, 'up')

    self.basket = Basket(self.world, VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2 + 200, 600, 300)
end

function Level18.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
    self.player2:update(dt)
end

function Level18:render()
    BaseLevel.render(self)
    love.graphics.setColor(PLAYER_COLOR)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(
        "If you don't think about the end first,\nyou will think about the first end.", 0,
        VIRTUAL_HEIGHT / 2 - 450, VIRTUAL_WIDTH, 'center')
    self.ball:render()
    self.player1:render()
    self.player2:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
