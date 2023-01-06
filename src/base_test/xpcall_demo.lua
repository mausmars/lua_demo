local util = require "util"

local function err_handle(info)
    print("err_handle info:" .. info)
end

local isok, result, a = xpcall(function()
    return util:sum(10, 20, 3)
end, err_handle)
--debug.traceback 可以打印debug栈

print("isok=" .. tostring(isok))
--print("result 长度=" .. tostring(#result))    --结果 or nil
print("result=" .. tostring(result) .. "  a=" .. a)
print("continue run...")

-- xpcall 传...会报错
local function test(...)
    local args = { ... }
    local isok, result, a = xpcall(function()
        return util:sum(table.unpack(args))
    end, err_handle)
end

test(10, 20, 3)


