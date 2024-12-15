-- Made by Pans
game:GetService("Lighting").InventoryBlur.Parent = nil
game:GetService("Lighting").SunRays.Parent = nil
game.Lighting.Changed:connect(function()
game:GetService("Lighting").ClockTime = 12
game:GetService("Lighting").FogEnd = 786543
game:GetService("Lighting").GlobalShadows = false
game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
end)