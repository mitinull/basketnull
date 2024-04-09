Level6 = Class { __includes = BaseLevel }

Level6.designer = "Mitinull"

function Level6.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.ball = Ball(self.world, VIRTUAL_WIDTH - 1050, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH - 1050,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.basket = Basket(self.world, 1000, VIRTUAL_HEIGHT - GROUND_HEIGHT - 80, 450, 150)

    self.lines = Lines(self.world, {
        { 0,             VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, 100,                 VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { VIRTUAL_WIDTH, VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH - 100, VIRTUAL_HEIGHT - GROUND_HEIGHT },
    })
end

function Level6.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
end

function Level6:render()
    love.graphics.setColor(COLOR2)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf('PUT THE BALL IN THE BASKET!\nMove with "LEFT", "RIGHT" and "UP". Press "R" to restart.', 0,
        VIRTUAL_HEIGHT / 2 - 190, VIRTUAL_WIDTH, 'center')
    self.ball:render()
    self.player1:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.render(self)
    self.lines:render()
end
