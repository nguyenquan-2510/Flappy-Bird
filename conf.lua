local love = require 'love'
local constants = require 'constants'

function love.conf(t)
    --[[
        Screen configurations
        ( Can be adjusted in the love.load() function )
        Will leave these as comments
    ]]
    t.console = false
    t.window.title = "Flappy square - Lua x LOVE2D"
    t.window.width = SCREEN_WIDTH
    t.window.height = SCREEN_HEIGHT

    -- Sample configurations
    t.console = false

    t.window.icon = nil
    t.window.x = nil
    t.window.y = nil
end