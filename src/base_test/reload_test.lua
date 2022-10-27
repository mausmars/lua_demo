local function table2string(val, name, skipnewlines, depth)
    skipnewlines = skipnewlines or false
    depth = depth or 0

    local tmp = string.rep(" ", depth)
    if name then
        tmp = tmp .. name .. " = "
    end
    if type(val) == "table" then
        tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

        for k, v in pairs(val) do
            tmp = tmp .. table2string(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
        end
        tmp = tmp .. string.rep(" ", depth) .. "}"
    elseif type(val) == "number" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    elseif type(val) == "boolean" then
        tmp = tmp .. (val and "true" or "false")
    else
        tmp = tmp .. "\"[inserializeable datatype:" .. type(val) .. "]\""
    end
    return tmp
end

local function test()
    local social_url = require("social_url")
    print("require 1", social_url)

    package.loaded["social_url"] = nil

    social_url = require("social_url")
    print("require 2", social_url)

    print("social_url=", table2string(social_url))
    print("--------------------------------------")
    social_url = dofile("social_url.lua")
    print("loadfile 1", social_url)
    social_url = dofile("social_url.lua")
    print("loadfile 2", social_url)

    print("social_url=", table2string(social_url))
end

test()