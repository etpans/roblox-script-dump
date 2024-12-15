while wait(.5) do
for i, v in pairs(game.Players:GetDescendants()) do
if v.Name == "Notoriety" and v.ClassName == "IntValue" and v.Value < 100 then
v.Value = 100
end
end
end