LevelsMenu = Class {}

function LevelsMenu:init()
    self.x = 510
    self.y = VIRTUAL_HEIGHT / 2
    self.width = 500
    self.height = 750
    self.gap = 80
    self.columns = 5

    self.selected = 1
    self.numLevels = 5
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
    love.graphics.setColor(COLOR2)
    for i = 1, self.numLevels do
        love.graphics.rectangle('fill', self.x + (i - 1) % self.columns * (self.width + self.gap),
            self.y + math.floor((i - 1) / self.columns) * (self.height + self.gap), self.width,
            self.height)
        if i == self.selected then
            love.graphics.setColor(COLOR4)
            love.graphics.setLineWidth(6)
            love.graphics.rectangle('line', self.x + (i - 1) % self.columns * (self.width + self.gap),
                self.y + math.floor((i - 1) / self.columns) * (self.height + self.gap),
                self.width,
                self.height)
            love.graphics.setColor(COLOR2)
        end
    end
    love.graphics.setColor(WHITE)
end
