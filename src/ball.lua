local Ball = {}

function Ball:new(x, y, r, speedX, speedY)
    local dataBall = { x = x, y = y, r = r, speedX = speedX, speedY = speedY }
    setmetatable(dataBall, self)
    self.__index = self
    return dataBall
end

function Ball:move(dt)
    self.x = self.x + self.speedX * dt
    self.Y = self.Y + self.speedY * dt

     -- colisão com teto e chão
    if self.y - self.r <= 0 or self.y + self.r >= 600 then
        self.speedY = -self.speedY
    end
end

function Ball:draw()
    love.graphics.circle("fill", self.x, self.y, self.r)
end

return Ball