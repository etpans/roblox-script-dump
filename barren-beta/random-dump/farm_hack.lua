function getClosest()
    local closest = nil
    
    local shortestDistance = math.huge

    for i,v in pairs(game:GetService("Workspace").Harvestables:GetChildren()) do
        if v.ClassName == "Model" then
            for i, v in pairs(v:GetChildren()) do
                if v.Name == "RockFormation" then
                    local magnitude = (v.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude

                    if magnitude < shortestDistance then
                        closest = v
                        shortestDistance = magnitude
                    end
                end
            end
        end
    end

    return closest
end

while wait() do
    getClosest().CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(1.4,0,-20)
end