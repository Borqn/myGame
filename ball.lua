ball = {}
function ball:load()
self.x = love.graphics.getWidth() / 2
self.y = love.graphics.getHeight() / 2
self.width = 20
self.height = 20
self.speed = 200
self.xVel = -self.speed --(velocity on the x axis) setting the x velocity will send the ball to the player paddle, aka the left one
self.yVel = 0 -- velocity on the y axis
end
function ball:update(dt)
    ball:move(dt)
    self:collide()
end
function ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end
function ball: collide()
    if checkCollision(self, Collision) then
        self.xVel = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPosition = middleBall - middlePlayer
        self.yVel = collisionPosition * 5 -- a larger value will create larger swings in y velocity
    end
end
function ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
