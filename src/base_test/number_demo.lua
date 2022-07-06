--Lua 5.3 支持的最大整数为2^63,而Lua 5.2支持的最大整数为2^53,由于5.2及以下版本没有整数，
--所以跟整数相关的函数都不支持，如math.type()、math.maxinteger、math.mininteger、math.tointeger等

local function test()
    local a1 = math.maxinteger
    local a2 = math.mininteger
    local a3 = math.tointeger

    print("a1=", a1)
    print("a2=", a2)
    print("a3=", a3)

    local v = 9223372036854775807
    print("v1=", v)
    print("v2=", v + 1)
end

test()