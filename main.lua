local x = 100
local v = 500
local t = 1
local fun = {}
local tick

function func()
    local _fun = {}
    --- @param x number 0~1
    --- @return number 0~1
    function _fun:fun(x)
        local y = x
        return y
    end

    function _fun:draw(x, y)
        for i = 1, x, 1 do
            love.graphics.points(i, self:fun(i/x)*y)
        end
    end

    return _fun
end

function love.load()
    tick = require "tick"
    Object = require "classic"
    Player = Object:extend()
    fun[0] = func()
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
    t = t + 0.1
end

function love.draw()
    love.graphics.setColor(255, 255, 255) -- 设置文字颜色为白色
    -- love.graphics.print("Hello, World!", 100, 200) -- 打印文本
    love.graphics.rectangle("line", x, 50, 200, 150)

    for key, value in pairs(fun) do
        if key == 1 then
            function value:fun(x)
                return (math.sin(x * 2 * math.pi + t) + 1)/2
            end
        end
        value:draw(love.window.getMode())
    end
end
