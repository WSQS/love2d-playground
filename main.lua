local x = 100
local v = 500
local t = 1
local fun = {}
local tick
local step = 1
function love.load()
    tick = require "tick"
    Object = require "classic"
    F = require "func"
    Player = Object:extend()
    fun[0] = Function()
    -- fun[1] = Sin()
    for i = 0, step, 1 do
        fun[#fun+1] = PerlinNoise(i)
    end
    step = step + 1
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
    t = t + dt
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    -- love.graphics.print("Hello, World!", 100, 200) -- 打印文本
    -- love.graphics.rectangle("line", x, 50, 200, 150)
    local width, height, _ = love.window.getMode()
    for kay, value in pairs(fun) do
        value:draw(width, height, t)
    end
end

function love.keypressed(key)
    if key == "=" then
        step = step + 1
        fun[step] = PerlinNoise(step)
    elseif key == "-" then
        fun[step] = nil
        step = step - 1
    end
end
