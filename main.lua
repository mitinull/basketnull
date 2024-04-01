require 'requirements'

function love.load()
    love.window.setMode(WINDOWS_WIDTH, WINDOWS_HEGHT, { borderless = true })

    World = love.physics.newWorld(0, GRAVITY)

    Ground1 = Ground(World, GROUND_HEIGHT)

    -- walls
    local leftWallBody = love.physics.newBody(World, 0, 0, 'static')
    local rightWallBody = love.physics.newBody(World, WINDOWS_WIDTH, 0, 'static')
    local wallShape = love.physics.newEdgeShape(0, 0, 0, WINDOWS_HEGHT)
    love.physics.newFixture(leftWallBody, wallShape)
    love.physics.newFixture(rightWallBody, wallShape)

    Ball1 = Ball(World, WINDOWS_WIDTH / 2, WINDOWS_HEGHT / 2, BALL_RADIUS, BALL_BOUNCE, BALL_DAMPING)

    Player1 = Player(World,
        WINDOWS_WIDTH - 4 * PLAYER_RADIUS,
        WINDOWS_HEGHT - GROUND_HEIGHT - PLAYER_RADIUS,
        PLAYER_RADIUS, PLAYER_MASS, PLAYER_SPEED, PLAYER_JUMP, PLAYER_GSCALE,
        'left', 'right', 'up')

    Player2 = Player(World,
        4 * PLAYER_RADIUS,
        WINDOWS_HEGHT - GROUND_HEIGHT - PLAYER_RADIUS,
        PLAYER_RADIUS, PLAYER_MASS, PLAYER_SPEED, PLAYER_JUMP, PLAYER_GSCALE,
        'a', 'd', 'w')

    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    if key == 'r' then
        Ball1.body:destroy()
        Ball1 = Ball(World, WINDOWS_WIDTH / 2, WINDOWS_HEGHT / 2, BALL_RADIUS, BALL_BOUNCE, BALL_DAMPING)
    end

    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    World:update(dt)
    Player1:update(dt)
    Player2:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    Ground1:render()
    Ball1:render()
    Player1:render()
    Player2:render()
end
