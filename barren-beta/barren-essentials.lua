--These are the scripts that will be automatically executed upon joining Barren
game.Loaded:Wait()
--Set these vaules below to choose which scripts you want executed automatically
getgenv().antikick = true
getgenv().removegrass = true
getgenv().fullbright = true
getgenv().unnamedesp = true

local meta_table = getrawmetatable(game)
local old_name_call = meta_table.__namecall
local terrain = game:GetService("Workspace").Terrain
local light = game:GetService("Lighting")

if game.PlaceId == 1720240978 then
    if antikick then
        setreadonly(meta_table, false)
        meta_table.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if tostring(method) == "FireServer" and tostring(self) == "AddTabs" then
                return
            elseif tostring(method) == "FireServer" and tostring(self) == "Apple" then
                return
            end
            return old_name_call(self, ...)
        end)
        setreadonly(meta_table, true)
    end
    if removegrass then
        sethiddenproperty(terrain, "Decoration", false)
    end
    if fullbright then
        light.SunRays.Parent = nil
        light.Changed:connect(function()
            light.ClockTime = 12
            light.FogEnd = 786543
            light.GlobalShadows = false
            light.Ambient = Color3.fromRGB(178, 178, 178)
        end)
    end
    if unnamedesp then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
    end
end

