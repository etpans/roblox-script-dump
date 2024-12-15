-- Made By Pans

-- Fullbright
spawn(function()
local A = Instance.new("PointLight", game.Players.LocalPlayer.Character.Head)
A.Brightness = .3
A.Range = 100
game.Lighting.Changed:connect(function()
game.Lighting.TimeOfDay = "14:00:00"
game.Lighting.Brightness = 2
game.Lighting.FogEnd = 1200000
game.Lighting.GlobalShadows = false
end)
end)

-- Remove Leaves
spawn(function()
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "Leaves" then
v.CFrame = CFrame.new(2147483647,2147483647,2147483647)
end
end
end)

-- Fix Water
spawn(function()
game.Workspace.Terrain.WaterTransparency = 1
game.Workspace.Terrain.WaterRelectance = 0
end)