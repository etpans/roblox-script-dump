local Slot = "slot37"
while wait() do
if game.Players.LocalPlayer.PlayerGui.MainGui.Stats.Hunger.Frame.TextLabel.Text <= "10%" then
for i = 1, 5 do
local A1 = game:GetService("Players").LocalPlayer.stats.inventory[Slot]
game:GetService("ReplicatedStorage").Remotes.Eat:InvokeServer(A1)
end
end
end