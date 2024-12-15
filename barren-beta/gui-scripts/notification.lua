local lplr = game:GetService("Players").LocalPlayer
local plrgui = lplr.PlayerGui

local function notification(message, seconds)
    local properties = plrgui.StarterScripts.ItemControl.MessageFrame:Clone()
    properties.Name = os.time()
    properties.MessageText.Text = message
    properties.Parent = plrgui:WaitForChild("Messages").MessagesFrame
    game.Debris:AddItem(properties, seconds)
end

notification(message, seconds)
