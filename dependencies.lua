Class = require 'class'

require 'constants'
require 'LevelsMenu'
require 'StateMachine'
require 'states/BaseState'
require 'states/StartState'
require 'states/PlayState'

require 'levels/Level1'
require 'levels/Level2'

require 'entities/Ground'
require 'entities/Ball'
require 'entities/Player'
require 'entities/Basket'

FontPrimarySmall = love.graphics.newFont('fonts/angrybirds.ttf', 64)
FontPrimaryLarge = love.graphics.newFont('fonts/angrybirds.ttf', 256)
