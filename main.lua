require 'dependencies'

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, { borderless = true })

    love.mouse.setVisible(false)

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
    love.graphics.setBackgroundColor(BACKGROUND_COLOR)
    love.graphics.setFont(FontPrimarySmall)
    love.graphics.scale(WINDOW_WIDTH / VIRTUAL_WIDTH, WINDOW_HEIGHT / VIRTUAL_HEIGHT)
    GameState:render()
    love.graphics.setColor(FPS_COLOR)
    love.graphics.setFont(FontPrimarySmall)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 40, 40)
    love.graphics.setColor(WHITE)
end
