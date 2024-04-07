Level6 = Class { __includes = BaseLevel }

Level6.designer = "Mitinull"

function Level6.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.ball = Ball(self.world, 1000, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .3, BALL_DAMPING)

    self.player1 = Player(self.world,
        VIRTUAL_WIDTH - 1050,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PLAYER_RADIUS,
        PLAYER_RADIUS, PLAYER_MASS, PLAYER_SPEED, PLAYER_JUMP, PLAYER_GSCALE,
        'left', 'right', 'up')

    self.basket = Basket(self.world, 1000, VIRTUAL_HEIGHT - GROUND_HEIGHT - 80, 450, 150)
end

function Level6.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
end

function Level6:render()
    love.graphics.setColor(COLOR2)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf('Temp Level', 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
    self.ball:render()
    self.player1:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.render(self)
end
