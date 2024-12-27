Level13 = Class { __includes = BaseLevel }

Level13.designer = "Mitinull"

function Level13.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.arrow = love.graphics.newImage('sprites/arrow1.png')

    self.ball = Ball(self.world, VIRTUAL_WIDTH - 1050, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH - 1050,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.basket = Basket(self.world, 1200, VIRTUAL_HEIGHT / 2 + 75, 550, 950)
    self.basket.body:setAngle(math.rad(90))
end

function Level13.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
end

function Level13:render()
    BaseLevel.render(self)
    love.graphics.setColor(COLOR3[1], COLOR3[2], COLOR3[3], .4)
    love.graphics.draw(self.arrow, 1550, VIRTUAL_HEIGHT / 2 + 365, math.rad(160), -.7, .7)
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(
        "Keep the ball in the basket\nfor 3 seconds!", VIRTUAL_WIDTH - 1200 - 475,
        VIRTUAL_HEIGHT / 2 - 160, VIRTUAL_WIDTH, 'left')
    love.graphics.setColor(COLOR3)
    love.graphics.setFont(FontPrimarySemiSmall)
    love.graphics.printf(
        'Be gentle!\nPress "R" to retry.', VIRTUAL_WIDTH - 1200 - 475,
        VIRTUAL_HEIGHT / 2 + 90, VIRTUAL_WIDTH, 'left')
    self.ball:render()
    self.player1:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
