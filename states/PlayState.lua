PlayState = Class { __includes = BaseState }

function PlayState:init()
    self.levels = {
        [1] = Level1,
        [2] = Level2
    }
end

function PlayState:enter(level)
    self.levelNumber = level
    self.level = self.levels[level]()
end

function PlayState:update(dt)
    self.level:update(dt)

    if love.keyboard.wasPressed('r') then
        GameState:change('play', self.levelNumber)
    end

    if love.keyboard.wasPressed('escape') then
        GameState:change('start')
    end
end

function PlayState:render()
    self.level:render()
end
