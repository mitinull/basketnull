PlayerOctagonMedium = Class { __includes = PlayerMediumRed }

PlayerOctagonMedium.speed = 500
PlayerOctagonMedium.mass = 200

function PlayerOctagonMedium.init(self, world, x, y, leftKey, rightKey, jumpKey, color)
    PlayerBase.init(self, world, x, y, leftKey, rightKey, jumpKey, self.speed, self.jump,
        self.gScale, self.radius * 1.1, self.mass, color, 'octagon')
end
