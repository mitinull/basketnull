Level8 = Class { __includes = BaseLevel }

Level8.designer = "Mitinull"

function Level8.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.ball = Ball(self.world, VIRTUAL_WIDTH / 8, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH / 6 * 3,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.player2 = PlayerMediumBlue(self.world,
        VIRTUAL_WIDTH / 6,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'a', 'd', 'w')

    self.basket = Basket(self.world, VIRTUAL_WIDTH / 6 * 5, VIRTUAL_HEIGHT / 3 + 150, 300, 300)

    self.lines = Lines(self.world, {
        { 0,                      VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, 100,                         VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { VIRTUAL_WIDTH / 6 * 4,  VIRTUAL_HEIGHT - GROUND_HEIGHT - 200, VIRTUAL_WIDTH / 6 * 4 - 100, VIRTUAL_HEIGHT - GROUND_HEIGHT },
        { VIRTUAL_WIDTH / 6 * 4,  VIRTUAL_HEIGHT - GROUND_HEIGHT,       VIRTUAL_WIDTH / 6 * 4,       VIRTUAL_HEIGHT / 3 },
        { VIRTUAL_WIDTH / 6 * 4,  0,                                    VIRTUAL_WIDTH / 6 * 4,       VIRTUAL_HEIGHT / 3 - 300 },
        { VIRTUAL_WIDTH / 12,     VIRTUAL_HEIGHT / 3 + 600,             VIRTUAL_WIDTH / 12 * 2,      VIRTUAL_HEIGHT / 3 + 600 },
        { VIRTUAL_WIDTH / 12 * 3, VIRTUAL_HEIGHT / 3 + 300,             VIRTUAL_WIDTH / 12 * 4,      VIRTUAL_HEIGHT / 3 + 300 },
        { VIRTUAL_WIDTH / 12 * 5, VIRTUAL_HEIGHT / 3,                   VIRTUAL_WIDTH / 12 * 7,      VIRTUAL_HEIGHT / 3 },

    })
end

function Level8.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
    self.player2:update(dt)
end

function Level8:render()
    love.graphics.setColor(COLOR2)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf('How many RESTARTS\ndo you need?\nPress R\nto restart the level!',
        VIRTUAL_WIDTH / 6 * 4, VIRTUAL_HEIGHT / 2 + 200, VIRTUAL_WIDTH / 6 * 2, 'center')
    love.graphics.printf('Move the BLUE PLAYER with "A", "D" and "W"!', 0,
        VIRTUAL_HEIGHT / 8, VIRTUAL_WIDTH / 3 * 2, 'center')
    self.ball:render()
    self.player1:render()
    self.player2:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.render(self)
    self.lines:render()
end
