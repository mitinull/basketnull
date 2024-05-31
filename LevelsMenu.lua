LevelsMenu = Class {}

function LevelsMenu:init(selected, passedLevels, seasonIndex, season, onQuit)
    self.title = season.name
    self.desc = season.description
    self.quit = onQuit

    local items = {}

    for i = 1, #season.levels do
        table.insert(items, {
            ['name'] = 'level' .. i,
            ['callback'] = function(index)
                GameState:change('play', { Level = season.levels[i], season = seasonIndex, level = index })
            end,
            ['description'] = "Level Designer:\n" .. season.levels[i].designer
        })
    end

    self.menu = Menu(selected, items, passedLevels, 510, VIRTUAL_HEIGHT / 2, 500, 750, 80, 5)
end

function LevelsMenu:update(dt)
    self.menu:update(dt)

    if love.keyboard.wasPressed('q') then
        self.quit()
    end
end

function LevelsMenu:render()
    self.menu:render()

    love.graphics.setColor(BASKET_COLOR)
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf(self.title .. " : " .. self.desc, 0, VIRTUAL_HEIGHT / 2 - 450, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(FontPrimarySmall)
    love.graphics.setColor(COLOR4)
    love.graphics.printf('Press "ENTER" to select. Press "LEFT" or "RIGHT" to navigate.', 0,
        VIRTUAL_HEIGHT / 2 - 300, VIRTUAL_WIDTH,
        'center')

    love.graphics.setFont(FontPrimarySmall)
    love.graphics.setColor(COLOR4)
    love.graphics.printf('Press "Q" to go back.', 0,
        VIRTUAL_HEIGHT / 2 - 200, VIRTUAL_WIDTH,
        'center')

    love.graphics.setColor(COLOR5)
    love.graphics.setFont(FontPrimarySmall)
    love.graphics.printf('Menu[Q]', 0, 40, VIRTUAL_WIDTH - 60, 'right')
    love.graphics.setColor(WHITE)
end
