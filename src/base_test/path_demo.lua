package.cpath = "../../luaclib/?.so;"..package.cpath

local lfs = require("lfs")

local function dirpath(path)
    for file in lfs.dir(path) do
        --  lfs.dir  根据路径获取该路径下的文件名
        if file ~= '.' and file ~= '..' then
            local f = (path .. '/' .. file)
            local attr = lfs.attributes(f) -- 该文件的各种属性
            if attr.mode == "directory" then
                print(f .. "  -->  " .. attr.mode)
                dirpath(f)
            else
                print(f .. "  -->  " .. attr.mode)
            end

        end
    end
end

dirpath("/mnt/e/work/combo-jmeter-tcp.iml")