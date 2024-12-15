local ws = game:GetService("Workspace")
local chad = ws:FindFirstChild("Chad")
local lplr = game:GetService("Players").LocalPlayer
local plrgui = lplr.PlayerGui

local function notification(message, seconds)
    pcall(function()
        local properties = plrgui.StarterScripts.ItemControl.MessageFrame:Clone()
        properties.Name = os.time()
        properties.MessageText.Text = message
        properties.Parent = plrgui:WaitForChild("Messages").MessagesFrame
        game.Debris:AddItem(properties, seconds)
    end)
end

if chad then
    for i, v in pairs(chad.HumanoidRootPart:GetChildren()) do
        if v.Name == "Aggro" then
            local aggrocheck = #v:GetChildren() > 0
            for i, v in pairs(v:GetChildren()) do
                if v.Name ~= lplr and not aggrocheck then
                    notification("You must hit the Helicopter first!", 3)
                else
                    notification("The Helicopter has been killed! (May have to wait a few seconds)", 2)
                    while chad do wait()
                        ws.Chad.Humanoid.Health = 0
                    end
                end
            end
        end
    end
else
    notification("Wait for the Helicopter to spawn in!")
end
