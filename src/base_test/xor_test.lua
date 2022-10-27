local XOR_KEY = 2333333

local function test()
    local pid_num = 2349162
    local n = math.floor((pid_num ~ XOR_KEY) % 1000)
    print("n=", n)
end

test()