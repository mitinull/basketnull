PlayState = Class { __includes = BaseState }

function PlayState:init()
    self.world = love.physics.newWorld(0, GRAVITY)

    self.ground = Ground(self.world, GROUND_HEIGHT)

    -- walls
    local leftWallBody = love.physics.newBody(self.world, 0, 0, 'static')
    local rightWallBody = love.physics.newBody(self.world, WINDOWS_WIDTH, 0, 'static')
    local wallShape = love.physics.newEdgeShape(0, 0, 0, WINDOWS_HEGHT)
    love.physics.newFixture(leftWallBody, wallShape)
    love.physics.newFixture(rightWallBody, wallShape)

    self.ball = Ball(self.world, WINDOWS_WIDTH / 2, WINDOWS_HEGHT / 2, BALL_RADIUS, BALL_BOUNCE, BALL_DAMPING)

    self.player1 = Player(self.world,
        WINDOWS_WIDTH - 4 * PLAYER_RADIUS,
        WINDOWS_HEGHT - GROUND_HEIGHT - PLAYER_RADIUS,
        PLAYER_RADIUS, PLAYER_MASS, PLAYER_SPEED, PLAYER_JUMP, PLAYER_GSCALE,
        'left', 'right', 'up')

    self.player2 = Player(self.world,
        4 * PLAYER_RADIUS,
        WINDOWS_HEGHT - GROUND_HEIGHT - PLAYER_RADIUS,
        PLAYER_RADIUS, PLAYER_MASS, PLAYER_SPEED, PLAYER_JUMP, PLAYER_GSCALE,
        'a', 'd', 'w')

    self.basket = Basket(self.world, 200, 200, 100, 50)
end

function PlayState:update(dt)
    self.world:update(dt)
    self.player1:update(dt)
    self.player2:update(dt)

    if self.basket:ballIsInside(self.ball) then
        GameState:change('start')
    end

    if love.keyboard.wasPressed('r') then
        GameState:change('play')
    end

    if love.keyboard.wasPressed('e') then
        self.ball.body:destroy()
        self.ball = Ball(self.world, WINDOWS_WIDTH / 2, WINDOWS_HEGHT / 2, BALL_RADIUS, BALL_BOUNCE, BALL_DAMPING)
    end
end

function PlayState:render()
    self.ground:render()
    self.ball:render()
    self.player1:render()
    self.player2:render()
    self.basket:render()
end
