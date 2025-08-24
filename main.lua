local Player = require("src.player")
local Ball = require("src.ball")


local timeDifficulty = 0
local levelDifficulty = 1
local speedIncrement = 1.2
local message = ""
local timeToNextLv = 10
local showMessage = false

score01 = 0
score02 = 0


function love.load()

    love.window.setMode(800, 600, { resizable = false, vsync = true })

    Player1 = Player:new(50, 250, 100, 20, 350)
    Player2 = Player:new(730, 250, 100, 20, 350)
    ball = Ball:new(400, 300, 10, 200, 200)
end

function love.update(dt)

    Player1:move("w", "s", dt)
    Player2:move("up", "down", dt)
    ball:move(dt, Player1, Player2)

    timeDifficulty = timeDifficulty + dt

    -- Mensagem para alertar do próximo nível
    if timeDifficulty >= timeToNextLv - 5 and not showMessage then
        message = "Preparesse para o próximo nível de velocidade!"
        showMessage = true
    end

    -- Controlando velocidade com o aumento dos níveis
    if timeDifficulty >= timeToNextLv then
        ball.speedX = ball.speedX * speedIncrement
        Player1.speed = Player1.speed * speedIncrement
        Player2.speed = Player2.speed * speedIncrement
        ball.speedY = ball.speedY * speedIncrement
        levelDifficulty = levelDifficulty + 1
        message = "Velocidade aumentada Nível: ".. levelDifficulty
        timeToNextLv = timeToNextLv + 15
        showMessage = false
    end

end

function love.draw()
    Player1:draw()
    Player2:draw()
    ball:draw()
    timeFormated = string.format("%.2f", timeDifficulty)

    love.graphics.setFont(love.graphics.newFont(15))
    love.graphics.print("Tempo: " .. timeFormated, 10, 10)
    love.graphics.print(message, 200, 10)

    love.graphics.setFont(love.graphics.newFont(40))
    love.graphics.print(score01, 300, 50)
    love.graphics.print(score02, 500, 50)
end
