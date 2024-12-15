local plrs = game:GetService("Players")
local rs = game:GetService("ReplicatedStorage")

plrs.PlayerAdded:Connect(function(player)
    if player:WaitForChild("Data"):FindFirstChild("Squad").Value == "" then
        rs.Remotes.Squad:FireServer("Invite", tostring(player))
    end
end)
