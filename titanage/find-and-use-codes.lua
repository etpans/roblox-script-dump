for i, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v.Name ~= game:GetService("Players").LocalPlayer then
        for i, v in pairs(v.Data.CodesUsed:GetChildren()) do
            game:GetService("ReplicatedStorage").Remotes.RedeemCode:InvokeServer(v.Name)
        end
    end
end
