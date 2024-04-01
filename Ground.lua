Ground = Class {}

function Ground:init(world, height)
    self.height = height

    self.body = love.physics.newBody(world, 0, WINDOWS_HEGHT - self.height, 'static')

    -- edge shape Box2D provides, perfect for ground
    self.shape = love.physics.newEdgeShape(0, 0, WINDOWS_WIDTH, 0)

    -- affix edge shape to our body
    self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Ground:render()
    love.graphics.setColor(GROUND_COLOR)
    love.graphics.rectangle('fill', 0, WINDOWS_HEGHT - self.height, WINDOWS_WIDTH, self.height)
    love.graphics.setColor(WHITE)
end
