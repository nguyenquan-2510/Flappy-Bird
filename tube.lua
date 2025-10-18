local love = require 'love'

-- Tube object
local tube = function(x, width, velocity, gap)
    return {
        sprite = love.graphics.newImage("assets/pipe-green.png"),
        width = width or 50,
        x = x or 300,
        height = math.random(50, 350),
        velocity = velocity or 3,
        gap = gap or 250,
        isPassed = false,

        -- Draw tube
        draw = function (self)
            love.graphics.draw(TUBE_IMAGE, self.x, 0, math.pi, self.width / TUBE_IMAGE:getWidth(), self.height / TUBE_IMAGE:getHeight(), TUBE_IMAGE:getWidth(), TUBE_IMAGE:getHeight())
        end,

        -- Draw tube inverse
        drawInverse = function (self)
            inverseW = self.width
            inverseH = love.graphics.getHeight() - self.height - self.gap
            
            love.graphics.draw(TUBE_IMAGE, self.x, self.height + self.gap, 0, inverseW / TUBE_IMAGE:getWidth(), inverseH / TUBE_IMAGE:getHeight())
        end,

        -- Tube movement
        updatePosition = function (self)
            self.x = self.x - self.velocity

            -- Generate new tube position
            if self.x < 0 - self.width then
                self.x = love.graphics.getWidth() + DISTANCE_BETWEEN_TUBES - self.width
                self.height = math.random(100, 400)
                self.isPassed = false
            end
        end,

        -- Increase score
        scoreUpdate = function (self)
            if self.x + self.width <= playerSquare.x and not self.isPassed then
                self.isPassed = true
                score.value = score.value + 1
            end
        end,

        -- Collison detection
        collisionDetection = function (self)
            -- Ehh hard to understand the method to detect if the bird is touching the tubes

            -- Collison
            if ( ( playerSquare.x + playerSquare.w > self.x ) and ( playerSquare.x < self.x + self.width ) ) and ( ( playerSquare.y < self.height ) or ( playerSquare.y + playerSquare.h > self.height + self.gap) ) then
                GAME_LOGIC.isGameOver = true
            end
        end
    }
end

return tube