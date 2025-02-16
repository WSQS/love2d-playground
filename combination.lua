local combination_cache

function Combination(n, k)
    if n < k then
        return Combination(k, n)
    end
    if k == 0 or k == n then
        return 1
    end
    if k == 1 then
        return n
    end
    return Combination(n - 1, k - 1) + Combination(n - 1, k)
end