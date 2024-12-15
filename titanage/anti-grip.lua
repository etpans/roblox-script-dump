local charc = game:GetService("Players").LocalPlayer.Character
local rm = game:GetService("ReplicatedStorage")

charc.DescendantAdded:Connect(function(grip)
    if grip.Name == "Grip" then
        rm.Remotes.ReturnToLobby:FireServer()
    end
end)
