StartState = Class { __includes = BaseState }

function StartState:enter(params)
    local seasons = {
        {
            ['name'] = 'Chapter 0:',
            ['description'] = 'Warm Up!',
            ['levels'] = { Level00, Level0_2, Level0_3, Level0_4, Level0_5 }
        },
        {
            ['name'] = 'Chapter 1:',
            ['description'] = 'Time to Play!',
            ['levels'] = { Level1, Level2, Level3, Level4, Level5 },
        },
        {
            ['name'] = 'Chapter 2:',
            ['description'] = 'Creativity!',
            ['levels'] = { Level6, Level7, Level8 }
        }
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
        if params.level then
            goToLevelMenu(params.season, params.level)
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
