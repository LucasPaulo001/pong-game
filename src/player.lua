local Player = {}

function Player:new(x, y, h, w, speed)
    local data = { x = x, y = y, h = h, w = w, speed = speed }
    setmetatable(data, self)
    self.__index = self
    return data
end

function Player:move(upKey, downKey, dt)
    if love.keyboard.isDown(upKey) then
        self.y = self.y - self.speed * dt

    elseif love.keyboard.isDown(downKey) then
        self.y = self.y + self.speed * dt
    end
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

return Player
