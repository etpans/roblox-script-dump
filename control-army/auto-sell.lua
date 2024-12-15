game:GetService("RunService").RenderStepped:Connect(function()
    if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.TopSide.Backpack.Meter.BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
        repeat wait()
            for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v.Name:match("Plot") then
                    if v.PLAYERNAME.SurfaceGui.TextLabel.Text == game:GetService("Players").LocalPlayer.Name then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.ZONE.CFrame * CFrame.new(0, -11, 0)
                    end
                end
            end
        until game:GetService("Players").LocalPlayer.PlayerGui.MainUI.TopSide.Backpack.Meter.BackgroundColor3 == Color3.fromRGB(0, 255, 0)
    end
end)