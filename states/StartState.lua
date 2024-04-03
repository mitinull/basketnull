StartState = Class { __includes = BaseState }

function StartState:update(dt)
    if love.keyboard.wasPressed('return') then
        GameState:change('play')
    end
end

function StartState:render()
    love.graphics.setColor(0, 1, 0)
    love.graphics.printf('Press enter to start', 0, WINDOWS_HEGHT / 2, WINDOWS_WIDTH, 'center')
    love.graphics.setColor(WHITE)
end
