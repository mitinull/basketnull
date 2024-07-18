Level15 = Class { __includes = BaseLevel }

Level15.designer = "Mitinull"

function Level15.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.ball = Ball(self.world, love.math.random(VIRTUAL_WIDTH - BALL_RADIUS * 4) + BALL_RADIUS * 2, 300, BALL_RADIUS,
        .5, BALL_DAMPING)

    self.basket = Basket(self.world, 1000, VIRTUAL_HEIGHT - GROUND_HEIGHT - 108, 400, 200)
end

function Level15.update(self, dt)
    BaseLevel.update(self, dt)
end

function Level15:render()
    BaseLevel.render(self)
    love.graphics.setColor(COLOR3)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(
        'PRESS "R" TO RESTART!', 0,
        VIRTUAL_HEIGHT / 2 - 550, VIRTUAL_WIDTH, 'center')
    self.ball:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
