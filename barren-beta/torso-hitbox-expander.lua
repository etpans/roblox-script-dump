getgenv().hitboxsize = 15

if getgenv().hitboxenabled == nil then
    getgenv().hitboxenabled = true
elseif hitboxenabled then
    getgenv().hitboxenabled = false
else
    getgenv().hitboxenabled = true
end

local plrs = game:GetService("Players")
local lplr = plrs.LocalPlayer
local runs = game:GetService("RunService")

local function notification(message, seconds)
    pcall(function()
        local properties = plrgui.StarterScripts.ItemControl.MessageFrame:Clone()
        properties.Name = os.time()
        properties.MessageText.Text = message
        properties.Parent = plrgui:WaitForChild("Messages").MessageFrame
        game.Debris:AddItem(properties, seconds)
    end)
end

if hitboxenabled then
    notification("Hitbox Expander has been enabled!", 2)
    getgenv().hitboxloop = runs.RenderStepped:Connect(function()
        for i, v in pairs(plrs:GetPlayers()) do
            if v.Name ~= lplr.Name then
                pcall(function()
                    v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
                    v.Character.HumanoidRootPart.CanCollide = false
                    v.Character.HumanoidRootPart.Material = "Neon"
                    v.Character.HumanoidRootPart.Size = Vector3.new(hitboxsize, hitboxsize, hitboxsize)
                    v.Character.HumanoidRootPart.Transparency = 0.7
                end)
            end
        end
    end)
else
    notification("Hitbox Expander has been disabled!", 2)
    hitboxloop:Disconnect()
    for i, v in pairs(plrs:GetPlayers()) do
        if v.Name ~= lplr.Name then
            pcall(function()
                v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
                v.Character.HumanoidRootPart.Transparency = 1
            end)
        end
    end
end
