package.cpath = "./?.so" --so搜寻路劲
local cb = require("cb")

local function callback(a, b, c)
    print("callback a=" .. a .. " b=" .. b .. " c=" .. c)
end

function defcallback(a, b, c)
    print("defcallback a=" .. a .. " b=" .. b .. " c=" .. c)
end

local function watch(a, b, c)
    print("### lua watch a=" .. a .. " b=" .. b .. " c=" .. c)
    return a + b + c
end

local function task()
    cb.setwatch2(watch)
    print("task over")
end

print "---------------------------"
local co = coroutine.create(task)
coroutine.resume(co)
co = nil
print "---------------------------"
--cb.setwatch(watch)
--print "---------------------------"
--cb.setnotify(callback)
--cb.testnotify()
--print "---------------------------"
--cb.testenv()
--print "---------------------------"

os.execute("sleep " .. 6)
print "test over!"