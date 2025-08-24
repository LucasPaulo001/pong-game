local Player = require("src.player")
local Ball = require("src.ball")


function love.load()
    Player1 = Player:new(50, 250, 100, 20, 350)
    Player2 = Player:new(730, 250, 100, 20, 350)
    ball = Ball:new(400, 300, 10, 200, 200)
end

function love.update(dt)
    Player1:move("w", "s", dt)
    Player2:move("up", "down", dt)
end

function love.draw()
    Player1:draw()
    Player2:draw()
    ball:draw()
end
