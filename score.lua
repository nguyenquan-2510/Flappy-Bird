local love = require 'love'

-- Game score
score = {
    value = 0,
    printScore = function (self)
        love.graphics.setNewFont(20)
        love.graphics.setColor(1, 1, 1)

        score_text = "Score: " .. self.value
        love.graphics.printf(score_text, 0, 20, love.graphics.getWidth(), "center")

    end,
}
