PlayState = Class { __includes = BaseState }

function PlayState:init()
    self.countDown = 1.5
end

function PlayState:enter(params)
    local handleWin = function()
        if not PassedLevels[params.season] then
            PassedLevels[params.season] = {}
        end
        local passedLevels = {}
        for i = 1, #PassedLevels[params.season] do
            passedLevels[PassedLevels[params.season][i]] = true
        end
        if not passedLevels[params.level] then
            table.insert(PassedLevels[params.season], params.level)
        end
        GameState:change('start', { season = self.season, level = self.levelNumber + 1 })
    end
    self.Level = params.Level
    self.level = params.Level(handleWin)
    self.season = params.season
    self.levelNumber = params.level
end

function PlayState:update(dt)
    if self.countDown > 0 then
        self.countDown = self.countDown - dt
    else
        self.level:update(dt)
    end


    if love.keyboard.wasPressed('r') then
        GameState:change('play', { Level = self.Level, season = self.season, level = self.levelNumber })
    end

    if love.keyboard.wasPressed('q') then
        GameState:change('start', { season = self.season, level = self.levelNumber })
    end
end

function PlayState:render()
    self.level:render()
    if self.countDown > 0 then
        love.graphics.setColor(0, 0, 0, .5)
        love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
        love.graphics.setColor(COUNTDOWN_COLOR)
        love.graphics.setFont(FontPrimaryLarge)
        love.graphics.printf(math.ceil(self.countDown * 2), 0, VIRTUAL_HEIGHT / 2 - 128, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(WHITE)
    end

    love.graphics.setColor(COLOR3)
    love.graphics.setFont(FontPrimarySmall)
    love.graphics.printf('Menu[q]', 0, 40, VIRTUAL_WIDTH - 60, 'right')
    love.graphics.setFont(FontPrimaryMedium)
    love.graphics.printf('Restart[r]', 0, 120, VIRTUAL_WIDTH - 60, 'right')
    love.graphics.setColor(WHITE)
end
