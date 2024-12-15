for i, v in pairs(game:GetService("Workspace").Effects:WaitForChild("ModDrop")) do
    print(v)
    firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v, 0)
    firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v, 1)
end



firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Effects.ModDrop, 0)
firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, game:GetService("Workspace").Effects.ModDrop, 1)
game:GetService("Workspace").Effects.ModDrop.TouchInterest