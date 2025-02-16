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

    return _fun;
end

