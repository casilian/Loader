local config = getgenv().Config 
local placeId = game.PlaceId
local volt_str = 'Volt/'

local gameList = {
    [126642046443487] = volt_str .. 'games/reincarnated.luau',
    [97598239454123] = volt_str .. 'games/gag2.luau',
    [15419987333] = volt_str .. 'games/craftwars_random.lua',
    [1417427737] = volt_str .. 'games/mining.lua',
    [95955564282682] = volt_str .. 'games/high_tides.lua'
}


local function loadstr(path)
    local url = 'https://api.github.com/repos/Karshtakavaar/Projects/contents/' .. path .. '?ref=main' 

    local response = request({
        Url = url, 
        Method = 'GET',
        Headers = {
            ['Authorization'] = 'token ' .. config.Token, 
            ['Accept'] = 'application/vnd.github.v3.raw',
            ['User-Agent'] = 'LuaScript'
        }
    })

    if response.Success then 
        return loadstring(response.Body)()
    else 
        error(response.StatusCode .. ' : ' .. response.StatusMessage)
    end
end

local selected = gameList[placeId] or error('Game Not Supported.')

config.Library = loadstr(volt_str .. 'shared/interface_new.lua')

loadstr(selected)