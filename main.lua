local x = 100
local v = 500

local tick

function love.load()
    tick = require "tick"
    Object = require "classic"
    Player = Object:extend()
end

function love.update(dt)
    -- x = x + v * dt
    -- if x > 600 then
    --     v = -math.abs(v)
    -- end
    -- if x < 0 then
    --     v = math.abs(v)
    -- end
    if love.keyboard.isDown("right") then
        x = x + v * dt
    elseif love.keyboard.isDown("left") then
        x = x - v * dt
    end
    tick.update(dt)
end

function love.draw()
    love.graphics.setColor(255, 255, 255) -- 设置文字颜色为白色
    -- love.graphics.print("Hello, World!", 100, 200) -- 打印文本
    love.graphics.rectangle("line", x, 50, 200, 150)
end
