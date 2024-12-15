for i, v in pairs(game:GetService("Workspace").GemSpawns:GetDescendants()) do
    if v:IsA("ProximityPrompt") then
        for i = 1, 10 do
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.Position) + Vector3.new(0, 2, 0)
            wait(0.05)
            fireproximityprompt(v)
        end
        v:Destroy()
    end
end