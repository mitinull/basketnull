SeasonMenu = Class {}

function SeasonMenu:init(selected, completedSeasons, seasons)
    local cardWidth = 1000
    self.menu = Menu(selected, seasons, completedSeasons, -1750, VIRTUAL_HEIGHT / 3 + 475,
        1250, 550, 60, 5, true)
end

function SeasonMenu:update(dt)
    self.menu:update(dt)
end

function SeasonMenu:render()
    self.menu:render()

    love.graphics.setColor(COLOR5)
    love.graphics.setFont(FontPrimaryLarge)
    love.graphics.printf('BasketNull (beta)', 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(FontPrimarySmall)
    love.graphics.setColor(COLOR4)
    love.graphics.printf('Press "ENTER" to select. Press "LEFT" or "RIGHT" to navigate.',
        0, VIRTUAL_HEIGHT / 3 + 335, VIRTUAL_WIDTH, 'center')

    -- love.graphics.setFont(FontPrimarySmall)
    -- love.graphics.setColor(COLOR3)
    -- love.graphics.printf('Feel free to contribute and add a new level. (Github.com/mitinull/basketnull)',
    --     0, VIRTUAL_HEIGHT / 3 + 150, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(WHITE)
end
