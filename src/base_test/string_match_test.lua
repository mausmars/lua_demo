-- https://regexr.com/

local function match1()
    local s = "Deadline is 30/05/1999, firm"
    local date = "%d%d/%d%d/%d%d%d%d"
    print(string.match(s, date))
end

local function match2()
    -- + 匹配1次或多次
    print(string.match("hello world 123", "%w+ %w+")) -->  hello world
    print(string.match("helle world 123", "[%w %d]+")) --> hello world 123
    -- ? 匹配0或1次 （匹配一个有符号数）
    print(string.match("the number is: +123", "[+-]?%d+")) --> +123
    print(string.match("the number is: 123", "[+-]?%d+")) --> 123
    print(string.match("the number is: -123", "[+-]?%d+")) --> -123
    -- * 匹配0次或多次
    print(string.match("abc123abc", "%a+%d*%a+")) --> abc123abc
    print(string.match("abcabc", "%a+%d*%a+")) --> abcabc
end

local function match3()
    local str = "channelOrderId=2000000029412173&paymentExtend&orderId=2011378700&goodsId=Combo_XS_12&sign=49e804c1c9495e59bcc57b3bebb19ec7&startTs=1649494776000&language=zh-Hans-CN&userId=2332296&serverId&platform=apple_cn&gameExtend=2&isTest=1&price=12.00&appId=combo&endTs=1649494784000&zoneId=1&action=coin&dcAppId=combo_ioscn_prod&channelName=apple&currency=CNY&location=CN&sku=com.happyelements.combo.cn.ios2"
    local date = "(.-)=(.-)&"
    --print(string.match(str, date))

    for k, v in string.gmatch(str, date) do
        for k1, v1 in string.gmatch(k, "(.-)&(.-)") do
            print("@@@ ", k1, v1)
        end
        print("### ", k, v)
    end
end

local function match4()
    --local str = "channelOrderId=2000000029412173&paymentExtend&paymentExtend2&orderId=2011378700&goodsId=Combo_XS_12&sign=49e804c1c9495e59bcc57b3bebb19ec7&startTs=1649494776000&language=zh-Hans-CN&userId=2332296&serverId&platform=apple_cn&gameExtend=2&isTest=1&price=12.00&appId=combo&endTs=1649494784000&zoneId=1&action=coin&dcAppId=combo_ioscn_prod&channelName=apple&currency=CNY&location=CN&sku=com.happyelements.combo.cn.ios2"
    local date = "([^=&]+)(=?([^&]*))"

    --print(string.match(str, date))
    local str="&a=&b&"
    for k, v, x in string.gmatch(str, date) do
        if x == "" then
            print("@@@ ", k)
        end
        print("### ", k, x)
    end
    print("---------------")
end

--match1()
--match2()
--match3()
match4()


