Level20 = Class { __includes = BaseLevel }

Level20.designer = "RezaTaheri01"
basket_width = 250
basket_height = 300
ground = GROUND_HEIGHT + 200

function Level20.init(self, onWin)
    BaseLevel.init(self, onWin)

    self.arrow = love.graphics.newImage('sprites/arrow1.png')

    self.ball = Ball(self.world, VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .5, BALL_DAMPING)

    self.player1 = PlayerMediumRed(self.world,
        VIRTUAL_WIDTH / 5 * 4,
        VIRTUAL_HEIGHT / 5, 'left', 'right', 'up')

    -- place bascket on ground
    self.basket = Basket(self.world, 1000, VIRTUAL_HEIGHT - (basket_height / 2) - ground, basket_width, basket_height)
    self.basket.body:setAngle(math.rad(0))
end

function Level20.update(self, dt)
    BaseLevel.update(self, dt)
    self.player1:update(dt)
end

function Level20:render()
    BaseLevel.render(self)
    love.graphics.setColor(BASKET_COLOR[1], BASKET_COLOR[2], BASKET_COLOR[3], .4)
    love.graphics.draw(self.arrow, 800, VIRTUAL_HEIGHT - ground - 360, -90, .5, .5)
    -- love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimaryLarge)
    love.graphics.setColor(COLOR3)
    love.graphics.printf(
        'It\'s all on your head :)',
        0,
        VIRTUAL_HEIGHT / 4, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(PLAYER_COLOR)
    self.ball:render()
    self.player1:render()
    self.basket:render()
    love.graphics.setColor(WHITE)
    BaseLevel.renderCountDown(self)
end
