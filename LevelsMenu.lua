LevelsMenu = Class {}

function LevelsMenu:init()
    self.x = 250
    self.y = 200
    self.scale = 140
    self.gap = 20
    self.columns = 5

    self.selected = 1
    self.numLevels = 9
end

function LevelsMenu:update()
    if love.keyboard.wasPressed('right') then
        self.selected = self.selected % self.numLevels + 1
    end

    if love.keyboard.wasPressed('left') then
        self.selected = (self.selected + self.numLevels - 2) % self.numLevels + 1
    end

    if love.keyboard.wasPressed('up') then
        local newInex = self.selected - self.columns
        self.selected = (newInex >= 1) and newInex or self.selected
    end

    if love.keyboard.wasPressed('down') then
        local newInex = self.selected + self.columns
        self.selected = (newInex <= self.numLevels) and newInex or self.selected
    end

    if love.keyboard.wasPressed('return') then
        GameState:change('play', self.selected)
    end
end

function LevelsMenu:render()
    love.graphics.setColor(.4, .4, .4)
    for i = 1, self.numLevels do
        love.graphics.rectangle('fill', self.x + (i - 1) % self.columns * (self.scale + self.gap),
            self.y + math.floor((i - 1) / self.columns) * (self.scale + self.gap), self.scale,
            self.scale)
        if i == self.selected then
            love.graphics.setColor(0, 1, 0)
            love.graphics.setLineWidth(4)
            love.graphics.rectangle('line', self.x + (i - 1) % self.columns * (self.scale + self.gap),
                self.y + math.floor((i - 1) / self.columns) * (self.scale + self.gap),
                self.scale,
                self.scale)
            love.graphics.setColor(.4, .4, .4)
        end
    end
    love.graphics.setColor(WHITE)
end
