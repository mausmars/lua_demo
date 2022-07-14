package.cpath = "../../luaclib/?.so;" .. package.cpath

local cjson = require "cjson"
--cjson.encode_empty_table_as_object(true)
--local empty_arr = setmetatable({}, cjson.empty_array_mt)

local function sub_bean()
    local data = {}
    data.a = 1
    data.b = "b"
    data.c = { k = "v" }
    data.d = {}

    --some_array = json.empty_array
    data.e = {}
    table.insert(data.e, 1)

    return data
end

local function bean()
    local data = {}
    data.sub_bean_str = cjson.encode(sub_bean())
    data.sub_bean = sub_bean()
    return data
end

local function test()
    cjson.encode_sparse_array(true, 2, 3)
    local content = cjson.encode(bean())
    print(content)


end

test()