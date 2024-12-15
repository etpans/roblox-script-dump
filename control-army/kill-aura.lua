function getClosest()
    local Closest = nil
    
    local ShortestDistance = math.huge

    for i, v in pairs(game:GetService("Workspace").Objects:GetChildren()) do
        local Distance = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChildWhichIsA("Part").Position).Magnitude
        if Distance < 25 and Distance < ShortestDistance and v.HP.Value ~= 0 then
            Closest = v
            ShortestDistance = Distance
        end
    end

    return Closest
end

game:GetService("RunService").RenderStepped:Connect(function()
    if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name:match("Wand") then
        local Object = getClosest()
        if Object.HP.Value == 0 then
            Object = getClosest()
        end
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Attack", Object)
    end
end)