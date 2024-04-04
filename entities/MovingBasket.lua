MovingBasket = Class { __includes = Basket }

function MovingBasket:init(world, x, y, width, height, x2, y2, period)
    Basket.init(self, world, x, y, width, height, 'kinematic')

    self.x2 = x2
    self.y2 = y2
    self.period = period

    self.body:setLinearVelocity((self.x2 - self.x) / self.period, (self.y2 - self.y) / self.period)
end

function MovingBasket:update(dt)
    if math.abs(self.body:getX() - self.x) >= math.abs(self.x2 - self.x) and
        math.abs(self.body:getY() - self.y) >= math.abs(self.y2 - self.y) then
        self.body:setLinearVelocity((self.x - self.x2) / self.period, (self.y - self.y2) / self.period)
    elseif math.abs(self.body:getX() - self.x2) >= math.abs(self.x - self.x2) and
        math.abs(self.body:getY() - self.y2) >= math.abs(self.y - self.y2) then
        self.body:setLinearVelocity((self.x2 - self.x) / self.period, (self.y2 - self.y) / self.period)
    end
end

--  x2 - x > 0 ==> getX - x > x2 - x  // x2 - x < 0 ==> getX - x < x2 - x
