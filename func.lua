
function Function()
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