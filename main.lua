require 'dependencies'

function love.load()
    love.window.setMode(WINDOWS_WIDTH, WINDOWS_HEGHT, { borderless = true })

    GameState = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end
    }

    GameState:change('start')

    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    GameState:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    GameState:render()
end
