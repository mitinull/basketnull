Menu = Class {}

function Menu:init(selected, items, highlightedItems, x, y, w, h, g, c, rs)
    self.x = x
    self.y = y
    self.width = w
    self.height = h
    self.gap = g
    self.columns = c
    self.reversedSize = rs or false

    self.selected = selected or 1
    self.items = items
    self.hItems = highlightedItems
end

function Menu:update(dt)
    if love.keyboard.wasPressed('right') then
        self.selected = self.selected % #self.items + 1
    end

    if love.keyboard.wasPressed('left') then
        self.selected = (self.selected + #self.items - 2) % #self.items + 1
    end

    if love.keyboard.wasPressed('up') then
        local newInex = self.selected - self.columns
        self.selected = (newInex >= 1) and newInex or self.selected
    end

    if love.keyboard.wasPressed('down') then
        local newInex = self.selected + self.columns
        self.selected = (newInex <= #self.items) and newInex or self.selected
    end

    if love.keyboard.wasPressed('return') then
        self.items[self.selected]['callback'](self.selected)
    end
end

function Menu:render()
    love.graphics.translate(-(self.selected - math.ceil(self.columns / 2)) * (self.gap + self.width), 0)

    local highlightedItmes = {}
    for i = 1, #self.hItems do
        highlightedItmes[self.hItems[i]] = true
    end

    for i = 1, #self.items do
        if highlightedItmes[i] then
            love.graphics.setColor(BASKET_COLOR[1], BASKET_COLOR[2], BASKET_COLOR[3], math.max(0, 1 - math.abs(self.selected - i) * .3))
        elseif i == self.selected then
            love.graphics.setColor(COLOR5)
        else
            love.graphics.setColor(COLOR2[1], COLOR2[2], COLOR2[3], math.max(0, 1 - math.abs(self.selected - i) * .3))
            -- love.graphics.setColor(COLOR2)
            -- if math.abs(self.selected - i) > 1 then
            --     love.graphics.setColor(COLOR2[1], COLOR2[2], COLOR2[3], .3)
            -- end
        end
        love.graphics.rectangle('fill', self.x + (i - 1) % self.columns * (self.width + self.gap),
            self.y + math.floor((i - 1) / self.columns) * (self.height + self.gap), self.width,
            self.height)
        if i == self.selected then
            love.graphics.setColor(COLOR1)
            love.graphics.setLineWidth(18)
            love.graphics.rectangle('line', self.x + (i - 1) % self.columns * (self.width + self.gap),
                self.y + math.floor((i - 1) / self.columns) * (self.height + self.gap),
                self.width,
                self.height)
            love.graphics.setColor(COLOR4)
            love.graphics.setLineWidth(8)
            love.graphics.rectangle('line', self.x + (i - 1) % self.columns * (self.width + self.gap),
                self.y + math.floor((i - 1) / self.columns) * (self.height + self.gap),
                self.width,
                self.height)
        end
        love.graphics.setColor(COLOR1)
        love.graphics.setFont(self.reversedSize and FontPrimarySmall or FontPrimaryMedium)
        love.graphics.printf(self.items[i]['name'], self.x + (i - 1) % self.columns * (self.width + self.gap),
            self.y + math.floor((i - 1) / self.columns) * (self.height + self.gap) + 135,
            self.width,
            'center')
        if self.items[i]['description'] then
            love.graphics.setFont(self.reversedSize and FontPrimaryMedium or FontPrimarySmall)
            love.graphics.printf(self.items[i]['description'], self.x + (i - 1) % self.columns * (self.width + self.gap),
                self.y + math.floor((i - 1) / self.columns) * (self.height + self.gap) + self.height - 300,
                self.width,
                'center')
        end
    end
    love.graphics.setColor(WHITE)

    love.graphics.translate((self.selected - math.ceil(self.columns / 2)) * (self.gap + self.width), 0)
end
