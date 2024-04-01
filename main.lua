require 'requirements'

function love.load()
    love.window.setMode(WINDOWS_WIDTH, WINDOWS_HEGHT, { borderless = true })

    World = love.physics.newWorld(0, GRAVITY)

    Ground1 = Ground(World, GROUND_HEIGHT)

    Ball1 = Ball(World, WINDOWS_WIDTH / 2, WINDOWS_HEGHT / 2, BALL_RADIUS, BALL_BOUNCE)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
    World:update(dt)
end

function love.draw()
    Ground1:render()
    Ball1:render()
end
