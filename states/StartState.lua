StartState = Class { __includes = BaseState }

function StartState:init()
    self.menu = LevelsMenu()
end

function StartState:update(dt)
    self.menu:update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function StartState:render()
    love.graphics.setColor(0, 1, 0)
    love.graphics.printf('Press enter to start', 0, 100, WINDOWS_WIDTH, 'center')
    love.graphics.setColor(WHITE)

    self.menu:render()
end
