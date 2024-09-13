StartState = Class { __includes = BaseState }

function StartState:enter(params)
    local seasons = {
        {
            ['name'] = 'Chapter 0',
            ['description'] = 'Warm Up!',
            ['levels'] = { Level00, Level0_2, Level14, Level20, Level0_4, Level0_5 }
        },
        {
            ['name'] = 'Chapter 1',
            ['description'] = 'Time to Play!',
            ['levels'] = { Level10, Level13, Level11, Level12, Level7, Level8, },
        },
        {
            ['name'] = 'Chapter 2',
            ['description'] = 'Creativity!',
            ['levels'] = { Level15, Level16, Level19, Level18 }
        },
        {
            ['name'] = 'Chapter 3',
            ['description'] = 'Your Chapter!',
            ['levels'] = { Level9 }
        },
        -- {
        --     ['name'] = 'Chapter 4',
        --     ['description'] = 'Test Chamber!',
        --     ['levels'] = { Level18, Level17 }
        -- }
    }

    local goToSeasonMenu = function(s)
        local completedSeasons = {}
        for i = 1, #seasons do
            if PassedLevels[i] and #PassedLevels[i] == #seasons[i]['levels'] then
                table.insert(completedSeasons, i)
            end
        end
        self.menu = SeasonMenu(s, completedSeasons, seasons)
    end

    local goToLevelMenu = function(s, l)
        self.menu = LevelsMenu(math.min(l, #seasons[s]['levels']), PassedLevels[s] or {}, s, seasons[s], function()
            goToSeasonMenu(s)
        end)
    end

    for i = 1, #seasons do
        seasons[i]['callback'] = function()
            goToLevelMenu(i, 1)
        end
    end

    if params then
        if params.level - 1 == #seasons[params.season]['levels'] then
            goToSeasonMenu(params.season + 1)
        else
            goToLevelMenu(params.season, params.level)
        end
    else
        goToSeasonMenu(1)
    end
end

function StartState:update(dt)
    self.menu:update(dt)

    -- if love.keyboard.wasPressed('escape') then
    --     love.event.quit()
    -- end
end

function StartState:render()
    self.menu:render()
end
