if getgenv().grassdisabled == nil then
    getgenv().grassdisabled = true
elseif grassdisabled then
    getgenv().grassdisabled = false
else
    getgenv().grassdisabled = true
end

local terrain = game:GetService("Workspace").Terrain
local grasscheck  = gethiddenproperty(terrain, "Decoration")
local plrgui = game:GetService("Players").LocalPlayer.PlayerGui

local function notification(message, seconds)
    pcall(function()
        local properties = plrgui.StarterScripts.ItemControl.MessageFrame:Clone()
        properties.Name = os.time()
        properties.MessageText.Text = message
        properties.Parent = plrgui:WaitForChild("Messages").MessagesFrame
        game.Debris:AddItem(properties, seconds)
    end)
end

if grassdisabled then
    if grasscheck then
        notification("Grass has been removed! (May lag for a few seconds)", 3)
        sethiddenproperty(terrain, "Decoration", false)
    end
else
    if not grasscheck then
        notification("Grass has been added! (May lag for a few seconds)", 3)
        sethiddenproperty(terrain, "Decoration", true)
    end
end
