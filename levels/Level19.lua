Level19 = Class { __includes = BaseLevel }

Level19.designer = "Mitinull"

function Level19.init(self, onWin)
  BaseLevel.init(self, onWin)

  self.arrow = love.graphics.newImage('sprites/arrow1.png')

  self.ball = Ball(self.world, VIRTUAL_WIDTH / 6, VIRTUAL_HEIGHT / 2, BALL_RADIUS, .5, BALL_DAMPING)

  self.player1 = PlayerMediumRed(self.world,
    VIRTUAL_WIDTH - 1050,
    VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'left', 'right', 'up')

  self.player2 = PlayerMediumBlue(self.world,
    1050,
    VIRTUAL_HEIGHT - GROUND_HEIGHT - PlayerMediumRed.radius, 'a', 'd', 'w')

  self.basket = Basket(self.world, VIRTUAL_WIDTH * 5 / 6, VIRTUAL_HEIGHT / 2 + 300 - 80 - 15, 500, 160)

  self.lines = Lines(self.world,
    {
      { 0,                     VIRTUAL_HEIGHT / 2 + 300, VIRTUAL_WIDTH / 3, VIRTUAL_HEIGHT / 2 + 300 },
      { VIRTUAL_WIDTH / 3 * 2, VIRTUAL_HEIGHT / 2 + 300, VIRTUAL_WIDTH,     VIRTUAL_HEIGHT / 2 + 300 },
    })

  -- self.basket.body:setAngle(math.rad(90))
end

function Level19.update(self, dt)
  BaseLevel.update(self, dt)
  self.player1:update(dt)
  self.player2:update(dt)
end

function Level19:render()
  BaseLevel.render(self)

  love.graphics.setFont(FontPrimaryMedium)
  love.graphics.setColor(COLOR3)
  love.graphics.printf(
    "If you keep doing what you've always done,\n you'll keep getting what you've always had",
    0,
    VIRTUAL_HEIGHT / 2 - 500, VIRTUAL_WIDTH, 'center')

  self.ball:render()
  self.player1:render()
  self.player2:render()
  self.basket:render()
  self.lines:render()
  love.graphics.setColor(WHITE)
  BaseLevel.renderCountDown(self)
end
