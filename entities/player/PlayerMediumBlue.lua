
PlayerMediumBlue = Class { __includes = PlayerMediumRed }

PlayerMediumBlue.color = COLOR9

function PlayerMediumBlue.init(self, world, x, y, leftKey, rightKey, jumpKey)
    PlayerBase.init(self, world, x, y, leftKey, rightKey, jumpKey, self.speed, self.jump,
        self.gScale, self.radius, self.mass, self.color)
end
