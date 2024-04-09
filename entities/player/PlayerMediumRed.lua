PlayerMediumRed = Class { __includes = PlayerBase }

PlayerMediumRed.speed = 1250
PlayerMediumRed.jump = 1250
PlayerMediumRed.gScale = 2
PlayerMediumRed.radius = 105
PlayerMediumRed.mass = 50
PlayerMediumRed.color = COLOR5

function PlayerMediumRed.init(self, world, x, y, leftKey, rightKey, jumpKey)
    PlayerBase.init(self, world, x, y, leftKey, rightKey, jumpKey, self.speed, self.jump,
        self.gScale, self.radius, self.mass, self.color)
end
