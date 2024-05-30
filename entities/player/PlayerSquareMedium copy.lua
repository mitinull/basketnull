PlayerOctagonMedium2 = Class { __includes = PlayerMediumRed }

PlayerOctagonMedium2.speed = 500

function PlayerOctagonMedium2.init(self, world, x, y, leftKey, rightKey, jumpKey, color)
    PlayerBase.init(self, world, x, y, leftKey, rightKey, jumpKey, self.speed, self.jump,
        self.gScale, self.radius, self.mass, color, 'square')
end
