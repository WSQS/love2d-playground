local combination_cache = {}

function Combination(n, k)
    if combination_cache[n]~=nil and combination_cache[n][k]~=nil then
        return combination_cache[n][k]
    end
    if n < k then
        return Combination(k, n)
    end
    if k == 0 or k == n then
        if combination_cache[n] == nil then
            combination_cache[n] = {}
        end
        combination_cache[n][k] = 1
        return 1
    end
    if k == 1 then
        if combination_cache[n] == nil then
            combination_cache[n] = {}
        end
        combination_cache[n][k] = n
        return n
    end
    local result = Combination(n - 1, k - 1) + Combination(n - 1, k)
    if combination_cache[n] == nil then
        combination_cache[n] = {}
    end
    combination_cache[n][k] = result
    return result
end