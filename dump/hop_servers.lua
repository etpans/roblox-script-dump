local library = loadstring(game:HttpGet("https://pastebin.com/raw/eKwyeQa0", true))()

local tab1 = library:CreateTab("Main", true)

local box = library:MakeBox(tab1,"Max # players","4",function(box)
   pnum = box.Text
end)
local button = library:MakeButton(tab1,"Hop!",function(button)
local function Get(url)
    return game:GetService("HttpService"):JSONDecode(game.HttpGet(true, url))
end
local PlaceId = game.PlaceId
local Amount = tonumber(pnum)
local Index = 0
while true do
    local GameInstances = Get("https://www.roblox.com/games/getgameinstancesjson?placeId=" .. PlaceId .. "&startindex=" .. Index)
    for i,v in pairs(GameInstances.Collection) do
        if table.maxn(v.CurrentPlayers) <= Amount then
            game:GetService("TeleportService"):TeleportToPlaceInstance(tonumber(PlaceId), v.Guid)
            return
        end
    end
    Index = Index + 50
end 
end)
local text = library:MakeLabel(tab1,"\n \n \n")
local text = library:MakeLabel(tab1,"Script: Linsonder \n UI: Insane")
