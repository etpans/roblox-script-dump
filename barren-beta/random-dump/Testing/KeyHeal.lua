local KEY = "g"

game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
if key == KEY then
local A1 = game:GetService("Players").LocalPlayer.stats.inventory.slot06
game:GetService("ReplicatedStorage").Remotes.Use:InvokeServer(A1)

local A1 = game:GetService("ReplicatedStorage").ItemData.Bandage
game:GetService("ReplicatedStorage").Remotes.CraftItem:InvokeServer(A1)
end
end)