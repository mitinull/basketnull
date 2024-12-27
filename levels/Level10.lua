Level10 = Class { __includes = BaseLevel }

Level10.designer = "Mitinull"

function Level10.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.arrow = love.graphics.newImage('sprites/arrow1.png')

    self.ball = Ball(self.world, VIRTUAL_WIDTH - 1050, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH - 1050,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.basket = Basket(self.world, 850, VIRTUAL_HEIGHT / 2 + 75, 820, 560)
    self.basket.body:setAngle(math.rad(5))
end

function Level10.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
end

function Level10:render()
    BaseLevel.render(self)
    love.graphics.setColor(COLOR2[1], COLOR2[2], COLOR2[3], .4)
    love.graphics.draw(self.arrow, 1200, VIRTUAL_HEIGHT / 2 - 200, math.rad(-100), 0.8, -0.8)
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(
        'Greetings, Player!\nTry and fail,\nbut never fail to try!', 1400,
        VIRTUAL_HEIGHT / 2 - 200, VIRTUAL_WIDTH, 'left')
    love.graphics.setFont(FontPrimarySemiSmall)
    love.graphics.setColor(COLOR3)
    love.graphics.printf(
        'You can restart the level\nas many times as you want!',
        1400,
        VIRTUAL_HEIGHT / 2 + 150, VIRTUAL_WIDTH, 'left')
    self.ball:render()
    self.player1:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
