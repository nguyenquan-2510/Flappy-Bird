local love = require 'love'

-- The square object -)
local square = function (x, y, w, h, dropVelocity)
    return {
        x = x or 50,
        y = y or 0,
        w = w or 35,
        h = h or 35,
        dropVelocity = dropVelocity or 0,

        draw = function (self)
            love.graphics.draw(BIRD_IMAGE, self.x, self.y, 0, self.w / BIRD_IMAGE:getWidth(), self.h / BIRD_IMAGE:getHeight())
        end,

        gravity = function (self, gravityState)
            if self.y < 0 or self.y + self.h > love.graphics.getHeight() then
                GAME_LOGIC.isGameOver = true
            end

            gravityState = gravityState or true

            if gravityState then
                self.y = self.y + self.dropVelocity
                self.dropVelocity = self.dropVelocity + GRAVITY
            end
        end,

        jump = function (self)
            self.dropVelocity = -10
        end
    }
end

return square