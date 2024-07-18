Level9 = Class { __includes = BaseLevel }

Level9.designer = "You!"

function Level9.init(self, onWin)
    -- BaseLevel.init(self, onWin)

    -- self.arrow = love.graphics.newImage('sprites/arrow1.png')

    -- self.ball = Ball(self.world, VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .5, BALL_DAMPING)

    -- self.player1 = PlayerMediumRed(self.world,
    --     VIRTUAL_WIDTH - 1050,
    --     VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

    -- self.basket = Basket(self.world, 1000, VIRTUAL_HEIGHT - GROUND_HEIGHT - 160, 300, 300)
    -- self.basket.body:setAngle(math.rad(90))
end

function Level9.update(self, dt)
    -- BaseLevel.update(self, dt)
    -- self.player1:update(dt)
end

function Level9:render()
    -- BaseLevel.render(self)
    -- love.graphics.setColor(BASKET_COLOR[1], BASKET_COLOR[2], BASKET_COLOR[3], .4)
    -- love.graphics.draw(self.arrow, 810, VIRTUAL_HEIGHT - GROUND_HEIGHT - 380, -90, .4, .4)
    love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimaryLarge)
    love.graphics.printf(
        'OPEN SOURCE', 0,
        VIRTUAL_HEIGHT / 2 - 350, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(FontPrimarySemiSmall)
    love.graphics.setColor(COLOR3)
    love.graphics.printf(
        'You can contribute to this game incredibly easily.\nSimply clone the project from GitHub and modify this level.\nYour name will be attached to your level, which may move into other chapters.',
        0,
        VIRTUAL_HEIGHT / 2 + 200, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(FontPrimarySemiSmall)
    love.graphics.setColor(PLAYER_COLOR)
    love.graphics.printf(
        'Github.com/mitinull/basketnull',
        0,
        VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
    -- self.ball:render()
    -- self.player1:render()
    -- self.basket:render()
    love.graphics.setColor(WHITE)
    -- BaseLevel.renderCountDown(self)
end
