local utils = require("src.utils")

local Ball = {}

function Ball:new(x, y, r, speedX, speedY)
    local dataBall = { x = x, y = y, r = r, speedX = speedX, speedY = speedY }
    setmetatable(dataBall, self)
    self.__index = self
    return dataBall
end

function Ball:move(dt, player1, player2)
    self.x = self.x + self.speedX * dt
    self.y = self.y + self.speedY * dt

     -- colisão com teto e chão
    if self.y - self.r <= 0 or self.y + self.r >= 600 then
        self.speedY = -self.speedY
    end

     -- colisão com jogadores
    if utils.checkCollision(self, player1) then
        self.speedX = math.abs(self.speedX)  -- garante que vai pra direita
    elseif utils.checkCollision(self, player2) then
        self.speedX = -math.abs(self.speedX) -- garante que vai pra esquerda
    end

    --Reaparecimento da bola ao sair
    if self.x < 0 then
        score02 = score02 + 1
        self.y = 400
        self.x = 300
        self.speedX = math.abs(self.speedX)
    end

    if self.x > 800 then
        score01 = score01 + 1
        self.y = 400
        self.x = 300
        self.speedX = -math.abs(self.speedX)
    end
end

function Ball:draw()
    love.graphics.circle("fill", self.x, self.y, self.r)
end

return Ball