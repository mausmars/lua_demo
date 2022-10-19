local function strip_file_name(filename)
    local str = string.match(filename, "(.+)/[^/]*%.%w+$")
    print(str)
end

strip_file_name("./mnt/e/work/combo-jmeter-tcp.iml")