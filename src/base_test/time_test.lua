local function test()
    local t = { 2022, 06, 30, 23, 59, 59 }
    local time = os.time {
        year = t[1],
        month = t[2],
        day = t[3],
        hour = t[4],
        min = t[5],
        sec = t[6],
    }
    print(time)

    local t = { 2022, 06, 30, 23, 59, 00 }
    local time = os.time {
        year = t[1],
        month = t[2],
        day = t[3],
        hour = t[4],
        min = t[5],
        sec = t[6],
    }
    print(time)
end

test()