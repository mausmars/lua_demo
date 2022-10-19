local socket = require "socket"

local times = 10000
local count = 10
local str_cell = "test"

local function test1()
    local start_time = socket.gettime()
    for _ = 1, times do
        local str = ""
        for _ = 1, count do
            str = str .. str_cell
        end
    end
    print(".. used time: " .. socket.gettime() - start_time .. "ms")
end

local function test2()
    local template = ""
    for _ = 1, count do
        template = template .. "%s"
    end

    local str = ""
    local start_time = socket.gettime()
    for _ = 1, times do
        str = string.format(template, str_cell, str_cell, str_cell, str_cell, str_cell, str_cell, str_cell, str_cell, str_cell, str_cell)
    end
    print("string.format used time: " .. socket.gettime() - start_time .. "ms")
end

local function test3()
    local start_time = socket.gettime()
    local strlist = {}
    for _ = 1, count do
        table.insert(strlist, str_cell)
    end
    local str = ""
    for _ = 1, times do
        str = table.concat(strlist)
    end
    print("table.concat used time: " .. socket.gettime() - start_time .. "ms")
end

collectgarbage("collect")
test1()

collectgarbage("collect")
test2()

collectgarbage("collect")
test3()