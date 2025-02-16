function Function()
    local _fun = {}
    --- @param x number 0~1
    --- @return number 0~1
    function _fun:fun(x)
        local y = x
        return y
    end

    function _fun:draw(x, y, x_offset)
        for i = 1, x, 1 do
            love.graphics.points(i, self:fun(i / x + x_offset) * y)
        end
    end

    return _fun
end

function Sin()
    local _fun = Function()
    --- @param x number 0~1
    --- @return number 0~1
    function _fun:fun(x)
        return (-math.sin(x * 2 * math.pi) + 1) / 2
    end

    return _fun
end

function PerlinNoise(smooth_step_n)
    require "combination"
    smooth_step_n = smooth_step_n or 1
    local function smooth_step(n)
        local function _smooth_step(x)
            local result = 0
            for k = 0, n, 1 do
                result = result + Combination(n + k, k) * Combination(2 * n + 1, n - k) * (-x) ^ k
            end
            return result * x ^ (n + 1)
        end
        return _smooth_step
    end
    math.randomseed(42)
    local _fun = Function()
    _fun.width = 10
    _fun.array = {}
    for i = 1, _fun.width, 1 do
        local rand = math.random(0, 1)
        if rand == 0 then
            rand = -1
        end
        _fun.array[#_fun.array + 1] = rand
    end
    _fun.smooth_step = smooth_step(smooth_step_n)

    function _fun:fun(x)
        local a = math.floor(x / self.width)
        x = x - a * self.width
        local _, f = math.modf(x)
        local left = _fun.array[(math.floor(x) - 1) % self.width + 1] * f
        local right = _fun.array[(math.ceil(x) - 1) % self.width + 1] * (f - 1)
        local smooth_f = self.smooth_step(f)
        local result = left * (1 - smooth_f) + smooth_f * right
        result = (result + 1) / 2
        return result
    end

    return _fun
end
