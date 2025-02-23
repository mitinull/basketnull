Class = require 'class'

require 'constants'
require 'Menu'
require 'SeasonMenu'
require 'LevelsMenu'
require 'StateMachine'
require 'states/BaseState'
require 'states/StartState'
require 'states/PlayState'

require 'levels/BaseLevel'
require 'levels/Level00'
require 'levels/Level0_2'
require 'levels/Level0_3'
require 'levels/Level0_4'
require 'levels/Level0_5'
require 'levels/Level7'
require 'levels/Level8'
require 'levels/Level9'
require 'levels/Level10'
require 'levels/Level11'
require 'levels/Level12'
require 'levels/Level13'
require 'levels/Level14'
require 'levels/Level15'
require 'levels/Level16'
require 'levels/Level17'
require 'levels/Level18'
require 'levels/Level19'
require 'levels/Level20'
require 'levels/Level21'

require 'entities/player/PlayerBase'
require 'entities/player/PlayerMediumRed'
require 'entities/player/PlayerMediumBlue'
require 'entities/player/PlayerOctagonMedium'

require 'entities/Ground'
require 'entities/Ball'
require 'entities/Basket'
require 'entities/MovingBasket'
require 'entities/Lines'

FontPrimarySmall = love.graphics.newFont('fonts/angrybirds.ttf', 64)
FontPrimaryMedium = love.graphics.newFont('fonts/angrybirds.ttf', 96)
FontPrimarySemiSmall = love.graphics.newFont('fonts/angrybirds.ttf', 82)
FontPrimarySemiLarge = love.graphics.newFont('fonts/angrybirds.ttf', 196)
FontPrimaryLarge = love.graphics.newFont('fonts/angrybirds.ttf', 256)
