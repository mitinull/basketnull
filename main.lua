require 'requirements'

function love.load()
    love.window.setMode(WINDOWS_WIDTH, WINDOWS_HEGHT, { borderless = true })

    World = love.physics.newWorld(0, GRAVITY)

    Ground1 = Ground(World, GROUND_HEIGHT)

    Ball1 = Ball(World, WINDOWS_WIDTH / 2, WINDOWS_HEGHT / 2, BALL_RADIUS, BALL_BOUNCE, BALL_DAMPING)

    Player1 = Player(World,
        WINDOWS_WIDTH - 4 * PLAYER_RADIUS,
        WINDOWS_HEGHT - GROUND_HEIGHT - PLAYER_RADIUS,
        PLAYER_RADIUS, PLAYER_BOUNCE, PLAYER_SPEED, 'left', 'right')

    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    World:update(dt)
    Player1:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    Ground1:render()
    Ball1:render()
    Player1:render()
end
