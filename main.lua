--[[

Inspired by Flappy Bird

Simple Remake From Flappy Bird Game
Ya from a pygame falppy bird tutorial on YT and i decided to write in Lua
to increase the difficulty

Also this is flying square not bird ! xDDD

]]

-- Screen w, h, and title are set in the conf.lua file 

math.randomseed(os.time())

-- Not really necessary
local love = require 'love'

-- Some immutable values
local constants = require 'constants'

-- Include the tube object
local tube = require 'tube'

-- Yayy square
local square = require 'square'

-- Score properties ( point, print score function )
require 'score'

-- GAME LOGIC
GAME_LOGIC = {
    isGameOver = false,

    print_replay_message = function ()
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("Your score is: " .. score.value .. "\nPress <r> to play again !", 0, SCREEN_HEIGHT / 2, SCREEN_WIDTH, "center")
    end,

    start_new_game = function (self)
        self.isGameOver = false

        score.value = 0
        -- POSITION X OF THE FIRST TUBE HERE !!
        TUBE1_INITIAL_X_POSITION = 200

        tube1 = tube(TUBE1_INITIAL_X_POSITION)
        tube2 = tube(tube1.x + DISTANCE_BETWEEN_TUBES)
        tube3 = tube(tube1.x + 2 * DISTANCE_BETWEEN_TUBES)

        playerSquare = square()
    end,

}

function love.load()
    GAME_LOGIC:start_new_game()

    BACKGROUND_IMAGE = love.graphics.newImage(BACKGROUND_IMAGE_PATH)
    TUBE_IMAGE = love.graphics.newImage(TUBE_IMAGE_PATH)
    BIRD_IMAGE = love.graphics.newImage(BIRD_IMAGE_PATH)
end

function love.keypressed(key)
    if GAME_LOGIC.isGameOver then
        if key == "escape" then
            love.event.quit()
        end

        if key == "r" then
            GAME_LOGIC:start_new_game()
        end
    else
        if key == "space" then
            playerSquare:jump()
        end
    end
end

function love.update()
    if not GAME_LOGIC.isGameOver then
        -- Ya update the position of the tubes when they go offscreen
        tube1:updatePosition()
        tube2:updatePosition()
        tube3:updatePosition()

        -- Collison detection
        tube1:collisionDetection()
        tube2:collisionDetection()
        tube3:collisionDetection()

        -- Gravity for the bird
        playerSquare:gravity()

        -- Update score
        tube1:scoreUpdate()
        tube2:scoreUpdate()
        tube3:scoreUpdate()
    end
end

function love.draw()

    -- Background
    love.graphics.draw(BACKGROUND_IMAGE, 0, 0, nil, love.graphics.getWidth() / BACKGROUND_IMAGE:getWidth(), love.graphics.getHeight() / BACKGROUND_IMAGE:getHeight())
    
    -- Draw a bird
    playerSquare:draw()

    -- Draw tubes and inverses
    tube1:draw()
    tube2:draw()
    tube3:draw()

    tube1:drawInverse()
    tube2:drawInverse()
    tube3:drawInverse()

    -- Draw score on screen
    score:printScore()

    if GAME_LOGIC.isGameOver then
        GAME_LOGIC.print_replay_message()
    end
end