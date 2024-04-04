StartState = Class { __includes = BaseState }

function StartState:enter(selected)
    self.menu = LevelsMenu(selected)
end

function StartState:update(dt)
    self.menu:update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function StartState:render()
    love.graphics.setColor(COLOR3)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf('BasketNull (demo)', 0, VIRTUAL_HEIGHT / 2 - 300, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(FontPrimarySmall)
    love.graphics.setColor(COLOR2)
    love.graphics.printf('Feel free to contribute and add a new level. (Github.com/mitinull/basketnull)', 0,
        VIRTUAL_HEIGHT / 2 - 175, VIRTUAL_WIDTH,
        'center')
    love.graphics.setColor(WHITE)

    self.menu:render()
end
