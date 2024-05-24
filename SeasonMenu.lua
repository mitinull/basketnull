SeasonMenu = Class {}

function SeasonMenu:init(selected, completedSeasons, seasons)
    self.margin = 700
    self.menu = Menu(selected, seasons, completedSeasons, self.margin, VIRTUAL_HEIGHT / 3 + 375,
        (VIRTUAL_WIDTH - self.margin * 2) / 3 - 30, 450, 60, 3)
end

function SeasonMenu:update(dt)
    self.menu:update(dt)
end

function SeasonMenu:render()
    self.menu:render()

    love.graphics.setColor(COLOR3)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf('BasketNull (demo)', 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(FontPrimarySmall)
    love.graphics.setColor(COLOR6)
    love.graphics.printf('Press "ENTER" to select. Press "LEFT" or "RIGHT" to navigate.',
        self.margin, VIRTUAL_HEIGHT / 3 + 250, VIRTUAL_WIDTH - self.margin * 2, 'center')
    love.graphics.setColor(WHITE)

    love.graphics.setFont(FontPrimarySmall)
    love.graphics.setColor(COLOR2)
    love.graphics.printf('Feel free to contribute and add a new level. (Github.com/mitinull/basketnull)',
        0, VIRTUAL_HEIGHT / 3 + 150, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(WHITE)
end
