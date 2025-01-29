Level0_2 = Class { __includes = BaseLevel }

Level0_2.designer = "Mitinull"

function Level0_2.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.arrow = love.graphics.newImage('sprites/arrow1.png')

    self.ball = Ball(self.world, VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH - 1150,
        VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    self.basket = Basket(self.world, 1150, VIRTUAL_HEIGHT - GROUND_HEIGHT - 80, 150, 150)
    self.basket.body:setAngle(math.rad(-90))

    self.lines = Lines(self.world, {
        { VIRTUAL_WIDTH / 2 - 500, VIRTUAL_HEIGHT * 3 / 4, VIRTUAL_WIDTH / 2 + 500, VIRTUAL_HEIGHT * 3 / 4 }
    })
end

function Level0_2.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
end

function Level0_2:render()
    BaseLevel.render(self)
    love.graphics.setColor(BASKET_COLOR[1], BASKET_COLOR[2], BASKET_COLOR[3], .4)
    love.graphics.draw(self.arrow, 960, VIRTUAL_HEIGHT - GROUND_HEIGHT - 215, -90, .35, .35)
    love.graphics.setColor(PLAYER_COLOR)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(
        'Those who think\nthey know everything\nlearn nothing!', VIRTUAL_WIDTH / 2 - 500,
        VIRTUAL_HEIGHT / 2 - 450, VIRTUAL_WIDTH / 2, 'left')
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimarySemiSmall)
    love.graphics.printf(
        'Jump with the "UP" key!', VIRTUAL_WIDTH / 2 - 500,
        VIRTUAL_HEIGHT / 2 - 50, VIRTUAL_WIDTH / 2, 'left')
    self.lines:render()
    self.ball:render()
    self.player1:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
