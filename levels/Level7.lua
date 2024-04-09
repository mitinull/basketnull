Level7 = Class { __includes = BaseLevel }

Level7.designer = "Mitinull"

function Level7.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.ball = Ball(self.world, VIRTUAL_WIDTH / 8, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH / 8,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.player2 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH / 8 * 3,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.player3 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH / 8 * 5,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.player4 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH / 8 * 7,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.basket = Basket(self.world, VIRTUAL_WIDTH / 8 * 6, VIRTUAL_HEIGHT / 3, 450, 300)

    self.lines = Lines(self.world, {
        { 0,                     VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, 100,                         VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { VIRTUAL_WIDTH,         VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH - 100,         VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { VIRTUAL_WIDTH / 8 * 2, VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH / 8 * 2 - 100, VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { VIRTUAL_WIDTH / 8 * 2, VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH / 8 * 2 + 100, VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { VIRTUAL_WIDTH / 8 * 4, VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH / 8 * 4 - 100, VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { VIRTUAL_WIDTH / 8 * 4, VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH / 8 * 4 + 100, VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { VIRTUAL_WIDTH / 8 * 6, VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH / 8 * 6 - 100, VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { VIRTUAL_WIDTH / 8 * 6, VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH / 8 * 6 + 100, VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { VIRTUAL_WIDTH / 8 * 2, VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH / 8 * 2,       VIRTUAL_HEIGHT / 2 },
        { VIRTUAL_WIDTH / 8 * 4, VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH / 8 * 4,       VIRTUAL_HEIGHT / 2 },
        { VIRTUAL_WIDTH / 8 * 6, VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH / 8 * 6,       VIRTUAL_HEIGHT / 2 },
    })
end

function Level7.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
    self.player2:update(dt)
    self.player3:update(dt)
    self.player4:update(dt)
end

function Level7:render()
    love.graphics.setColor(COLOR2)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf('You care more about BEING good\nthan DOING good!', 0,
        VIRTUAL_HEIGHT / 4, VIRTUAL_WIDTH / 4 * 3, 'center')
    self.ball:render()
    self.player1:render()
    self.player2:render()
    self.player3:render()
    self.player4:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.render(self)
    self.lines:render()
end
