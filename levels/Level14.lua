Level14 = Class { __includes = BaseLevel }

Level14.designer = "Mitinull"

function Level14.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.ball = Ball(self.world, VIRTUAL_WIDTH - 1050, 300, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH - 1050,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.basket = Basket(self.world, 1000, VIRTUAL_HEIGHT - GROUND_HEIGHT - 108, 1000, 200)

    self.lines = Lines(self.world, {
        { VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT - GROUND_HEIGHT },
    })
end

function Level14.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
end

function Level14:render()
    BaseLevel.render(self)
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimarySemiLarge)
    love.graphics.printf(
        string.upper('life is\nto short\nto play it\nsafe!'), 535,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - 400, VIRTUAL_HEIGHT, 'left', -math.pi / 2)
    love.graphics.setColor(PLAYER_COLOR)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(
        'Need a restart?\n Press "r" to restart!', VIRTUAL_WIDTH - 2000,
        VIRTUAL_HEIGHT / 2 + 200, 2000, 'center')
    -- love.graphics.setColor(BASKET_COLOR)
    -- love.graphics.setFont(FontPrimarySemiSmall)
    -- love.graphics.printf(
    --     'YOU PROBABELY NEED A RESTART!\nPRESS "R" TO RESTART!', 0,
    --     VIRTUAL_HEIGHT / 2 + 200, 2000, 'center')
    self.lines:render()
    self.ball:render()
    self.player1:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
