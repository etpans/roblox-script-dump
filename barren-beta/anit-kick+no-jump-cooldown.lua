if getgenv().bypassenabled == nil then
    getgenv().bypassenabled = true
end

local lplr = game:GetService("Players").LocalPlayer
local plrgui = lplr.PlayerGui
local meta_table = getrawmetatable(game)
local old_name_call = meta_table.__namecall

local function notification(message, seconds)
    pcall(function()
        local properties = plrgui.StarterScripts.ItemControl.MessageFrame:Clone()
        properties.Name = os.time()
        properties.MessageText.Text = message
        properties.Parent = plrgui:WaitForChild("Messages").MessagesFrame
        game.Debris:AddItem(properties, seconds)
    end)
end

if bypassenabled then
    notification("Anti-Cheat Bypass has been enabled!", 2)
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
else
    motification("Anti-Cheat Bypass has been disabled!", 2)
end

if bypassenabled then
    getgenv().bypassenabled = false
else
    getgenv().bypassenabled = true
end
