local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local window = library:CreateWindow("AutoFarm")
local folder = window:CreateFolder("Main")

folder:Button("Teleport Obby", function()
    local humanoid = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
    humanoid.CFrame = CFrame.new(217.16835, 3.19999862, 120.238152, -0.0553791113, 2.29442474e-08, -0.998465419, 5.13012246e-08, 1, 2.0134129e-08, 0.998465419, -5.01074879e-08, -0.0553791113)
    humanoid.CFrame = CFrame.new(317.338501, 0.644921541, 120.250023, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    wait(.2)
    for i, v in pairs(game:GetService("Workspace").Tycoons:GetDescendants()) do
        if v.Name == "Owner" and v.Value == game:GetService("Players").LocalPlayer.Name then
            local humanoid = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            humanoid.CFrame = v.Parent.ClaimPad.CFrame * CFrame.new(0, 5, 0)
        end
    end
end)

folder:Button("Teleport Tyccon", function()
    for i, v in pairs(game:GetService("Workspace").Tycoons:GetDescendants()) do
        if v.Name == "Owner" and v.Value == game:GetService("Players").LocalPlayer.Name then
            local humanoid = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
            humanoid.CFrame = v.Parent.ClaimPad.CFrame * CFrame.new(0, 5, 0)
        end
    end
end)

folder:Toggle("Auto Clicker", function(enabled)
    if enabled then
        for i, v in pairs(game:GetService("Workspace").Tycoons:GetDescendants()) do
            if v.Name == "Owner" and v.Value == game:GetService("Players").LocalPlayer.Name then
                click = v.Parent.Clicker.ClickDetector
            end
        end
        getgenv().loop = game:GetService("RunService").RenderStepped:Connect(function()
            wait()
            fireclickdetector(click)
        end)
    else
        loop:Disconnect()
    end
end)
--[[
folder:Toggle("Auto-Click Whitelisted", function(enabled)
    if enabled then
        whiltelist = true
        for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.Profile.Whitelist:GetChildren()) do
            if v.ClassName == "TextButton" then
                if v.BackgroundColor3 == Color3.new(0.258824, 0.258824, 0.258824) then
                    if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                        print(v.Name)
                    end
                end
            end
        end
    else
        whiltelist = false
    end
end)]]

folder:Slider("Walkspeed", {
    min = 16,
    max = 50,
}, function(value)
    game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

folder:DestroyGui()