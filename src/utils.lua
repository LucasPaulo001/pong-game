local utils = {}

function utils.checkCollision(ball, player)
    return ball.x + ball.r > player.x and
           ball.x - ball.r < player.x + player.w and
           ball.y + ball.r > player.y and
           ball.y - ball.r < player.y + player.h
end

return utils