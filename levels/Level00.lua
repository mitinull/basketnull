Level00 = Class { __includes = BaseLevel }

Level00.designer = "Mitinull"

function Level00.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.arrow = love.graphics.newImage('sprites/arrow1.png')

    self.ball = Ball(self.world, VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH - 1050,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.basket = Basket(self.world, 1000, VIRTUAL_HEIGHT - GROUND_HEIGHT - 160, 300, 300)
    self.basket.body:setAngle(math.rad(90))
end

function Level00.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
end

function Level00:render()
    BaseLevel.render(self)
    love.graphics.setColor(BASKET_COLOR[1], BASKET_COLOR[2], BASKET_COLOR[3], .4)
    love.graphics.draw(self.arrow, 810, VIRTUAL_HEIGHT - GROUND_HEIGHT - 380, -90, .4, .4)
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(
        'KEEP THE BALL IN THE BASKET\nFOR 3 SECONDS!', 850,
        VIRTUAL_HEIGHT / 2 - 350, VIRTUAL_WIDTH, 'left')
    love.graphics.setFont(FontPrimarySemiSmall)
    love.graphics.setColor(COLOR3)
    love.graphics.printf(
        'Move with the "LEFT", "RIGHT" and "UP" keys.',
        850,
        VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'left')
    self.ball:render()
    self.player1:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
