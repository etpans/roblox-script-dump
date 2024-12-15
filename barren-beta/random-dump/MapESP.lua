while wait() do
game.Players.LocalPlayer.stats.other.Notoriety.Name = "Notoriet"
for i, v in pairs(game.Players:GetDescendants()) do
if v.Name == "Notoriety" and v.ClassName == "IntValue" and v.Value < 100 then
v.Value = 100
end
end
game.Players.LocalPlayer.stats.other.Notoriet.Name = "Notoriety"
end