getgenv().healFruit = "Bloodfruit"

if not autoFruitEnabled then
    getgenv().autoFruitEnabled = true
else
    getgenv().autoFruitEnabled = false
end

if autoFruitEnabled then
    getgenv().fruitLoop = game:GetService("RunService").RenderStepped:Connect(function()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health < 100 then
            game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer(healFruit)
        end
    end)
else
    fruitLoop:Disconnect()
end