local function test()
    local map = {}
    map[1] = 1
    map[2] = {}
    map[8] = {}
    print("map size= ", #map)

    local t = { 1, 1, nil, 1 }
    print("t size= ", #t)
end

test()